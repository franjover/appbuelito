import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../data/remote/app_update_service.dart';
import '../../providers/app_providers.dart';
import '../../router/route_names.dart';
import '../../../core/theme/app_colors.dart';

/// Splash screen that checks onboarding status and routes accordingly.
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    // Small delay for splash visibility
    await Future.delayed(const Duration(milliseconds: 800));

    if (!mounted) return;

    final isOnboardingDone = ref.read(isOnboardingCompleteProvider);

    if (isOnboardingDone) {
      // Ensure current flow exists
      try {
        final flowService = ref.read(dailyFlowServiceProvider);
        await flowService.ensureCurrentFlow();
      } catch (_) {
        // Flow creation failed — home will handle it
      }

      // Initialize notifications (non-blocking)
      try {
        final notifService = ref.read(notificationServiceProvider);
        await notifService.initialize();
      } catch (_) {
        // Notifications unavailable — continue without them
      }

      // Update home screen widgets
      try {
        final widgetService = ref.read(widgetDataServiceProvider);
        await widgetService.refreshFromCurrentFlow();
      } catch (_) {
        // Widgets unavailable — continue
      }

      // Background cloud sync (non-blocking, fire-and-forget)
      final syncService = ref.read(syncServiceProvider);
      syncService?.syncAll().catchError((_) => null);

      // Check for app updates
      if (mounted) {
        final shouldNavigate = await _checkForUpdates();
        if (!shouldNavigate) return; // Update dialog handled navigation
      }

      if (mounted) context.goNamed(RouteNames.home);
    } else {
      if (mounted) context.goNamed(RouteNames.onboarding);
    }
  }

  /// Returns true if we should continue to home, false if update dialog handles it.
  Future<bool> _checkForUpdates() async {
    try {
      final updateService = ref.read(appUpdateServiceProvider);
      if (updateService == null) return true;

      final update = await updateService.checkForUpdate();
      if (update == null || !mounted) return true;

      return await _showUpdateDialog(update, updateService);
    } catch (_) {
      return true; // On error, continue to home
    }
  }

  Future<bool> _showUpdateDialog(
    AppVersionInfo update,
    AppUpdateService updateService,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('Actualizacion disponible'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nueva version: ${update.versionName}'),
            if (update.releaseNotes.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                update.releaseNotes,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Ahora no'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Actualizar'),
          ),
        ],
      ),
    );

    if (result == true && mounted) {
      await _downloadAndInstall(update, updateService);
      return false; // Don't navigate — install will restart app
    }

    return true; // User declined — continue to home
  }

  Future<void> _downloadAndInstall(
    AppVersionInfo update,
    AppUpdateService updateService,
  ) async {
    final progressNotifier = ValueNotifier<double>(0.0);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => PopScope(
        canPop: false,
        child: AlertDialog(
          title: const Text('Descargando actualizacion...'),
          content: ValueListenableBuilder<double>(
            valueListenable: progressNotifier,
            builder: (_, progress, __) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LinearProgressIndicator(value: progress),
                const SizedBox(height: 12),
                Text('${(progress * 100).toStringAsFixed(0)}%'),
              ],
            ),
          ),
        ),
      ),
    );

    try {
      final path = await updateService.downloadApk(
        update.downloadUrl,
        onProgress: (p) => progressNotifier.value = p,
      );

      if (mounted) Navigator.of(context).pop(); // Close progress dialog

      await updateService.installApk(path);
    } catch (e) {
      if (mounted) {
        Navigator.of(context).pop(); // Close progress dialog
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al descargar la actualizacion')),
        );
      }
    }

    progressNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite,
              size: 80,
              color: Colors.white.withValues(alpha: 0.9),
            ),
            const SizedBox(height: 24),
            Text(
              'Appbuelito',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tu companero de cada dia',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
            ),
            const SizedBox(height: 48),
            const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
