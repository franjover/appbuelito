import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/large_button.dart';
import '../../../core/widgets/large_card.dart';
import '../../providers/app_providers.dart';
import '../../router/route_names.dart';

class RoutineOverviewScreen extends ConsumerWidget {
  const RoutineOverviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flowAsync = ref.watch(currentFlowProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Rutina del dia')),
      body: flowAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (flow) {
          if (flow == null) {
            return const Center(child: Text('No hay rutina activa'));
          }

          final blocksAsync = ref.watch(routineBlocksProvider(flow.id));
          return blocksAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (blocks) {
              if (blocks.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      'Completa el cuestionario matutino para generar tu rutina.',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }

              final allBlocksDone = blocks.every(
                  (b) => b.status == 'completed' || b.status == 'skipped');

              final blockList = ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: blocks.length,
                itemBuilder: (context, index) {
                  final block = blocks[index];
                  final isCompleted = block.status == 'completed';
                  final isSkipped = block.status == 'skipped';
                  final isActive = block.status == 'active';

                  return LargeCard(
                    backgroundColor: isCompleted
                        ? AppColors.greenDayBg
                        : isSkipped
                            ? AppColors.surfaceVariant
                            : isActive
                                ? AppColors.primaryLight.withValues(alpha: 0.1)
                                : null,
                    borderColor: isActive ? AppColors.primary : null,
                    onTap: isCompleted || isSkipped
                        ? null
                        : () async {
                            final db = ref.read(databaseProvider);
                            await db.dailyFlowDao.updateBlockStatus(
                                block.id, 'active');
                            if (context.mounted) {
                              context.pushNamed(
                                RouteNames.block,
                                pathParameters: {'blockId': '${block.id}'},
                              );
                            }
                          },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              isCompleted
                                  ? Icons.check_circle
                                  : isSkipped
                                      ? Icons.cancel
                                      : Icons.circle_outlined,
                              color: isCompleted
                                  ? AppColors.success
                                  : isSkipped
                                      ? AppColors.disabled
                                      : AppColors.primary,
                              size: 28,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                block.blockName,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            Text(
                              block.scheduledTime,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                            ),
                          ],
                        ),
                        if (block.estimatedDurationMinutes != null) ...[
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              '~${block.estimatedDurationMinutes} minutos',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              );

              return Column(
                children: [
                  Expanded(child: blockList),
                  if (allBlocksDone)
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: LargeButton(
                        text: 'Avanzar al cierre del dia',
                        variant: LargeButtonVariant.success,
                        icon: Icons.nightlight,
                        onPressed: () async {
                          final service = ref.read(dailyFlowServiceProvider);
                          await service.advanceFlowStatus(
                              flow.id, 'eveningQuestionnaire');
                          if (context.mounted) {
                            context.goNamed(RouteNames.home);
                          }
                        },
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
