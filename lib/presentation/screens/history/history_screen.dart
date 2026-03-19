import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/large_card.dart';
import '../../../data/models/day_classification.dart';
import '../../providers/app_providers.dart';
import '../../router/route_names.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Historial')),
      body: FutureBuilder(
        future: db.dailyFlowDao.getArchivedFlows(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final flows = snapshot.data ?? [];
          if (flows.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Todavia no hay dias archivados.\nCompleta tu primer dia para ver el historial.',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          return Column(
            children: [
              // Trends button
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                child: LargeCard(
                  leadingIcon: Icons.trending_up,
                  title: 'Ver tendencias',
                  subtitle: 'Graficos de tu progreso',
                  trailing: const Icon(Icons.chevron_right, size: 28),
                  onTap: () => context.pushNamed(RouteNames.trends),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: flows.length,
                  itemBuilder: (context, index) {
              final flow = flows[index];
              final dateStr = DateFormat('EEEE d MMMM', 'es')
                  .format(flow.flowDate);
              final classification = flow.dayClassification;
              Color? borderColor;
              if (classification == 'green') borderColor = AppColors.greenDay;
              if (classification == 'yellow') borderColor = AppColors.yellowDay;
              if (classification == 'red') borderColor = AppColors.redDay;

              return LargeCard(
                title: dateStr,
                subtitle: classification != null
                    ? DayClassification.values
                        .firstWhere((c) => c.name == classification,
                            orElse: () => DayClassification.green)
                        .displayName
                    : 'Sin clasificar',
                borderColor: borderColor,
                trailing: const Icon(Icons.chevron_right, size: 28),
                onTap: () => context.pushNamed(
                  RouteNames.dayDetail,
                  pathParameters: {'flowId': '${flow.id}'},
                ),
              );
            },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
