import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/daily_flows.dart';
import '../tables/rescue_inhaler_uses.dart';
import '../tables/breathlessness_episodes.dart';
import '../tables/exercise_feedbacks.dart';
import '../tables/emergency_events.dart';

part 'report_dao.g.dart';

@DriftAccessor(tables: [
  DailyFlows,
  RescueInhalerUses,
  BreathlessnessEpisodes,
  ExerciseFeedbacks,
  EmergencyEvents,
])
class ReportDao extends DatabaseAccessor<AppDatabase> with _$ReportDaoMixin {
  ReportDao(super.db);

  /// Get all flows in a date range for report generation.
  Future<List<DailyFlow>> getFlowsForReport(DateTime start, DateTime end) {
    return (select(dailyFlows)
          ..where((t) =>
              t.flowDate.isBiggerOrEqualValue(start) &
              t.flowDate.isSmallerOrEqualValue(end))
          ..orderBy([(t) => OrderingTerm.asc(t.flowDate)]))
        .get();
  }

  /// Count inhaler uses in a date range.
  Future<int> countInhalerUsesInRange(DateTime start, DateTime end) async {
    final count = countAll();
    final query = selectOnly(rescueInhalerUses)
      ..addColumns([count])
      ..where(rescueInhalerUses.timestamp.isBiggerOrEqualValue(start) &
          rescueInhalerUses.timestamp.isSmallerOrEqualValue(end));
    final result = await query.getSingle();
    return result.read(count) ?? 0;
  }

  /// Count breathlessness episodes in a date range.
  Future<int> countEpisodesInRange(DateTime start, DateTime end) async {
    final count = countAll();
    final query = selectOnly(breathlessnessEpisodes)
      ..addColumns([count])
      ..where(breathlessnessEpisodes.createdAt.isBiggerOrEqualValue(start) &
          breathlessnessEpisodes.createdAt.isSmallerOrEqualValue(end));
    final result = await query.getSingle();
    return result.read(count) ?? 0;
  }

  /// Get all exercise feedbacks in a date range.
  Future<List<ExerciseFeedback>> getFeedbacksInRange(
      DateTime start, DateTime end) {
    return (select(exerciseFeedbacks)
          ..where((t) =>
              t.createdAt.isBiggerOrEqualValue(start) &
              t.createdAt.isSmallerOrEqualValue(end)))
        .get();
  }

  /// Get emergency events in a date range.
  Future<List<EmergencyEvent>> getEmergencyEventsInRange(
      DateTime start, DateTime end) {
    return (select(emergencyEvents)
          ..where((t) =>
              t.timestamp.isBiggerOrEqualValue(start) &
              t.timestamp.isSmallerOrEqualValue(end)))
        .get();
  }

  /// Count days by classification in a range.
  Future<Map<String, int>> countDaysByClassification(
      DateTime start, DateTime end) async {
    final flows = await getFlowsForReport(start, end);
    final counts = <String, int>{'green': 0, 'yellow': 0, 'red': 0, 'none': 0};
    for (final flow in flows) {
      final key = flow.dayClassification ?? 'none';
      counts[key] = (counts[key] ?? 0) + 1;
    }
    return counts;
  }
}
