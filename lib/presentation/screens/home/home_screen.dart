import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/large_button.dart';
import '../../../core/widgets/large_card.dart';
import '../../../core/widgets/score_badge.dart';
import '../../../data/models/day_classification.dart';
import '../../providers/app_providers.dart';
import '../../router/route_names.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _creatingFlow = false;
  bool _dayCompleted = false;

  @override
  void initState() {
    super.initState();
    // Auto-create flow if none exists
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tryCreateFlow();
    });
  }

  Future<void> _tryCreateFlow() async {
    final flow = ref.read(currentFlowProvider).valueOrNull;
    if (flow != null) return; // Flow already exists

    if (_creatingFlow) return;
    setState(() => _creatingFlow = true);

    final service = ref.read(dailyFlowServiceProvider);
    final newFlow = await service.ensureCurrentFlow();

    if (mounted) {
      setState(() {
        _creatingFlow = false;
        _dayCompleted = newFlow == null;
      });
      // Invalidate to refresh the stream
      ref.invalidate(currentFlowProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    final flowAsync = ref.watch(currentFlowProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Appbuelito')),
      body: flowAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (flow) {
          if (flow == null) {
            // Try to create flow automatically
            if (_creatingFlow) {
              return const Center(child: CircularProgressIndicator());
            }

            if (_dayCompleted) {
              return _buildDayCompletedUI(context);
            }

            // Trigger auto-creation
            Future.microtask(() => _tryCreateFlow());
            return const Center(child: CircularProgressIndicator());
          }

          return _buildMainUI(context, flow);
        },
      ),
    );
  }

  Widget _buildDayCompletedUI(BuildContext context) {
    final nextResetHour = AppConstants.dailyResetHour;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 80, color: AppColors.success),
            const SizedBox(height: 24),
            Text(
              'Dia completado',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Has terminado todas las tareas de hoy.\n'
              'Tu nuevo dia empieza a las $nextResetHour:00.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            LargeButton(
              text: 'Ver historial',
              icon: Icons.calendar_today,
              variant: LargeButtonVariant.outlined,
              onPressed: () => context.goNamed(RouteNames.history),
            ),
            const SizedBox(height: 12),
            LargeButton(
              text: 'Registrar inhalador',
              icon: Icons.medication,
              variant: LargeButtonVariant.secondary,
              onPressed: () => context.pushNamed(RouteNames.inhalerRegistry),
            ),
            const SizedBox(height: 12),
            LargeButton(
              text: 'Emergencia',
              icon: Icons.emergency,
              variant: LargeButtonVariant.danger,
              onPressed: () => context.pushNamed(RouteNames.emergency),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainUI(BuildContext context, dynamic flow) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Day status
          if (flow.dayClassification != null) ...[
            Center(
              child: ScoreBadge(
                classification: DayClassification.values.firstWhere(
                  (c) => c.name == flow.dayClassification,
                  orElse: () => DayClassification.green,
                ),
                large: true,
              ),
            ),
            const SizedBox(height: 16),
          ],

          // Greeting
          LargeCard(
            backgroundColor: AppColors.primaryLight.withValues(alpha: 0.1),
            borderColor: AppColors.primary,
            child: Column(
              children: [
                Text(
                  _getGreeting(),
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  _getStatusMessage(flow.status as String),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Next action
          _buildNextAction(context, flow.status as String),

          const SizedBox(height: 16),

          // Quick actions
          Text('Acceso rapido',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),

          LargeCard(
            title: 'Registrar inhalador',
            leadingIcon: Icons.medication,
            trailing: const Icon(Icons.chevron_right, size: 28),
            onTap: () => context.pushNamed(RouteNames.inhalerRegistry),
          ),

          LargeCard(
            title: 'Emergencia',
            leadingIcon: Icons.emergency,
            trailing: const Icon(Icons.chevron_right, size: 28),
            onTap: () => context.pushNamed(RouteNames.emergency),
          ),

          LargeCard(
            title: 'Ver tendencias',
            subtitle: 'Graficas de los ultimos 14 dias',
            leadingIcon: Icons.trending_up,
            trailing: const Icon(Icons.chevron_right, size: 28),
            onTap: () => context.pushNamed(RouteNames.trends),
          ),

          const SizedBox(height: 16),

          // Sync status
          _buildSyncStatus(context),
        ],
      ),
    );
  }

  Widget _buildSyncStatus(BuildContext context) {
    final prefs = ref.watch(appPreferencesProvider);
    final lastSync = prefs.lastSyncAt;
    final syncEnabled = prefs.cloudSyncEnabled;

    if (!syncEnabled) return const SizedBox.shrink();

    final syncText = lastSync != null
        ? 'Sincronizado: ${DateFormat('HH:mm').format(lastSync)}'
        : 'Sin sincronizar';
    final syncIcon = lastSync != null ? Icons.cloud_done : Icons.cloud_off;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(syncIcon, size: 16, color: AppColors.textSecondary),
        const SizedBox(width: 4),
        Text(
          syncText,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondary,
              ),
        ),
      ],
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Buenos dias';
    if (hour < 20) return 'Buenas tardes';
    return 'Buenas noches';
  }

  String _getStatusMessage(String status) {
    switch (status) {
      case 'checklist':
        return 'Vamos a preparar todo para empezar.';
      case 'morningQuestionnaire':
        return 'Cuestionario matutino pendiente.';
      case 'routineActive':
        return 'Tu rutina del dia esta activa.';
      case 'eveningQuestionnaire':
        return 'Es hora de cerrar el dia.';
      default:
        return 'Dia en curso.';
    }
  }

  Widget _buildNextAction(BuildContext context, String status) {
    String text;
    String route;
    IconData icon;

    switch (status) {
      case 'checklist':
        text = 'Preparar el dia';
        route = RouteNames.checklist;
        icon = Icons.checklist;
      case 'morningQuestionnaire':
        text = 'Cuestionario matutino';
        route = RouteNames.morningQuestionnaire;
        icon = Icons.quiz;
      case 'routineActive':
        text = 'Ver rutina del dia';
        route = RouteNames.routineOverview;
        icon = Icons.fitness_center;
      case 'eveningQuestionnaire':
        text = 'Cierre del dia';
        route = RouteNames.eveningQuestionnaire;
        icon = Icons.nightlight;
      default:
        text = 'Ver rutina';
        route = RouteNames.routineOverview;
        icon = Icons.fitness_center;
    }

    return LargeButton(
      text: text,
      icon: icon,
      onPressed: () => context.pushNamed(route),
    );
  }
}
