import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../data/local/database/app_database.dart';
import '../../data/local/preferences/app_preferences.dart';
import '../../data/remote/app_update_service.dart';
import '../../data/remote/sync_service.dart';
import '../../domain/services/daily_flow_service.dart';
import '../../domain/services/routine_engine.dart';
import '../../domain/services/emergency_service.dart';
import '../../domain/services/video_source_service.dart';
import '../../domain/services/notification_service.dart';
import '../../domain/services/report_generator_service.dart';
import '../../domain/services/widget_data_service.dart';

/// Database singleton provider.
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

/// SharedPreferences provider (must be overridden at startup).
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be initialized before use');
});

/// AppPreferences provider.
final appPreferencesProvider = Provider<AppPreferences>((ref) {
  return AppPreferences(ref.watch(sharedPreferencesProvider));
});

/// DailyFlowService provider.
final dailyFlowServiceProvider = Provider<DailyFlowService>((ref) {
  return DailyFlowService(
    ref.watch(databaseProvider),
    ref.watch(appPreferencesProvider),
  );
});

/// RoutineEngine provider.
final routineEngineProvider = Provider<RoutineEngine>((ref) {
  return RoutineEngine(ref.watch(databaseProvider), ref.watch(appPreferencesProvider));
});

/// EmergencyService provider.
final emergencyServiceProvider = Provider<EmergencyService>((ref) {
  return EmergencyService(ref.watch(databaseProvider));
});

/// VideoSourceService provider.
final videoSourceServiceProvider = Provider<VideoSourceService>((ref) {
  return VideoSourceService();
});

/// NotificationService provider.
final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

/// Whether onboarding is complete.
final isOnboardingCompleteProvider = Provider<bool>((ref) {
  return ref.watch(appPreferencesProvider).isOnboardingComplete;
});

/// Current daily flow (reactive).
final currentFlowProvider = StreamProvider((ref) {
  final db = ref.watch(databaseProvider);
  return db.dailyFlowDao.watchCurrentFlow();
});

/// Checklist items for a given flow.
final checklistItemsProvider = StreamProvider.family((ref, int flowId) {
  final db = ref.watch(databaseProvider);
  return db.dailyFlowDao.watchChecklistItems(flowId);
});

/// Routine blocks for a given flow.
final routineBlocksProvider = StreamProvider.family((ref, int flowId) {
  final db = ref.watch(databaseProvider);
  return db.dailyFlowDao.watchRoutineBlocks(flowId);
});

/// Emergency contacts.
final emergencyContactsProvider = StreamProvider((ref) {
  final db = ref.watch(databaseProvider);
  return db.userDao.watchEmergencyContacts();
});

/// User profile.
final userProfileProvider = StreamProvider((ref) {
  final db = ref.watch(databaseProvider);
  return db.userDao.watchProfile();
});

/// Rescue inhaler uses for current flow.
final inhalerUsesProvider = StreamProvider.family((ref, int flowId) {
  final db = ref.watch(databaseProvider);
  return db.inhalerDao.watchUsesForFlow(flowId);
});

/// WidgetDataService provider.
final widgetDataServiceProvider = Provider<WidgetDataService>((ref) {
  return WidgetDataService(ref.watch(databaseProvider));
});

/// ReportGeneratorService provider.
final reportGeneratorServiceProvider = Provider<ReportGeneratorService>((ref) {
  return ReportGeneratorService(ref.watch(databaseProvider));
});

/// Supabase client provider (returns null if not initialized).
final supabaseClientProvider = Provider<SupabaseClient?>((ref) {
  try {
    return Supabase.instance.client;
  } catch (_) {
    return null;
  }
});

/// AppUpdateService provider.
final appUpdateServiceProvider = Provider<AppUpdateService?>((ref) {
  final client = ref.watch(supabaseClientProvider);
  if (client == null) return null;
  return AppUpdateService(client);
});

/// PackageInfo provider.
final packageInfoProvider = FutureProvider<PackageInfo>((ref) {
  return PackageInfo.fromPlatform();
});

/// SyncService provider.
final syncServiceProvider = Provider<SyncService?>((ref) {
  final client = ref.watch(supabaseClientProvider);
  if (client == null) return null;
  return SyncService(
    client,
    ref.watch(databaseProvider),
    ref.watch(appPreferencesProvider),
  );
});
