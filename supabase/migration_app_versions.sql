-- =============================================
-- Appbuelito - App Versions (Auto-update)
-- Run this in Supabase SQL Editor
-- =============================================

-- Table to track published APK versions
CREATE TABLE IF NOT EXISTS app_versions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  version_code INT NOT NULL,
  version_name TEXT NOT NULL,
  download_url TEXT NOT NULL,
  release_notes TEXT DEFAULT '',
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Enable RLS
ALTER TABLE app_versions ENABLE ROW LEVEL SECURITY;

-- Allow anyone to read versions (app needs this to check for updates)
DROP POLICY IF EXISTS "anon_read_versions" ON app_versions;
CREATE POLICY "anon_read_versions" ON app_versions FOR SELECT USING (true);

-- =============================================
-- Setup instructions:
-- 1. Run this SQL in Supabase SQL Editor
-- 2. Create a Storage bucket called "apk-releases" (public)
-- 3. Upload your APK to the bucket
-- 4. Insert a row:
--    INSERT INTO app_versions (version_code, version_name, download_url, release_notes)
--    VALUES (2, '1.1.0', 'https://YOUR_PROJECT.supabase.co/storage/v1/object/public/apk-releases/appbuelito-v1.1.0.apk', 'Mejoras de rendimiento');
-- 5. The app will check on startup and offer to update
-- =============================================
