import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/large_card.dart';
import '../../providers/app_providers.dart';
import '../../router/route_names.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(userProfileProvider);

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
