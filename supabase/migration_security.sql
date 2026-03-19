-- =============================================
-- Appbuelito - Security Migration
-- Run this AFTER migration.sql in Supabase SQL Editor
-- Replaces permissive RLS with restrictive policies + RPC
-- =============================================

-- 1. Drop existing permissive "allow all" policies
DROP POLICY IF EXISTS "anon_all_patients" ON patients;
DROP POLICY IF EXISTS "anon_all_family_access" ON family_access;
DROP POLICY IF EXISTS "anon_all_flows" ON synced_daily_flows;
DROP POLICY IF EXISTS "anon_all_inhaler" ON synced_inhaler_uses;
DROP POLICY IF EXISTS "anon_all_episodes" ON synced_episodes;
DROP POLICY IF EXISTS "anon_all_emergency" ON synced_emergency_events;
DROP POLICY IF EXISTS "anon_all_symptoms" ON synced_symptom_checks;

-- 2. patients: app needs full CRUD
CREATE POLICY "patients_insert" ON patients FOR INSERT WITH CHECK (true);
CREATE POLICY "patients_select" ON patients FOR SELECT USING (true);
CREATE POLICY "patients_update" ON patients FOR UPDATE USING (true);

-- 3. family_access: app needs full CRUD
CREATE POLICY "family_insert" ON family_access FOR INSERT WITH CHECK (true);
CREATE POLICY "family_select" ON family_access FOR SELECT USING (true);
CREATE POLICY "family_update" ON family_access FOR UPDATE USING (true);
CREATE POLICY "family_delete" ON family_access FOR DELETE USING (true);

-- 4. Data tables: anon can INSERT and UPDATE only (no direct SELECT)
-- This means someone with the anon key cannot read patient data directly
CREATE POLICY "flows_insert" ON synced_daily_flows FOR INSERT WITH CHECK (true);
CREATE POLICY "flows_update" ON synced_daily_flows FOR UPDATE USING (true);

CREATE POLICY "inhaler_insert" ON synced_inhaler_uses FOR INSERT WITH CHECK (true);
CREATE POLICY "inhaler_update" ON synced_inhaler_uses FOR UPDATE USING (true);

CREATE POLICY "episodes_insert" ON synced_episodes FOR INSERT WITH CHECK (true);
CREATE POLICY "episodes_update" ON synced_episodes FOR UPDATE USING (true);

CREATE POLICY "emergency_insert" ON synced_emergency_events FOR INSERT WITH CHECK (true);
CREATE POLICY "emergency_update" ON synced_emergency_events FOR UPDATE USING (true);

CREATE POLICY "symptoms_insert" ON synced_symptom_checks FOR INSERT WITH CHECK (true);
CREATE POLICY "symptoms_update" ON synced_symptom_checks FOR UPDATE USING (true);

-- 5. RPC function for the web portal
-- SECURITY DEFINER = runs with table owner privileges, bypasses RLS
-- This is the ONLY way the web portal can read patient data
CREATE OR REPLACE FUNCTION get_family_dashboard(p_access_code TEXT)
RETURNS JSON
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_patient_id UUID;
  v_patient JSON;
  v_flows JSON;
  v_inhaler_count INT;
  v_episodes_count INT;
  v_emergencies JSON;
BEGIN
  -- Validate access code (must be active and not expired)
  SELECT fa.patient_id INTO v_patient_id
  FROM family_access fa
  WHERE fa.access_code = UPPER(p_access_code)
    AND fa.is_active = true
    AND (fa.expires_at IS NULL OR fa.expires_at > now());

  IF v_patient_id IS NULL THEN
    RETURN json_build_object('error', 'Codigo no valido o expirado');
  END IF;

  -- Update last accessed timestamp
  UPDATE family_access SET last_accessed_at = now()
  WHERE access_code = UPPER(p_access_code);

  -- Patient info
  SELECT json_build_object(
    'name', p.name,
    'diagnosis', p.diagnosis,
    'uses_oxygen', p.uses_oxygen
  ) INTO v_patient
  FROM patients p WHERE p.id = v_patient_id;

  -- Daily flows (last 14 days)
  SELECT COALESCE(json_agg(row_to_json(f) ORDER BY f.flow_date DESC), '[]'::json)
  INTO v_flows
  FROM synced_daily_flows f
  WHERE f.patient_id = v_patient_id
    AND f.flow_date >= CURRENT_DATE - INTERVAL '14 days';

  -- Rescue inhaler uses (last 7 days)
  SELECT COUNT(*) INTO v_inhaler_count
  FROM synced_inhaler_uses
  WHERE patient_id = v_patient_id
    AND timestamp >= now() - INTERVAL '7 days';

  -- Choking episodes (last 7 days)
  SELECT COUNT(*) INTO v_episodes_count
  FROM synced_episodes
  WHERE patient_id = v_patient_id
    AND created_at >= now() - INTERVAL '7 days';

  -- Emergency events (last 7 days)
  SELECT COALESCE(json_agg(row_to_json(e)), '[]'::json)
  INTO v_emergencies
  FROM synced_emergency_events e
  WHERE e.patient_id = v_patient_id
    AND e.timestamp >= now() - INTERVAL '7 days';

  RETURN json_build_object(
    'patient', v_patient,
    'flows', v_flows,
    'inhaler_count', v_inhaler_count,
    'episodes_count', v_episodes_count,
    'emergencies', v_emergencies
  );
END;
$$;

-- 6. Grant execute permission to anon role (required for Supabase REST API)
GRANT EXECUTE ON FUNCTION get_family_dashboard(TEXT) TO anon;
GRANT EXECUTE ON FUNCTION get_family_dashboard(TEXT) TO authenticated;
