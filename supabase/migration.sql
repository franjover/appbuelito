-- =============================================
-- Appbuelito - Supabase Schema Migration
-- Run this in: Supabase Dashboard > SQL Editor
-- =============================================

-- 1. Patient identity (one row per app installation)
CREATE TABLE IF NOT EXISTS patients (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  device_id TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL DEFAULT 'Paciente',
  diagnosis TEXT DEFAULT 'EPOC',
  uses_oxygen BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- 2. Family access codes
CREATE TABLE IF NOT EXISTS family_access (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  patient_id UUID REFERENCES patients(id) ON DELETE CASCADE,
  access_code TEXT UNIQUE NOT NULL,
  label TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now(),
  expires_at TIMESTAMPTZ,
  is_active BOOLEAN DEFAULT TRUE,
  last_accessed_at TIMESTAMPTZ
);

-- 3. Synced daily flows
CREATE TABLE IF NOT EXISTS synced_daily_flows (
  id BIGINT PRIMARY KEY,
  patient_id UUID REFERENCES patients(id) ON DELETE CASCADE,
  flow_date DATE NOT NULL,
  status TEXT NOT NULL DEFAULT 'archived',
  day_classification TEXT,
  morning_score REAL,
  respiratory_stability_score REAL,
  evening_notes TEXT,
  archived_at TIMESTAMPTZ,
  synced_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(patient_id, flow_date)
);

-- 4. Synced inhaler uses
CREATE TABLE IF NOT EXISTS synced_inhaler_uses (
  id BIGINT PRIMARY KEY,
  patient_id UUID REFERENCES patients(id) ON DELETE CASCADE,
  daily_flow_id BIGINT,
  timestamp TIMESTAMPTZ NOT NULL,
  usage_context TEXT NOT NULL,
  puffs INT DEFAULT 1,
  relief_level INT,
  synced_at TIMESTAMPTZ DEFAULT now()
);

-- 5. Synced breathlessness episodes
CREATE TABLE IF NOT EXISTS synced_episodes (
  id BIGINT PRIMARY KEY,
  patient_id UUID REFERENCES patients(id) ON DELETE CASCADE,
  daily_flow_id BIGINT NOT NULL,
  context TEXT,
  intensity INT,
  micro_session_count INT DEFAULT 0,
  improvement TEXT,
  called_family BOOLEAN DEFAULT FALSE,
  escalated_emergency BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ,
  synced_at TIMESTAMPTZ DEFAULT now()
);

-- 6. Synced emergency events
CREATE TABLE IF NOT EXISTS synced_emergency_events (
  id BIGINT PRIMARY KEY,
  patient_id UUID REFERENCES patients(id) ON DELETE CASCADE,
  daily_flow_id BIGINT,
  timestamp TIMESTAMPTZ NOT NULL,
  type TEXT NOT NULL,
  contact_called TEXT,
  result TEXT,
  synced_at TIMESTAMPTZ DEFAULT now()
);

-- 7. Synced symptom checks
CREATE TABLE IF NOT EXISTS synced_symptom_checks (
  id BIGINT PRIMARY KEY,
  patient_id UUID REFERENCES patients(id) ON DELETE CASCADE,
  daily_flow_id BIGINT NOT NULL,
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

-- =============================================
-- Row Level Security
-- =============================================

-- Enable RLS on all tables
ALTER TABLE patients ENABLE ROW LEVEL SECURITY;
ALTER TABLE family_access ENABLE ROW LEVEL SECURITY;
ALTER TABLE synced_daily_flows ENABLE ROW LEVEL SECURITY;
ALTER TABLE synced_inhaler_uses ENABLE ROW LEVEL SECURITY;
ALTER TABLE synced_episodes ENABLE ROW LEVEL SECURITY;
ALTER TABLE synced_emergency_events ENABLE ROW LEVEL SECURITY;
ALTER TABLE synced_symptom_checks ENABLE ROW LEVEL SECURITY;

-- Allow anonymous access for the Flutter app (writes via anon key)
-- The app uses device_id as identity, not Supabase auth
CREATE POLICY "anon_all_patients" ON patients
  FOR ALL USING (true) WITH CHECK (true);

CREATE POLICY "anon_all_family_access" ON family_access
  FOR ALL USING (true) WITH CHECK (true);

CREATE POLICY "anon_all_flows" ON synced_daily_flows
  FOR ALL USING (true) WITH CHECK (true);

CREATE POLICY "anon_all_inhaler" ON synced_inhaler_uses
  FOR ALL USING (true) WITH CHECK (true);

CREATE POLICY "anon_all_episodes" ON synced_episodes
  FOR ALL USING (true) WITH CHECK (true);

CREATE POLICY "anon_all_emergency" ON synced_emergency_events
  FOR ALL USING (true) WITH CHECK (true);

CREATE POLICY "anon_all_symptoms" ON synced_symptom_checks
  FOR ALL USING (true) WITH CHECK (true);

-- =============================================
-- Indexes for common queries
-- =============================================

CREATE INDEX IF NOT EXISTS idx_flows_patient_date
  ON synced_daily_flows(patient_id, flow_date DESC);

CREATE INDEX IF NOT EXISTS idx_inhaler_patient_timestamp
  ON synced_inhaler_uses(patient_id, timestamp DESC);

CREATE INDEX IF NOT EXISTS idx_episodes_patient
  ON synced_episodes(patient_id, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_family_code
  ON family_access(access_code);
