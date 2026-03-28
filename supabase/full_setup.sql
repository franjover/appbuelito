-- =============================================
-- Appbuelito - FULL DATABASE SETUP
-- Run this ONCE in Supabase SQL Editor
-- Run in your Supabase project's SQL Editor
-- =============================================

-- =============================================
-- 1. CORE TABLES
-- =============================================

CREATE TABLE IF NOT EXISTS patients (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  device_id TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  diagnosis TEXT,
  uses_oxygen BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now(),
  synced_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS family_access (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  patient_id UUID REFERENCES patients(id) ON DELETE CASCADE,
  access_code TEXT UNIQUE NOT NULL,
  label TEXT DEFAULT 'Familiar',
  is_active BOOLEAN DEFAULT true,
  expires_at TIMESTAMPTZ,
  last_accessed_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS synced_daily_flows (
  id TEXT PRIMARY KEY,
  patient_id UUID REFERENCES patients(id) ON DELETE CASCADE,
  flow_date TEXT NOT NULL,
  status TEXT NOT NULL,
  day_classification TEXT,
  morning_score INT,
  respiratory_stability_score REAL,
  evening_notes TEXT,
  medication_taken BOOLEAN,
  archived_at TIMESTAMPTZ,
  synced_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS synced_inhaler_uses (
  id TEXT PRIMARY KEY,
  patient_id UUID REFERENCES patients(id) ON DELETE CASCADE,
  daily_flow_id TEXT REFERENCES synced_daily_flows(id) ON DELETE CASCADE,
  timestamp TIMESTAMPTZ NOT NULL,
  usage_context TEXT,
  puffs INT DEFAULT 1,
  relief_level INT,
  synced_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS synced_episodes (
  id TEXT PRIMARY KEY,
  patient_id UUID REFERENCES patients(id) ON DELETE CASCADE,
  daily_flow_id TEXT REFERENCES synced_daily_flows(id) ON DELETE CASCADE,
  context TEXT,
  intensity INT,
  micro_session_count INT DEFAULT 0,
  improvement BOOLEAN,
  called_family BOOLEAN DEFAULT false,
  escalated_emergency BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ,
  synced_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS synced_emergency_events (
  id TEXT PRIMARY KEY,
  patient_id UUID REFERENCES patients(id) ON DELETE CASCADE,
  daily_flow_id TEXT REFERENCES synced_daily_flows(id) ON DELETE CASCADE,
  timestamp TIMESTAMPTZ NOT NULL,
  type TEXT NOT NULL,
  contact_called TEXT,
  result TEXT,
  synced_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS synced_symptom_checks (
  id TEXT PRIMARY KEY,
  patient_id UUID REFERENCES patients(id) ON DELETE CASCADE,
  daily_flow_id TEXT REFERENCES synced_daily_flows(id) ON DELETE CASCADE,
  moment TEXT NOT NULL,
  breathing_today INT,
  fatigue INT,
  cough INT,
  phlegm INT,
  saturation REAL,
  pulse INT,
  created_at TIMESTAMPTZ,
  synced_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS app_versions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  version_code INT NOT NULL,
  version_name TEXT NOT NULL,
  download_url TEXT NOT NULL,
  release_notes TEXT DEFAULT '',
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- =============================================
-- 2. INDEXES
-- =============================================

CREATE INDEX IF NOT EXISTS idx_flows_patient ON synced_daily_flows(patient_id);
CREATE INDEX IF NOT EXISTS idx_flows_date ON synced_daily_flows(flow_date);
CREATE INDEX IF NOT EXISTS idx_inhaler_patient ON synced_inhaler_uses(patient_id);
CREATE INDEX IF NOT EXISTS idx_episodes_patient ON synced_episodes(patient_id);
CREATE INDEX IF NOT EXISTS idx_emergency_patient ON synced_emergency_events(patient_id);
CREATE INDEX IF NOT EXISTS idx_symptom_patient ON synced_symptom_checks(patient_id);

-- =============================================
-- 3. ROW LEVEL SECURITY
-- =============================================

ALTER TABLE patients ENABLE ROW LEVEL SECURITY;
ALTER TABLE family_access ENABLE ROW LEVEL SECURITY;
ALTER TABLE synced_daily_flows ENABLE ROW LEVEL SECURITY;
ALTER TABLE synced_inhaler_uses ENABLE ROW LEVEL SECURITY;
ALTER TABLE synced_episodes ENABLE ROW LEVEL SECURITY;
ALTER TABLE synced_emergency_events ENABLE ROW LEVEL SECURITY;
ALTER TABLE synced_symptom_checks ENABLE ROW LEVEL SECURITY;
ALTER TABLE app_versions ENABLE ROW LEVEL SECURITY;

-- Patients: app can read/write
CREATE POLICY "anon_all_patients" ON patients FOR ALL USING (true) WITH CHECK (true);

-- Family access: app can read/write
CREATE POLICY "anon_all_family" ON family_access FOR ALL USING (true) WITH CHECK (true);

-- Data tables: app can INSERT, UPDATE, and SELECT (SELECT needed for upsert RETURNING)
CREATE POLICY "anon_insert_flows" ON synced_daily_flows FOR INSERT WITH CHECK (true);
CREATE POLICY "anon_update_flows" ON synced_daily_flows FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "anon_select_flows" ON synced_daily_flows FOR SELECT USING (true);

CREATE POLICY "anon_insert_inhaler" ON synced_inhaler_uses FOR INSERT WITH CHECK (true);
CREATE POLICY "anon_update_inhaler" ON synced_inhaler_uses FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "anon_select_inhaler" ON synced_inhaler_uses FOR SELECT USING (true);

CREATE POLICY "anon_insert_episodes" ON synced_episodes FOR INSERT WITH CHECK (true);
CREATE POLICY "anon_update_episodes" ON synced_episodes FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "anon_select_episodes" ON synced_episodes FOR SELECT USING (true);

CREATE POLICY "anon_insert_emergency" ON synced_emergency_events FOR INSERT WITH CHECK (true);
CREATE POLICY "anon_update_emergency" ON synced_emergency_events FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "anon_select_emergency" ON synced_emergency_events FOR SELECT USING (true);

CREATE POLICY "anon_insert_symptoms" ON synced_symptom_checks FOR INSERT WITH CHECK (true);
CREATE POLICY "anon_update_symptoms" ON synced_symptom_checks FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "anon_select_symptoms" ON synced_symptom_checks FOR SELECT USING (true);

-- App versions: anyone can read
CREATE POLICY "anon_read_versions" ON app_versions FOR SELECT USING (true);

-- =============================================
-- 4. RPC FUNCTIONS (for web portal)
-- =============================================

-- Dashboard function: returns patient data for family portal
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

  -- Symptom checks (last 14 days)
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

  -- Last sync and data timestamps
  SELECT MAX(synced_at) INTO v_last_sync
  FROM synced_daily_flows
  WHERE patient_id = v_patient_id;

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

-- Report function: 30-day comprehensive data for PDF generation
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

-- Grant execute permissions (parameter name doesn't affect signature, TEXT is the type)
GRANT EXECUTE ON FUNCTION get_family_dashboard(TEXT) TO anon;
GRANT EXECUTE ON FUNCTION get_family_dashboard(TEXT) TO authenticated;
GRANT EXECUTE ON FUNCTION get_family_report(TEXT) TO anon;
GRANT EXECUTE ON FUNCTION get_family_report(TEXT) TO authenticated;
