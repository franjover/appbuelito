import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/symptom_checks.dart';
import '../tables/breathlessness_episodes.dart';
import '../tables/functional_tests.dart';

part 'symptom_dao.g.dart';

@DriftAccessor(tables: [SymptomChecks, BreathlessnessEpisodes, FunctionalTests])
class SymptomDao extends DatabaseAccessor<AppDatabase>
    with _$SymptomDaoMixin {
  SymptomDao(super.db);

  // Symptom checks
  Future<int> insertSymptomCheck(SymptomChecksCompanion check) {
    return into(symptomChecks).insert(check);
  }

  Future<List<SymptomCheck>> getSymptomChecksForFlow(int flowId) {
    return (select(symptomChecks)
          ..where((t) => t.dailyFlowId.equals(flowId))
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
        .get();
  }

  Future<List<SymptomCheck>> getSymptomChecksForDateRange(
      DateTime start, DateTime end) {
    return (select(symptomChecks)
          ..where((t) =>
              t.createdAt.isBiggerOrEqualValue(start) &
              t.createdAt.isSmallerOrEqualValue(end))
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
        .get();
  }

  // Breathlessness episodes
  Future<int> insertEpisode(BreathlessnessEpisodesCompanion episode) {
    return into(breathlessnessEpisodes).insert(episode);
  }

  Future<List<BreathlessnessEpisode>> getEpisodesForFlow(int flowId) {
    return (select(breathlessnessEpisodes)
          ..where((t) => t.dailyFlowId.equals(flowId))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .get();
  }

  Future<List<BreathlessnessEpisode>> getEpisodesForDateRange(
      DateTime start, DateTime end) {
    return (select(breathlessnessEpisodes)
          ..where((t) =>
              t.createdAt.isBiggerOrEqualValue(start) &
              t.createdAt.isSmallerOrEqualValue(end)))
        .get();
  }

  Future<int> countEpisodesForFlow(int flowId) async {
    final count = countAll();
    final query = selectOnly(breathlessnessEpisodes)
      ..addColumns([count])
      ..where(breathlessnessEpisodes.dailyFlowId.equals(flowId));
    final result = await query.getSingle();
    return result.read(count) ?? 0;
  }

  // Functional tests
  Future<int> insertFunctionalTest(FunctionalTestsCompanion test) {
    return into(functionalTests).insert(test);
  }

  Future<List<FunctionalTest>> getFunctionalTestsForFlow(int flowId) {
    return (select(functionalTests)
          ..where((t) => t.dailyFlowId.equals(flowId)))
        .get();
  }
}
