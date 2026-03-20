import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/app_constants.dart';

/// Wrapper around SharedPreferences for simple app-level flags.
class AppPreferences {
  final SharedPreferences _prefs;

  AppPreferences(this._prefs);

  static const _keyOnboardingComplete = 'onboarding_complete';
  static const _keyLastFlowDate = 'last_flow_date';
  static const _keyPreferredStartHour = 'preferred_start_hour';
  static const _keyMorningNotifHour = 'morning_notif_hour';
  static const _keyMorningNotifMinute = 'morning_notif_minute';
  static const _keyEveningNotifHour = 'evening_notif_hour';
  static const _keyEveningNotifMinute = 'evening_notif_minute';

  bool get isOnboardingComplete =>
      _prefs.getBool(_keyOnboardingComplete) ?? false;

  Future<void> setOnboardingComplete(bool value) =>
      _prefs.setBool(_keyOnboardingComplete, value);

  String? get lastFlowDate => _prefs.getString(_keyLastFlowDate);

  Future<void> setLastFlowDate(String date) =>
      _prefs.setString(_keyLastFlowDate, date);

  int get preferredStartHour =>
      _prefs.getInt(_keyPreferredStartHour) ?? 8;

  Future<void> setPreferredStartHour(int hour) =>
      _prefs.setInt(_keyPreferredStartHour, hour);

  int get morningNotifHour => _prefs.getInt(_keyMorningNotifHour) ?? 8;
  int get morningNotifMinute => _prefs.getInt(_keyMorningNotifMinute) ?? 0;
  int get eveningNotifHour => _prefs.getInt(_keyEveningNotifHour) ?? 20;
  int get eveningNotifMinute => _prefs.getInt(_keyEveningNotifMinute) ?? 30;

  Future<void> setMorningNotif(int hour, int minute) async {
    await _prefs.setInt(_keyMorningNotifHour, hour);
    await _prefs.setInt(_keyMorningNotifMinute, minute);
  }

  Future<void> setEveningNotif(int hour, int minute) async {
    await _prefs.setInt(_keyEveningNotifHour, hour);
    await _prefs.setInt(_keyEveningNotifMinute, minute);
  }

  // ── Block schedule keys ───────────────────────────────────────

  /// Returns the scheduled time for a block (e.g. "08:30").
  /// Falls back to the default from AppConstants.blockTimes.
  String getBlockTime(int index) {
    return _prefs.getString('block_${index}_time') ?? AppConstants.blockTimes[index];
  }

  Future<void> setBlockTime(int index, String time) =>
      _prefs.setString('block_${index}_time', time);

  // ── Cloud sync keys ──────────────────────────────────────────

  static const _keyCloudPatientId = 'cloud_patient_id';
  static const _keyCloudDeviceId = 'cloud_device_id';
  static const _keyLastSyncAt = 'last_cloud_sync_at';
  static const _keyCloudSyncEnabled = 'cloud_sync_enabled';

  String? get cloudPatientId => _prefs.getString(_keyCloudPatientId);
  Future<void> setCloudPatientId(String id) =>
      _prefs.setString(_keyCloudPatientId, id);

  String? get cloudDeviceId => _prefs.getString(_keyCloudDeviceId);
  Future<void> setCloudDeviceId(String id) =>
      _prefs.setString(_keyCloudDeviceId, id);

  DateTime? get lastSyncAt {
    final str = _prefs.getString(_keyLastSyncAt);
    return str != null ? DateTime.tryParse(str) : null;
  }

  Future<void> setLastSyncAt(DateTime dt) =>
      _prefs.setString(_keyLastSyncAt, dt.toIso8601String());

  bool get cloudSyncEnabled => _prefs.getBool(_keyCloudSyncEnabled) ?? true;
  Future<void> setCloudSyncEnabled(bool value) =>
      _prefs.setBool(_keyCloudSyncEnabled, value);
}
