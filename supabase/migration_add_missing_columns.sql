-- =============================================
-- Appbuelito - Add Missing Columns
-- Run this in Supabase SQL Editor if your DB was created
-- before this fix (tables missing updated_at / last_accessed_at)
-- =============================================

-- 1. Add updated_at to patients (sync_service sends this on every profile sync)
ALTER TABLE patients ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT now();

-- 2. Add last_accessed_at to family_access (RPC functions update this on portal access)
ALTER TABLE family_access ADD COLUMN IF NOT EXISTS last_accessed_at TIMESTAMPTZ;
