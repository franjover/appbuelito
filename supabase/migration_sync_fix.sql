-- =============================================
-- Appbuelito - Sync Fix + Dashboard Enriquecido
-- Run this AFTER migration_security.sql in Supabase SQL Editor
-- =============================================

-- 1. Add SELECT policies to data tables (required for PostgREST upsert RETURNING)
-- Use DROP IF EXISTS first to avoid "already exists" error on re-run
DROP POLICY IF EXISTS "flows_select" ON synced_daily_flows;
CREATE POLICY "flows_select" ON synced_daily_flows FOR SELECT USING (true);

DROP POLICY IF EXISTS "inhaler_select" ON synced_inhaler_uses;
CREATE POLICY "inhaler_select" ON synced_inhaler_uses FOR SELECT USING (true);

DROP POLICY IF EXISTS "episodes_select" ON synced_episodes;
CREATE POLICY "episodes_select" ON synced_episodes FOR SELECT USING (true);

DROP POLICY IF EXISTS "emergency_select" ON synced_emergency_events;
CREATE POLICY "emergency_select" ON synced_emergency_events FOR SELECT USING (true);

DROP POLICY IF EXISTS "symptoms_select" ON synced_symptom_checks;
CREATE POLICY "symptoms_select" ON synced_symptom_checks FOR SELECT USING (true);

-- 2. Add medication_taken column to daily flows
ALTER TABLE synced_daily_flows ADD COLUMN IF NOT EXISTS medication_taken BOOLEAN;

-- 3. Replace get_family_dashboard with enriched version (includes symptom details)
CREATE OR REPLACE FUNCTION get_family_dashboard(p_access_code TEXT)
RETURNS JSON
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_patient_id UUID;
  v_patient JSON;
  v_flows JSON;
  v_symptoms JSON;
  v_inhaler JSON;
  v_inhaler_count INT;
  v_episodes_count INT;
  v_emergencies JSON;
  v_last_sync TIMESTAMPTZ;
  v_last_data TIMESTAMPTZ;
BEGIN
  -- Validate access code
  SELECT fa.patient_id INTO v_patient_id
  FROM family_access fa
  WHERE fa.access_code = UPPER(p_access_code)
    AND fa.is_active = true
    AND (fa.expires_at IS NULL OR fa.expires_at > now());

  IF v_patient_id IS NULL THEN
    RETURN json_build_object('error', 'Codigo no valido o expirado');
  END IF;

  -- Update last accessed
  UPDATE family_access SET last_accessed_at = now()
  WHERE access_code = UPPER(p_access_code);

  -- Patient info
  SELECT json_build_object(
    'name', p.name,
    'diagnosis', p.diagnosis,
    'uses_oxygen', p.uses_oxygen
  ) INTO v_patient
  FROM patients p WHERE p.id = v_patient_id;

  -- Daily flows (last 14 days) with medication
  SELECT COALESCE(json_agg(json_build_object(
    'flow_date', f.flow_date,
    'status', f.status,
    'day_classification', f.day_classification,
    'morning_score', f.morning_score,
    'respiratory_stability_score', f.respiratory_stability_score,
    'evening_notes', f.evening_notes,
    'medication_taken', f.medication_taken,
    'archived_at', f.archived_at,
    'synced_at', f.synced_at
  ) ORDER BY f.flow_date DESC), '[]'::json)
  INTO v_flows
  FROM synced_daily_flows f
  WHERE f.patient_id = v_patient_id
    AND f.flow_date >= CURRENT_DATE - INTERVAL '14 days';

  -- Symptom checks (last 14 days) - morning and evening details
  SELECT COALESCE(json_agg(json_build_object(
    'daily_flow_id', s.daily_flow_id,
    'moment', s.moment,
    'breathing_today', s.breathing_today,
    'fatigue', s.fatigue,
    'cough', s.cough,
    'phlegm', s.phlegm,
    'saturation', s.saturation,
    'pulse', s.pulse,
    'created_at', s.created_at
  ) ORDER BY s.created_at DESC), '[]'::json)
  INTO v_symptoms
  FROM synced_symptom_checks s
  WHERE s.patient_id = v_patient_id
    AND s.created_at >= CURRENT_DATE - INTERVAL '14 days';

  -- Inhaler uses (last 7 days) with detail
  SELECT COUNT(*) INTO v_inhaler_count
  FROM synced_inhaler_uses
  WHERE patient_id = v_patient_id
    AND timestamp >= now() - INTERVAL '7 days';

  SELECT COALESCE(json_agg(json_build_object(
    'timestamp', i.timestamp,
    'usage_context', i.usage_context,
    'puffs', i.puffs,
    'relief_level', i.relief_level
  ) ORDER BY i.timestamp DESC), '[]'::json)
  INTO v_inhaler
  FROM synced_inhaler_uses i
  WHERE i.patient_id = v_patient_id
    AND i.timestamp >= now() - INTERVAL '7 days';

  -- Episodes (last 7 days)
  SELECT COUNT(*) INTO v_episodes_count
  FROM synced_episodes
  WHERE patient_id = v_patient_id
    AND created_at >= now() - INTERVAL '7 days';

  -- Emergency events (last 7 days)
  SELECT COALESCE(json_agg(json_build_object(
    'timestamp', e.timestamp,
    'type', e.type,
    'contact_called', e.contact_called,
    'result', e.result
  ) ORDER BY e.timestamp DESC), '[]'::json)
  INTO v_emergencies
  FROM synced_emergency_events e
  WHERE e.patient_id = v_patient_id
    AND e.timestamp >= now() - INTERVAL '7 days';

  -- Last sync timestamp (most recent synced_at) and last data date (most recent archived_at)
  SELECT MAX(synced_at) INTO v_last_sync
  FROM synced_daily_flows
  WHERE patient_id = v_patient_id;

  -- Last real data: most recent archived_at (doesn't change on re-sync)
  SELECT MAX(archived_at) INTO v_last_data
  FROM synced_daily_flows
  WHERE patient_id = v_patient_id;

  RETURN json_build_object(
    'patient', v_patient,
    'flows', v_flows,
    'symptoms', v_symptoms,
    'inhaler_uses', v_inhaler,
    'inhaler_count', v_inhaler_count,
    'episodes_count', v_episodes_count,
    'emergencies', v_emergencies,
    'last_device_sync', v_last_sync,
    'last_data_date', v_last_data
  );
END;
$$;

-- 4. RPC for full report (30 days, more comprehensive)
CREATE OR REPLACE FUNCTION get_family_report(p_access_code TEXT)
RETURNS JSON
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_patient_id UUID;
  v_patient JSON;
  v_flows JSON;
  v_symptoms JSON;
  v_inhaler_count INT;
  v_episodes_count INT;
  v_emergencies JSON;
  v_classification_counts JSON;
BEGIN
  -- Validate access code
  SELECT fa.patient_id INTO v_patient_id
  FROM family_access fa
  WHERE fa.access_code = UPPER(p_access_code)
    AND fa.is_active = true
    AND (fa.expires_at IS NULL OR fa.expires_at > now());

  IF v_patient_id IS NULL THEN
    RETURN json_build_object('error', 'Codigo no valido o expirado');
  END IF;

  -- Patient info
  SELECT json_build_object(
    'name', p.name,
    'diagnosis', p.diagnosis,
    'uses_oxygen', p.uses_oxygen
  ) INTO v_patient
  FROM patients p WHERE p.id = v_patient_id;

  -- Daily flows (last 30 days)
  SELECT COALESCE(json_agg(json_build_object(
    'flow_date', f.flow_date,
    'day_classification', f.day_classification,
    'morning_score', f.morning_score,
    'respiratory_stability_score', f.respiratory_stability_score,
    'evening_notes', f.evening_notes,
    'medication_taken', f.medication_taken,
    'archived_at', f.archived_at
  ) ORDER BY f.flow_date DESC), '[]'::json)
  INTO v_flows
  FROM synced_daily_flows f
  WHERE f.patient_id = v_patient_id
    AND f.flow_date >= CURRENT_DATE - INTERVAL '30 days';

  -- Symptom checks (last 30 days)
  SELECT COALESCE(json_agg(json_build_object(
    'daily_flow_id', s.daily_flow_id,
    'moment', s.moment,
    'breathing_today', s.breathing_today,
    'fatigue', s.fatigue,
    'cough', s.cough,
    'phlegm', s.phlegm,
    'saturation', s.saturation,
    'pulse', s.pulse,
    'created_at', s.created_at
  ) ORDER BY s.created_at DESC), '[]'::json)
  INTO v_symptoms
  FROM synced_symptom_checks s
  WHERE s.patient_id = v_patient_id
    AND s.created_at >= CURRENT_DATE - INTERVAL '30 days';

  -- Classification counts
  SELECT json_build_object(
    'green', COUNT(*) FILTER (WHERE day_classification = 'green'),
    'yellow', COUNT(*) FILTER (WHERE day_classification = 'yellow'),
    'red', COUNT(*) FILTER (WHERE day_classification = 'red'),
    'total', COUNT(*)
  ) INTO v_classification_counts
  FROM synced_daily_flows
  WHERE patient_id = v_patient_id
    AND flow_date >= CURRENT_DATE - INTERVAL '30 days';

  -- Counts
  SELECT COUNT(*) INTO v_inhaler_count
  FROM synced_inhaler_uses
  WHERE patient_id = v_patient_id
    AND timestamp >= now() - INTERVAL '30 days';

  SELECT COUNT(*) INTO v_episodes_count
  FROM synced_episodes
  WHERE patient_id = v_patient_id
    AND created_at >= now() - INTERVAL '30 days';

  -- Emergencies
  SELECT COALESCE(json_agg(json_build_object(
    'timestamp', e.timestamp,
    'type', e.type,
    'contact_called', e.contact_called,
    'result', e.result
  ) ORDER BY e.timestamp DESC), '[]'::json)
  INTO v_emergencies
  FROM synced_emergency_events e
  WHERE e.patient_id = v_patient_id
    AND e.timestamp >= now() - INTERVAL '30 days';

  RETURN json_build_object(
    'patient', v_patient,
    'flows', v_flows,
    'symptoms', v_symptoms,
    'classification_counts', v_classification_counts,
    'inhaler_count', v_inhaler_count,
    'episodes_count', v_episodes_count,
    'emergencies', v_emergencies
  );
END;
$$;

-- 5. Grant execute permissions
GRANT EXECUTE ON FUNCTION get_family_dashboard(TEXT) TO anon;
GRANT EXECUTE ON FUNCTION get_family_dashboard(TEXT) TO authenticated;
GRANT EXECUTE ON FUNCTION get_family_report(TEXT) TO anon;
GRANT EXECUTE ON FUNCTION get_family_report(TEXT) TO authenticated;
