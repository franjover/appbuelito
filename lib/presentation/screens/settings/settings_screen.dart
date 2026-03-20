import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/large_card.dart';
import '../../providers/app_providers.dart';
import '../../router/route_names.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  String _fmt(int h, int m) =>
      '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';

  Future<void> _pickMorningTime() async {
    final prefs = ref.read(appPreferencesProvider);
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: prefs.morningNotifHour, minute: prefs.morningNotifMinute),
      helpText: 'Recordatorio de manana',
    );
    if (picked == null) return;
    await prefs.setMorningNotif(picked.hour, picked.minute);
    final notif = ref.read(notificationServiceProvider);
    await notif.scheduleMorningNotification(
        hour: picked.hour, minute: picked.minute);
    setState(() {});
  }

  Future<void> _pickEveningTime() async {
    final prefs = ref.read(appPreferencesProvider);
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: prefs.eveningNotifHour, minute: prefs.eveningNotifMinute),
      helpText: 'Recordatorio de tarde',
    );
    if (picked == null) return;
    await prefs.setEveningNotif(picked.hour, picked.minute);
    final notif = ref.read(notificationServiceProvider);
    await notif.scheduleEveningReminder(
        hour: picked.hour, minute: picked.minute);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(userProfileProvider);
    final prefs = ref.watch(appPreferencesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Perfil y ajustes')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile summary
            profileAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Error: $e'),
              data: (profile) {
                if (profile == null) return const SizedBox.shrink();
                return LargeCard(
                  leadingIcon: Icons.person,
                  trailing: const Icon(Icons.chevron_right, size: 28),
                  onTap: () => context.pushNamed(RouteNames.editProfile),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(profile.name,
                          style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 4),
                      Text('Diagnostico: ${profile.diagnosis}',
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: 4),
                      Text('Pulsa para editar',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.textSecondary,
                              )),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            LargeCard(
              title: 'Contactos de emergencia',
              leadingIcon: Icons.contacts,
              trailing: const Icon(Icons.chevron_right, size: 28),
              onTap: () => context.pushNamed(RouteNames.contacts),
            ),

            LargeCard(
              title: 'Informe para la familia',
              subtitle: 'Genera y comparte un informe PDF',
              leadingIcon: Icons.picture_as_pdf,
              trailing: const Icon(Icons.chevron_right, size: 28),
              onTap: () => context.pushNamed(RouteNames.report),
            ),

            LargeCard(
              title: 'Acceso familiar remoto',
              subtitle: 'Tu familia puede ver tus datos desde otro dispositivo',
              leadingIcon: Icons.family_restroom,
              trailing: const Icon(Icons.chevron_right, size: 28),
              onTap: () => context.pushNamed(RouteNames.familyAccess),
            ),

            const SizedBox(height: 16),

            // Notification schedule card
            LargeCard(
              leadingIcon: Icons.notifications_active,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Recordatorios',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 12),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.wb_sunny_outlined,
                        color: AppColors.primary),
                    title: const Text('Recordatorio de manana'),
                    subtitle: Text(
                      _fmt(prefs.morningNotifHour, prefs.morningNotifMinute),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: _pickMorningTime,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading:
                        const Icon(Icons.nights_stay, color: AppColors.primary),
                    title: const Text('Recordatorio de tarde'),
                    subtitle: Text(
                      _fmt(prefs.eveningNotifHour, prefs.eveningNotifMinute),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: _pickEveningTime,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // App info — dynamic version
            ref.watch(packageInfoProvider).when(
              data: (info) => Center(
                child: Text(
                  'Appbuelito v${info.version} (${info.buildNumber})',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                ),
              ),
              loading: () => const SizedBox.shrink(),
              error: (_, __) => Center(
                child: Text(
                  'Appbuelito',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                ),
              ),
            ),
            Center(
              child: Text(
                'Esta app no sustituye la atencion medica.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
