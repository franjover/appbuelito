import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/rescue_inhaler_uses.dart';

part 'inhaler_dao.g.dart';

@DriftAccessor(tables: [RescueInhalerUses])
class InhalerDao extends DatabaseAccessor<AppDatabase>
    with _$InhalerDaoMixin {
  InhalerDao(super.db);

  Future<int> insertUse(RescueInhalerUsesCompanion use) {
    return into(rescueInhalerUses).insert(use);
  }

  Future<List<RescueInhalerUse>> getUsesForFlow(int flowId) {
    return (select(rescueInhalerUses)
          ..where((t) => t.dailyFlowId.equals(flowId))
          ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
        .get();
  }

  Future<int> countUsesToday(int flowId) async {
    final count = countAll();
    final query = selectOnly(rescueInhalerUses)
      ..addColumns([count])
      ..where(rescueInhalerUses.dailyFlowId.equals(flowId));
    final result = await query.getSingle();
    return result.read(count) ?? 0;
  }

  Future<List<RescueInhalerUse>> getUsesForDateRange(
      DateTime start, DateTime end) {
    return (select(rescueInhalerUses)
          ..where((t) =>
              t.timestamp.isBiggerOrEqualValue(start) &
              t.timestamp.isSmallerOrEqualValue(end))
          ..orderBy([(t) => OrderingTerm.asc(t.timestamp)]))
        .get();
  }

  Future<List<RescueInhalerUse>> getRecentUses({int days = 7}) {
    final since = DateTime.now().subtract(Duration(days: days));
    return (select(rescueInhalerUses)
          ..where((t) => t.timestamp.isBiggerOrEqualValue(since))
          ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
        .get();
  }

  Stream<List<RescueInhalerUse>> watchUsesForFlow(int flowId) {
    return (select(rescueInhalerUses)
          ..where((t) => t.dailyFlowId.equals(flowId))
          ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
        .watch();
  }
}
