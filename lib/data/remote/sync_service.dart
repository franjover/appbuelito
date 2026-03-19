import 'dart:math';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../local/database/app_database.dart';
import '../local/preferences/app_preferences.dart';

enum SyncStatus { idle, syncing, success, error, offline }

/// One-directional sync: local SQLite -> Supabase (cloud is read-only copy).
class SyncService {
  final SupabaseClient _supabase;
  final AppDatabase _db;
  final AppPreferences _prefs;
  bool _isSyncing = false;

  SyncService(this._supabase, this._db, this._prefs);

  /// Sync all pending data to Supabase.
  Future<SyncStatus> syncAll() async {
    // Prevent concurrent sync calls
    if (_isSyncing) return SyncStatus.idle;
    _isSyncing = true;
    // Check connectivity
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity.contains(ConnectivityResult.none)) {
      return SyncStatus.offline;
    }

    if (!_prefs.cloudSyncEnabled) return SyncStatus.idle;

    try {
      // Ensure patient is registered (skip upsert if already registered)
      final existingId = _prefs.cloudPatientId;
      if (existingId == null) {
        await _ensurePatientRegistered();
      }

      final patientId = _prefs.cloudPatientId;
      if (patientId == null) return SyncStatus.error;

      // Sync each table (always sync ALL data to prevent gaps)
      await _syncFlows(patientId);
      await _syncInhalerUses(patientId);
      await _syncEpisodes(patientId);
      await _syncEmergencyEvents(patientId);
      await _syncSymptomChecks(patientId);
      await _syncPatientProfile(patientId);

      // Update last sync timestamp
      await _prefs.setLastSyncAt(DateTime.now());

      return SyncStatus.success;
    } catch (e) {
      print('[SyncService] syncAll error: $e');
      return SyncStatus.error;
    } finally {
      _isSyncing = false;
    }
  }

  /// Sync a single archived flow and its related data.
  Future<void> syncSingleFlow(int flowId) async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity.contains(ConnectivityResult.none)) return;
    if (!_prefs.cloudSyncEnabled) return;

    final patientId = _prefs.cloudPatientId;
    if (patientId == null) return;

    try {
      final flow = await _db.dailyFlowDao.getFlowById(flowId);
      if (flow == null) return;

      await _upsertFlow(patientId, flow);

      // Sync related data
      final inhalerUses = await _db.inhalerDao.getUsesForFlow(flowId);
      for (final use in inhalerUses) {
        await _upsertInhalerUse(patientId, use);
      }

      final episodes = await _db.symptomDao.getEpisodesForFlow(flowId);
      for (final ep in episodes) {
        await _upsertEpisode(patientId, ep);
      }

      final symptoms = await _db.symptomDao.getSymptomChecksForFlow(flowId);
      for (final s in symptoms) {
        await _upsertSymptomCheck(patientId, s);
      }
    } catch (_) {
      // Silently fail — will retry on next full sync
    }
  }

  /// Register or update patient in Supabase.
  Future<void> _ensurePatientRegistered() async {
    var deviceId = _prefs.cloudDeviceId;
    if (deviceId == null) {
      deviceId = _generateDeviceId();
      await _prefs.setCloudDeviceId(deviceId);
    }

    final profile = await _db.userDao.getProfile();
    final name = profile?.name ?? 'Paciente';
    final diagnosis = profile?.diagnosis ?? 'EPOC';
    final usesOxygen = profile?.usesOxygen ?? false;

    final response = await _supabase.from('patients').upsert(
      {
        'device_id': deviceId,
        'name': name,
        'diagnosis': diagnosis,
        'uses_oxygen': usesOxygen,
        'updated_at': DateTime.now().toIso8601String(),
      },
      onConflict: 'device_id',
    ).select('id').single();

    await _prefs.setCloudPatientId(response['id'] as String);
  }

  // ── Sync methods ──────────────────────────────────────────────

  Future<void> _syncFlows(String patientId) async {
    // Always sync ALL archived flows (not just since lastSync)
    // This ensures updated flows are re-synced too
    final flows = await _db.reportDao.getFlowsForReport(
      DateTime(2020),
      DateTime.now(),
    );
    for (final flow in flows) {
      if (flow.status == 'archived') {
        await _upsertFlow(patientId, flow);
      }
    }
  }

  Future<void> _upsertFlow(String patientId, DailyFlow flow) async {
    await _supabase.from('synced_daily_flows').upsert({
      'id': flow.id,
      'patient_id': patientId,
      'flow_date': flow.flowDate.toIso8601String().split('T')[0],
      'status': flow.status,
      'day_classification': flow.dayClassification,
      'morning_score': flow.morningScore,
      'respiratory_stability_score': flow.respiratoryStabilityScore,
      'evening_notes': flow.eveningNotes,
      'medication_taken': flow.medicationTaken,
      'archived_at': flow.archivedAt?.toIso8601String(),
      'synced_at': DateTime.now().toIso8601String(),
    });
  }

  Future<void> _syncInhalerUses(String patientId) async {
    final uses = await _db.inhalerDao.getUsesForDateRange(
      DateTime(2020),
      DateTime.now(),
    );
    for (final use in uses) {
      await _upsertInhalerUse(patientId, use);
    }
  }

  Future<void> _upsertInhalerUse(
      String patientId, RescueInhalerUse use) async {
    await _supabase.from('synced_inhaler_uses').upsert({
      'id': use.id,
      'patient_id': patientId,
      'daily_flow_id': use.dailyFlowId,
      'timestamp': use.timestamp.toIso8601String(),
      'usage_context': use.usageContext,
      'puffs': use.puffs,
      'relief_level': use.reliefLevel,
      'synced_at': DateTime.now().toIso8601String(),
    });
  }

  Future<void> _syncEpisodes(String patientId) async {
    final episodes = await _db.symptomDao.getEpisodesForDateRange(
      DateTime(2020),
      DateTime.now(),
    );
    for (final ep in episodes) {
      await _upsertEpisode(patientId, ep);
    }
  }

  Future<void> _upsertEpisode(
      String patientId, BreathlessnessEpisode ep) async {
    await _supabase.from('synced_episodes').upsert({
      'id': ep.id,
      'patient_id': patientId,
      'daily_flow_id': ep.dailyFlowId,
      'context': ep.context,
      'intensity': ep.intensity,
      'micro_session_count': ep.microSessionCount,
      'improvement': ep.improvement,
      'called_family': ep.calledFamily,
      'escalated_emergency': ep.escalatedEmergency,
      'created_at': ep.createdAt.toIso8601String(),
      'synced_at': DateTime.now().toIso8601String(),
    });
  }

  Future<void> _syncEmergencyEvents(String patientId) async {
    final events = await _db.reportDao.getEmergencyEventsInRange(
      DateTime(2020),
      DateTime.now(),
    );
    for (final ev in events) {
      await _supabase.from('synced_emergency_events').upsert({
        'id': ev.id,
        'patient_id': patientId,
        'daily_flow_id': ev.dailyFlowId,
        'timestamp': ev.timestamp.toIso8601String(),
        'type': ev.type,
        'contact_called': ev.contactCalled,
        'result': ev.result,
        'synced_at': DateTime.now().toIso8601String(),
      });
    }
  }

  Future<void> _syncSymptomChecks(String patientId) async {
    final checks = await _db.symptomDao.getSymptomChecksForDateRange(
      DateTime(2020),
      DateTime.now(),
    );
    for (final s in checks) {
      await _upsertSymptomCheck(patientId, s);
    }
  }

  Future<void> _upsertSymptomCheck(
      String patientId, SymptomCheck s) async {
    await _supabase.from('synced_symptom_checks').upsert({
      'id': s.id,
      'patient_id': patientId,
      'daily_flow_id': s.dailyFlowId,
      'moment': s.moment,
      'breathing_today': s.breathingToday,
      'fatigue': s.fatigue,
      'cough': s.cough,
      'phlegm': s.phlegm,
      'saturation': s.saturation,
      'pulse': s.pulse,
      'created_at': s.createdAt.toIso8601String(),
      'synced_at': DateTime.now().toIso8601String(),
    });
  }

  Future<void> _syncPatientProfile(String patientId) async {
    final profile = await _db.userDao.getProfile();
    if (profile == null) return;

    await _supabase.from('patients').update({
      'name': profile.name,
      'diagnosis': profile.diagnosis,
      'uses_oxygen': profile.usesOxygen,
      'updated_at': DateTime.now().toIso8601String(),
    }).eq('id', patientId);
  }

  // ── Access code management ───────────────────────────────────

  /// Create a new family access code.
  Future<String> createAccessCode(String label) async {
    final patientId = _prefs.cloudPatientId;
    if (patientId == null) {
      await _ensurePatientRegistered();
    }
    final pid = _prefs.cloudPatientId!;

    final code = _generateAccessCode();

    await _supabase.from('family_access').insert({
      'patient_id': pid,
      'access_code': code,
      'label': label,
      'is_active': true,
    });

    return code;
  }

  /// Get all access codes for the current patient.
  Future<List<Map<String, dynamic>>> getAccessCodes() async {
    final patientId = _prefs.cloudPatientId;
    if (patientId == null) return [];

    final response = await _supabase
        .from('family_access')
        .select()
        .eq('patient_id', patientId)
        .order('created_at', ascending: false);

    return List<Map<String, dynamic>>.from(response);
  }

  /// Toggle an access code active/inactive.
  Future<void> toggleAccessCode(String codeId, bool isActive) async {
    await _supabase
        .from('family_access')
        .update({'is_active': isActive})
        .eq('id', codeId);
  }

  /// Delete an access code.
  Future<void> deleteAccessCode(String codeId) async {
    await _supabase.from('family_access').delete().eq('id', codeId);
  }

  // ── Helpers ──────────────────────────────────────────────────

  String _generateDeviceId() {
    final rng = Random.secure();
    final bytes = List.generate(16, (_) => rng.nextInt(256));
    return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  }

  String _generateAccessCode() {
    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'; // no 0/O/1/I
    final rng = Random.secure();
    final prefix =
        List.generate(3, (_) => chars[rng.nextInt(chars.length)]).join();
    final suffix =
        List.generate(3, (_) => chars[rng.nextInt(chars.length)]).join();
    return '$prefix-$suffix';
  }
}
