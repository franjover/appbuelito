import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/theme/app_theme.dart';
import 'data/remote/supabase_config.dart';
import 'presentation/providers/app_providers.dart';
import 'presentation/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Spanish locale for date formatting
  await initializeDateFormatting('es');

  // Lock to portrait mode for simplicity (elderly user)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Initialize SharedPreferences before app starts
  final prefs = await SharedPreferences.getInstance();

  // Initialize Supabase (injected via --dart-define at build time)
  if (SupabaseConfig.isConfigured) {
    try {
      await Supabase.initialize(
        url: SupabaseConfig.url,
        anonKey: SupabaseConfig.anonKey,
      );
    } catch (_) {
      // Supabase init failed — app works offline
    }
  }

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const AppbuelitoApp(),
    ),
  );
}

class AppbuelitoApp extends ConsumerStatefulWidget {
  const AppbuelitoApp({super.key});

  @override
  ConsumerState<AppbuelitoApp> createState() => _AppbuelitoAppState();
}

class _AppbuelitoAppState extends ConsumerState<AppbuelitoApp>
    with WidgetsBindingObserver {
  Timer? _syncTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Auto-sync every 30 minutes
    _syncTimer = Timer.periodic(
      const Duration(minutes: 30),
      (_) => _syncInBackground(),
    );
  }

  @override
  void dispose() {
    _syncTimer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _syncInBackground();
    }
  }

  void _syncInBackground() {
    try {
      final syncService = ref.read(syncServiceProvider);
      syncService?.syncAll();
    } catch (_) {
      // Sync failed silently — will retry
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = createAppRouter();

    return MaterialApp.router(
      title: 'Appbuelito',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
