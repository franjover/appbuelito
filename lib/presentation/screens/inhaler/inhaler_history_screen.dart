import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/large_card.dart';
import '../../../data/local/database/app_database.dart';
import '../../providers/app_providers.dart';

class InhalerHistoryScreen extends ConsumerStatefulWidget {
  const InhalerHistoryScreen({super.key});

  @override
  ConsumerState<InhalerHistoryScreen> createState() =>
      _InhalerHistoryScreenState();
}

class _InhalerHistoryScreenState extends ConsumerState<InhalerHistoryScreen> {
  List<RescueInhalerUse> _uses = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _loading = true);
    final db = ref.read(databaseProvider);
    final uses = await db.inhalerDao.getRecentUses(days: 90);
    if (mounted) {
      setState(() {
        _uses = uses;
        _loading = false;
      });
    }
  }

  /// Group uses by ISO week (Mon–Sun) for the last 4 weeks.
  List<_WeekData> _buildWeekData() {
    final now = DateTime.now();
    final weeks = <_WeekData>[];
    for (var i = 3; i >= 0; i--) {
      final weekStart = _startOfWeek(now.subtract(Duration(days: i * 7)));
      final weekEnd = weekStart.add(const Duration(days: 6, hours: 23, minutes: 59, seconds: 59));
      final count = _uses.where((u) =>
          u.timestamp.isAfter(weekStart.subtract(const Duration(seconds: 1))) &&
          u.timestamp.isBefore(weekEnd.add(const Duration(seconds: 1)))).length;
      weeks.add(_WeekData(weekStart: weekStart, count: count));
    }
    return weeks;
  }

  DateTime _startOfWeek(DateTime d) {
    final diff = d.weekday - 1;
    return DateTime(d.year, d.month, d.day - diff);
  }

  String _contextLabel(String ctx) {
    switch (ctx) {
      case 'chokingFlow':
        return 'Episodio de ahogo';
      case 'routine':
        return 'Durante ejercicio';
      case 'symptomCheck':
        return 'Control de sintomas';
      default:
        return 'Uso normal';
    }
  }

  String _reliefEmoji(int? level) {
    if (level == null) return '—';
    const emojis = ['😞', '😕', '😐', '😊', '😄'];
    if (level < 1 || level > 5) return '—';
    return emojis[level - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historial de inhalador')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _uses.isEmpty
              ? Center(
                  child: Text(
                    'Sin usos registrados en los ultimos 90 dias.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildWeeklyChart(),
                      const SizedBox(height: 24),
                      Text('Registro detallado',
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 12),
                      ..._uses.map(_buildUseCard),
                    ],
                  ),
                ),
    );
  }

  Widget _buildWeeklyChart() {
    final weeks = _buildWeekData();
    final maxY = weeks.map((w) => w.count).fold(0, (a, b) => a > b ? a : b);

    return LargeCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Usos por semana (4 semanas)',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          SizedBox(
            height: 160,
            child: BarChart(
              BarChartData(
                maxY: (maxY < 4 ? 4 : maxY + 1).toDouble(),
                barGroups: List.generate(weeks.length, (i) {
                  return BarChartGroupData(
                    x: i,
                    barRods: [
                      BarChartRodData(
                        toY: weeks[i].count.toDouble(),
                        color: AppColors.primary,
                        width: 28,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  );
                }),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: (value, meta) {
                        if (value == value.roundToDouble()) {
                          return Text(value.toInt().toString(),
                              style: const TextStyle(fontSize: 12));
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final idx = value.toInt();
                        if (idx < 0 || idx >= weeks.length) {
                          return const SizedBox.shrink();
                        }
                        final label = DateFormat('d/M')
                            .format(weeks[idx].weekStart);
                        return Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(label,
                              style: const TextStyle(fontSize: 11)),
                        );
                      },
                    ),
                  ),
                ),
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUseCard(RescueInhalerUse use) {
    final dateStr = DateFormat('d MMM yyyy · HH:mm', 'es').format(use.timestamp);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: LargeCard(
        leadingIcon: Icons.medication,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dateStr,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                          )),
                  const SizedBox(height: 4),
                  Text(_contextLabel(use.usageContext),
                      style: Theme.of(context).textTheme.titleMedium),
                  Text('${use.puffs} pulsacion${use.puffs == 1 ? '' : 'es'}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.textSecondary,
                            )),
                ],
              ),
            ),
            Text(
              _reliefEmoji(use.reliefLevel),
              style: const TextStyle(fontSize: 28),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeekData {
  final DateTime weekStart;
  final int count;
  const _WeekData({required this.weekStart, required this.count});
}
