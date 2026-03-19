import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/large_card.dart';
import '../../providers/app_providers.dart';

/// Screen showing health trends over time with charts.
class TrendsScreen extends ConsumerStatefulWidget {
  const TrendsScreen({super.key});

  @override
  ConsumerState<TrendsScreen> createState() => _TrendsScreenState();
}

class _TrendsScreenState extends ConsumerState<TrendsScreen> {
  int _days = 7;
  List<_DayData> _data = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _loading = true);
    final db = ref.read(databaseProvider);
    final now = DateTime.now();
    final start = now.subtract(Duration(days: _days));

    final flows = await db.reportDao.getFlowsForReport(start, now);

    final data = <_DayData>[];
    for (final flow in flows) {
      // Count inhaler uses for this flow
      final inhalerUses = flow.id != 0
          ? (await db.inhalerDao.getUsesForFlow(flow.id)).length
          : 0;

      data.add(_DayData(
        date: flow.flowDate,
        classification: flow.dayClassification,
        stabilityScore: flow.respiratoryStabilityScore,
        morningScore: flow.morningScore,
        inhalerUses: inhalerUses,
      ));
    }

    if (mounted) {
      setState(() {
        _data = data;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tendencias')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _data.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      'No hay datos suficientes.\nCompleta algunos dias para ver tendencias.',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Range selector
                      Row(
                        children: [
                          _rangeChip('7 dias', 7),
                          const SizedBox(width: 8),
                          _rangeChip('14 dias', 14),
                          const SizedBox(width: 8),
                          _rangeChip('30 dias', 30),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Classification chart
                      LargeCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Clasificacion diaria',
                                style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 4),
                            Text('Verde = estable, Amarillo = regular, Rojo = mal dia',
                                style: Theme.of(context).textTheme.bodySmall),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 180,
                              child: _buildClassificationChart(),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Stability score chart
                      LargeCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Estabilidad respiratoria',
                                style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 4),
                            Text('Menor = mejor',
                                style: Theme.of(context).textTheme.bodySmall),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 180,
                              child: _buildStabilityChart(),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Inhaler usage chart
                      LargeCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Uso de inhalador de rescate',
                                style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 180,
                              child: _buildInhalerChart(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }

  Widget _rangeChip(String label, int days) {
    return ChoiceChip(
      label: Text(label),
      selected: _days == days,
      onSelected: (_) {
        setState(() => _days = days);
        _loadData();
      },
    );
  }

  Widget _buildClassificationChart() {
    if (_data.isEmpty) return const SizedBox.shrink();

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 3,
        minY: 0,
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              final d = _data[group.x];
              final label = switch (d.classification) {
                'green' => 'Verde',
                'yellow' => 'Amarillo',
                'red' => 'Rojo',
                _ => 'Sin datos',
              };
              return BarTooltipItem(
                '${DateFormat('dd/MM').format(d.date)}\n$label',
                const TextStyle(color: Colors.white, fontSize: 12),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() >= _data.length) return const SizedBox.shrink();
                return Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    DateFormat('dd').format(_data[value.toInt()].date),
                    style: const TextStyle(fontSize: 10),
                  ),
                );
              },
            ),
          ),
          leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: _data.asMap().entries.map((entry) {
          final d = entry.value;
          final color = switch (d.classification) {
            'green' => AppColors.greenDay,
            'yellow' => AppColors.yellowDay,
            'red' => AppColors.redDay,
            _ => AppColors.disabled,
          };
          final y = switch (d.classification) {
            'green' => 1.0,
            'yellow' => 2.0,
            'red' => 3.0,
            _ => 0.5,
          };
          return BarChartGroupData(
            x: entry.key,
            barRods: [
              BarChartRodData(toY: y, color: color, width: 16, borderRadius: BorderRadius.circular(4)),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildStabilityChart() {
    final filtered = _data.where((d) => d.stabilityScore != null).toList();
    if (filtered.isEmpty) {
      return Center(
        child: Text('Sin datos de estabilidad',
            style: Theme.of(context).textTheme.bodyMedium),
      );
    }

    return LineChart(
      LineChartData(
        minY: 0,
        maxY: 25,
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (spots) => spots.map((spot) {
              return LineTooltipItem(
                '${spot.y.toStringAsFixed(0)} pts',
                const TextStyle(color: Colors.white, fontSize: 12),
              );
            }).toList(),
          ),
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final idx = value.toInt();
                if (idx < 0 || idx >= filtered.length) return const SizedBox.shrink();
                return Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    DateFormat('dd').format(filtered[idx].date),
                    style: const TextStyle(fontSize: 10),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                return Text('${value.toInt()}', style: const TextStyle(fontSize: 10));
              },
            ),
          ),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(
          show: true,
          horizontalInterval: 5,
          getDrawingHorizontalLine: (value) => FlLine(
            color: Colors.grey.withValues(alpha: 0.2),
            strokeWidth: 1,
          ),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: filtered.asMap().entries.map((e) {
              return FlSpot(e.key.toDouble(), e.value.stabilityScore!);
            }).toList(),
            isCurved: true,
            color: AppColors.primary,
            barWidth: 3,
            dotData: const FlDotData(show: true),
            belowBarData: BarAreaData(
              show: true,
              color: AppColors.primary.withValues(alpha: 0.1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInhalerChart() {
    if (_data.isEmpty) return const SizedBox.shrink();

    final maxUses = _data.fold<int>(0, (max, d) => d.inhalerUses > max ? d.inhalerUses : max);

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: (maxUses + 1).toDouble(),
        minY: 0,
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() >= _data.length) return const SizedBox.shrink();
                return Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    DateFormat('dd').format(_data[value.toInt()].date),
                    style: const TextStyle(fontSize: 10),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 24,
              getTitlesWidget: (value, meta) {
                if (value != value.roundToDouble()) return const SizedBox.shrink();
                return Text('${value.toInt()}', style: const TextStyle(fontSize: 10));
              },
            ),
          ),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: _data.asMap().entries.map((entry) {
          return BarChartGroupData(
            x: entry.key,
            barRods: [
              BarChartRodData(
                toY: entry.value.inhalerUses.toDouble(),
                color: entry.value.inhalerUses > 0 ? AppColors.danger : AppColors.disabled,
                width: 16,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _DayData {
  final DateTime date;
  final String? classification;
  final double? stabilityScore;
  final double? morningScore;
  final int inhalerUses;

  _DayData({
    required this.date,
    required this.classification,
    required this.stabilityScore,
    required this.morningScore,
    required this.inhalerUses,
  });
}
