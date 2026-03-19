import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/large_card.dart';
import '../../../core/widgets/score_badge.dart';
import '../../../data/models/day_classification.dart';
import '../../providers/app_providers.dart';
import 'package:intl/intl.dart';

/// Detailed view of an archived day.
class DayDetailScreen extends ConsumerWidget {
  final int flowId;
  const DayDetailScreen({super.key, required this.flowId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del dia')),
      body: FutureBuilder(
        future: _loadDayData(db),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data;
          if (data == null) {
            return const Center(child: Text('No se encontro el dia'));
          }

          final flow = data['flow'];
          final blocks = data['blocks'] as List? ?? [];
          final inhalerUses = data['inhalerUses'] as List? ?? [];
          final episodes = data['episodes'] as List? ?? [];

          final dateStr = DateFormat('EEEE d MMMM yyyy', 'es')
              .format(flow.flowDate as DateTime);
          final classification = flow.dayClassification as String?;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Date and classification
                Center(
                  child: Text(
                    dateStr,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const SizedBox(height: 12),

                if (classification != null)
                  Center(
                    child: ScoreBadge(
                      classification: DayClassification.values.firstWhere(
                        (c) => c.name == classification,
                        orElse: () => DayClassification.green,
                      ),
                      large: true,
                    ),
                  ),

                const SizedBox(height: 24),

                // Morning score
                if (flow.morningScore != null)
                  LargeCard(
                    leadingIcon: Icons.wb_sunny,
                    title: 'Puntuacion matutina',
                    subtitle: '${(flow.morningScore as double).toStringAsFixed(0)} puntos',
                  ),

                // Respiratory stability
                if (flow.respiratoryStabilityScore != null)
                  LargeCard(
                    leadingIcon: Icons.nightlight,
                    title: 'Estabilidad respiratoria',
                    subtitle:
                        '${(flow.respiratoryStabilityScore as double).toStringAsFixed(0)} puntos',
                  ),

                // Evening notes
                if (flow.eveningNotes != null &&
                    (flow.eveningNotes as String).isNotEmpty)
                  LargeCard(
                    leadingIcon: Icons.note,
                    title: 'Notas del dia',
                    subtitle: flow.eveningNotes as String,
                  ),

                const SizedBox(height: 16),

                // Routine blocks summary
                if (blocks.isNotEmpty) ...[
                  Text('Rutina',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  ...blocks.map((block) {
                    final status = block.status as String;
                    final isCompleted = status == 'completed';
                    return LargeCard(
                      backgroundColor:
                          isCompleted ? AppColors.greenDayBg : null,
                      child: Row(
                        children: [
                          Icon(
                            isCompleted
                                ? Icons.check_circle
                                : status == 'skipped'
                                    ? Icons.cancel
                                    : Icons.circle_outlined,
                            color: isCompleted
                                ? AppColors.success
                                : AppColors.disabled,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              block.blockName as String,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Text(
                            block.scheduledTime as String,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    );
                  }),
                ],

                const SizedBox(height: 16),

                // Inhaler uses
                if (inhalerUses.isNotEmpty) ...[
                  Text('Uso de inhalador (${inhalerUses.length})',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  ...inhalerUses.map((use) => LargeCard(
                        leadingIcon: Icons.medication,
                        title:
                            '${use.puffs} pulsacion${(use.puffs as int) > 1 ? 'es' : ''}',
                        subtitle: DateFormat('HH:mm')
                            .format(use.timestamp as DateTime),
                      )),
                ],

                // Choking episodes
                if (episodes.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text('Episodios de ahogo (${episodes.length})',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.danger,
                          )),
                  const SizedBox(height: 8),
                  ...episodes.map((ep) => LargeCard(
                        borderColor: AppColors.danger,
                        leadingIcon: Icons.warning,
                        title:
                            '${ep.microSessionCount} sesion${(ep.microSessionCount as int) > 1 ? 'es' : ''} de respiracion',
                        subtitle: ep.improvement as String? ?? '',
                      )),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  Future<Map<String, dynamic>> _loadDayData(dynamic db) async {
    final flows = await db.dailyFlowDao.getFlowsInRange(
      DateTime(2000),
      DateTime(2100),
    );
    final flow = flows.firstWhere((f) => f.id == flowId);
    final blocks = await db.dailyFlowDao.getRoutineBlocks(flowId);
    final inhalerUses = await db.inhalerDao.getUsesForFlow(flowId);
    final episodes = await db.symptomDao.getEpisodesForFlow(flowId);

    return {
      'flow': flow,
      'blocks': blocks,
      'inhalerUses': inhalerUses,
      'episodes': episodes,
    };
  }
}
