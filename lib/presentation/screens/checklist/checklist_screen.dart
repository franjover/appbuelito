import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/large_button.dart';
import '../../../core/widgets/confirmation_dialog.dart';
import '../../providers/app_providers.dart';
import '../../router/route_names.dart';

class ChecklistScreen extends ConsumerWidget {
  const ChecklistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flowAsync = ref.watch(currentFlowProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Preparacion del dia')),
      body: flowAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (flow) {
          if (flow == null) return const SizedBox.shrink();

          final itemsAsync = ref.watch(checklistItemsProvider(flow.id));
          return itemsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (items) {
              final mandatory = items.where((i) => i.isRequired).toList();
              final optional = items.where((i) => !i.isRequired).toList();
              final allMandatoryDone = mandatory.every((i) => i.completed);
              final missingCritical = mandatory
                  .where((i) => !i.completed &&
                      (i.name == 'Medicacion' || i.name == 'Inhalador'))
                  .toList();

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Comprueba que tienes todo preparado',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 24),

                    // Mandatory items
                    Text('Obligatorio',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: AppColors.danger,
                            )),
                    const SizedBox(height: 8),
                    ...mandatory.map((item) => _ChecklistTile(
                          item: item,
                          onToggle: () async {
                            final db = ref.read(databaseProvider);
                            await db.dailyFlowDao.toggleChecklistItem(
                                item.id, !item.completed);
                          },
                        )),

                    const SizedBox(height: 24),

                    // Optional items
                    Text('Recomendado',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: AppColors.textSecondary,
                            )),
                    const SizedBox(height: 8),
                    ...optional.map((item) => _ChecklistTile(
                          item: item,
                          onToggle: () async {
                            final db = ref.read(databaseProvider);
                            await db.dailyFlowDao.toggleChecklistItem(
                                item.id, !item.completed);
                          },
                        )),

                    const SizedBox(height: 32),

                    // Warning for missing critical items
                    if (missingCritical.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.redDayBg,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.danger, width: 2),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.warning, color: AppColors.danger, size: 32),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Faltan: ${missingCritical.map((i) => i.name).join(', ')}',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppColors.danger,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    const SizedBox(height: 16),

                    // Continue button
                    LargeButton(
                      text: allMandatoryDone
                          ? 'Todo listo, continuar'
                          : 'Continuar de todas formas',
                      variant: allMandatoryDone
                          ? LargeButtonVariant.success
                          : LargeButtonVariant.outlined,
                      onPressed: () async {
                        if (!allMandatoryDone) {
                          final proceed = await showLargeConfirmationDialog(
                            context: context,
                            title: 'Faltan elementos',
                            message: 'No has marcado todo lo obligatorio. '
                                'Puedes continuar, pero queda registrado.',
                            confirmText: 'Continuar',
                            cancelText: 'Volver',
                          );
                          if (!proceed) return;
                        }

                        // Advance flow status
                        final service = ref.read(dailyFlowServiceProvider);
                        await service.advanceFlowStatus(
                            flow.id, 'morningQuestionnaire');

                        if (context.mounted) {
                          context.pushReplacementNamed(
                              RouteNames.morningQuestionnaire);
                        }
                      },
                    ),

                    const SizedBox(height: 12),

                    Center(
                      child: TextButton(
                        onPressed: () async {
                          final service = ref.read(dailyFlowServiceProvider);
                          await service.advanceFlowStatus(
                              flow.id, 'morningQuestionnaire');
                          if (context.mounted) {
                            context.pushReplacementNamed(
                                RouteNames.morningQuestionnaire);
                          }
                        },
                        child: const Text('Lo revisare luego'),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _ChecklistTile extends StatelessWidget {
  final dynamic item;
  final VoidCallback onToggle;

  const _ChecklistTile({required this.item, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    final completed = item.completed as bool;
    final name = item.name as String;
    final required = item.isRequired as bool;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: onToggle,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(
                completed ? Icons.check_circle : Icons.circle_outlined,
                size: 32,
                color: completed
                    ? AppColors.checklistDone
                    : (required
                        ? AppColors.checklistRequired
                        : AppColors.checklistPending),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        decoration:
                            completed ? TextDecoration.lineThrough : null,
                        color: completed
                            ? AppColors.textSecondary
                            : AppColors.textPrimary,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
