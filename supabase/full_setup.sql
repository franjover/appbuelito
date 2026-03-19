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
  synced_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS family_access (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  patient_id UUID REFERENCES patients(id) ON DELETE CASCADE,
  access_code TEXT UNIQUE NOT NULL,
  label TEXT DEFAULT 'Familiar',
  is_active BOOLEAN DEFAULT true,
  expires_at TIMESTAMPTZ,
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
CREATE OR REPLACE FUNCTION get_family_dashboard(access_code_input TEXT)
RETURNS JSON
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  result JSON;
  v_patient_id UUID;
  v_access RECORD;
BEGIN
  -- Validate access code
  SELECT * INTO v_access FROM family_access
  WHERE access_code = access_code_input AND is_active = true
  AND (expires_at IS NULL OR expires_at > now());

  IF v_access IS NULL THEN
    RETURN json_build_object('error', 'invalid_code');
  END IF;

  v_patient_id := v_access.patient_id;

  SELECT json_build_object(
    'patient', (
      SELECT json_build_object(
        'name', p.name,
        'diagnosis', p.diagnosis,
        'uses_oxygen', p.uses_oxygen
      ) FROM patients p WHERE p.id = v_patient_id
    ),
    'flows', COALESCE((
      SELECT json_agg(row_to_json(f) ORDER BY f.flow_date DESC)
      FROM (
        SELECT flow_date, status, day_classification, morning_score,
               respiratory_stability_score, evening_notes, medication_taken, archived_at,
               -- Symptom data from morning check
               (SELECT json_build_object(
                 'breathing', sc.breathing_today,
                 'fatigue', sc.fatigue,
                 'cough', sc.cough,
                 'phlegm', sc.phlegm,
                 'saturation', sc.saturation,
                 'pulse', sc.pulse
               ) FROM synced_symptom_checks sc
               WHERE sc.daily_flow_id = df.id AND sc.moment = 'morning'
               LIMIT 1) as morning_symptoms,
               -- Symptom data from evening check
               (SELECT json_build_object(
                 'breathing', sc.breathing_today,
                 'fatigue', sc.fatigue,
                 'cough', sc.cough
               ) FROM synced_symptom_checks sc
               WHERE sc.daily_flow_id = df.id AND sc.moment = 'evening'
               LIMIT 1) as evening_symptoms
        FROM synced_daily_flows df
        WHERE df.patient_id = v_patient_id
        AND df.flow_date >= (CURRENT_DATE - INTERVAL '14 days')::TEXT
      ) f
    ), '[]'::json),
    'inhaler_uses', COALESCE((
      SELECT json_agg(row_to_json(i) ORDER BY i.timestamp DESC)
      FROM (
        SELECT timestamp, usage_context, puffs, relief_level
        FROM synced_inhaler_uses
        WHERE patient_id = v_patient_id
        AND timestamp >= (now() - INTERVAL '14 days')
      ) i
    ), '[]'::json),
    'inhaler_count', (
      SELECT COALESCE(SUM(puffs), 0)
      FROM synced_inhaler_uses
      WHERE patient_id = v_patient_id
      AND timestamp >= (now() - INTERVAL '14 days')
    ),
    'episodes_count', (
      SELECT COUNT(*)
      FROM synced_episodes
      WHERE patient_id = v_patient_id
      AND created_at >= (now() - INTERVAL '14 days')
    ),
    'emergencies', COALESCE((
      SELECT json_agg(row_to_json(e) ORDER BY e.timestamp DESC)
      FROM (
        SELECT timestamp, type, contact_called, result
        FROM synced_emergency_events
        WHERE patient_id = v_patient_id
        AND timestamp >= (now() - INTERVAL '7 days')
      ) e
    ), '[]'::json),
    'last_device_sync', (
      SELECT MAX(synced_at) FROM synced_daily_flows WHERE patient_id = v_patient_id
    ),
    'last_data_date', (
      SELECT MAX(archived_at) FROM synced_daily_flows WHERE patient_id = v_patient_id
    )
  ) INTO result;

  RETURN result;
END;
$$;

-- Report function: 30-day comprehensive data for PDF generation
CREATE OR REPLACE FUNCTION get_family_report(access_code_input TEXT)
RETURNS JSON
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  result JSON;
  v_patient_id UUID;
  v_access RECORD;
BEGIN
  SELECT * INTO v_access FROM family_access
  WHERE access_code = access_code_input AND is_active = true
  AND (expires_at IS NULL OR expires_at > now());

  IF v_access IS NULL THEN
    RETURN json_build_object('error', 'invalid_code');
  END IF;

  v_patient_id := v_access.patient_id;

  SELECT json_build_object(
    'patient', (
      SELECT json_build_object(
        'name', p.name,
        'diagnosis', p.diagnosis,
        'uses_oxygen', p.uses_oxygen
      ) FROM patients p WHERE p.id = v_patient_id
    ),
    'summary', json_build_object(
      'total_days', (SELECT COUNT(*) FROM synced_daily_flows WHERE patient_id = v_patient_id AND archived_at IS NOT NULL AND flow_date >= (CURRENT_DATE - INTERVAL '30 days')::TEXT),
      'green_days', (SELECT COUNT(*) FROM synced_daily_flows WHERE patient_id = v_patient_id AND day_classification = 'green' AND flow_date >= (CURRENT_DATE - INTERVAL '30 days')::TEXT),
      'yellow_days', (SELECT COUNT(*) FROM synced_daily_flows WHERE patient_id = v_patient_id AND day_classification = 'yellow' AND flow_date >= (CURRENT_DATE - INTERVAL '30 days')::TEXT),
      'red_days', (SELECT COUNT(*) FROM synced_daily_flows WHERE patient_id = v_patient_id AND day_classification = 'red' AND flow_date >= (CURRENT_DATE - INTERVAL '30 days')::TEXT),
      'inhaler_total', (SELECT COALESCE(SUM(puffs), 0) FROM synced_inhaler_uses WHERE patient_id = v_patient_id AND timestamp >= (now() - INTERVAL '30 days')),
      'episodes_total', (SELECT COUNT(*) FROM synced_episodes WHERE patient_id = v_patient_id AND created_at >= (now() - INTERVAL '30 days')),
      'emergencies_total', (SELECT COUNT(*) FROM synced_emergency_events WHERE patient_id = v_patient_id AND timestamp >= (now() - INTERVAL '30 days'))
    ),
    'days', COALESCE((
      SELECT json_agg(row_to_json(d) ORDER BY d.flow_date DESC)
      FROM (
        SELECT df.flow_date, df.day_classification, df.morning_score,
               df.evening_notes, df.medication_taken,
               (SELECT json_build_object(
                 'breathing', sc.breathing_today,
                 'fatigue', sc.fatigue,
                 'cough', sc.cough,
                 'phlegm', sc.phlegm,
                 'saturation', sc.saturation,
                 'pulse', sc.pulse
               ) FROM synced_symptom_checks sc
               WHERE sc.daily_flow_id = df.id AND sc.moment = 'morning'
               LIMIT 1) as symptoms
        FROM synced_daily_flows df
        WHERE df.patient_id = v_patient_id
        AND df.archived_at IS NOT NULL
        AND df.flow_date >= (CURRENT_DATE - INTERVAL '30 days')::TEXT
      ) d
    ), '[]'::json),
    'emergencies', COALESCE((
      SELECT json_agg(row_to_json(e) ORDER BY e.timestamp DESC)
      FROM (
        SELECT timestamp, type, contact_called, result
        FROM synced_emergency_events
        WHERE patient_id = v_patient_id
        AND timestamp >= (now() - INTERVAL '30 days')
      ) e
    ), '[]'::json)
  ) INTO result;

  RETURN result;
END;
$$;

-- Grant execute permissions
GRANT EXECUTE ON FUNCTION get_family_dashboard(TEXT) TO anon;
GRANT EXECUTE ON FUNCTION get_family_dashboard(TEXT) TO authenticated;
GRANT EXECUTE ON FUNCTION get_family_report(TEXT) TO anon;
GRANT EXECUTE ON FUNCTION get_family_report(TEXT) TO authenticated;
