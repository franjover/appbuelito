import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/daily_flows.dart';
import '../tables/checklist_items.dart';
import '../tables/routine_blocks.dart';
import '../tables/routine_tasks.dart';

part 'daily_flow_dao.g.dart';

@DriftAccessor(tables: [DailyFlows, ChecklistItems, RoutineBlocks, RoutineTasks])
class DailyFlowDao extends DatabaseAccessor<AppDatabase>
    with _$DailyFlowDaoMixin {
  DailyFlowDao(super.db);

  // Daily flows
  Future<DailyFlow?> getFlowByDate(DateTime date) {
    return (select(dailyFlows)..where((t) => t.flowDate.equals(date)))
        .getSingleOrNull();
  }

  Future<DailyFlow?> getFlowById(int flowId) {
    return (select(dailyFlows)..where((t) => t.id.equals(flowId)))
        .getSingleOrNull();
  }

  Future<DailyFlow?> getCurrentFlow() async {
    return (select(dailyFlows)
          ..where((t) => t.status.isNotIn(['archived']))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  Stream<DailyFlow?> watchCurrentFlow() {
    return (select(dailyFlows)
          ..where((t) => t.status.isNotIn(['archived']))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
          ..limit(1))
        .watchSingleOrNull();
  }

  Future<int> createFlow(DailyFlowsCompanion flow) {
    return into(dailyFlows).insert(flow);
  }

  Future<bool> updateFlow(DailyFlowsCompanion flow) {
    return update(dailyFlows).replace(flow);
  }

  Future<void> updateFlowStatus(int flowId, String status) {
    return (update(dailyFlows)..where((t) => t.id.equals(flowId))).write(
      DailyFlowsCompanion(
        status: Value(status),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> archiveFlow(int flowId) {
    return (update(dailyFlows)..where((t) => t.id.equals(flowId))).write(
      DailyFlowsCompanion(
        status: const Value('archived'),
        archivedAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<List<DailyFlow>> getArchivedFlows({int limit = 30}) {
    return (select(dailyFlows)
          ..where((t) => t.status.equals('archived'))
          ..orderBy([(t) => OrderingTerm.desc(t.flowDate)])
          ..limit(limit))
        .get();
  }

  Future<List<DailyFlow>> getFlowsInRange(DateTime start, DateTime end) {
    return (select(dailyFlows)
          ..where((t) =>
              t.flowDate.isBiggerOrEqualValue(start) &
              t.flowDate.isSmallerOrEqualValue(end))
          ..orderBy([(t) => OrderingTerm.asc(t.flowDate)]))
        .get();
  }

  // Checklist items
  Future<List<ChecklistItem>> getChecklistItems(int flowId) {
    return (select(checklistItems)
          ..where((t) => t.dailyFlowId.equals(flowId)))
        .get();
  }

  Stream<List<ChecklistItem>> watchChecklistItems(int flowId) {
    return (select(checklistItems)
          ..where((t) => t.dailyFlowId.equals(flowId)))
        .watch();
  }

  Future<void> insertChecklistItems(List<ChecklistItemsCompanion> items) async {
    await batch((b) {
      b.insertAll(checklistItems, items);
    });
  }

  Future<void> toggleChecklistItem(int itemId, bool completed) {
    return (update(checklistItems)..where((t) => t.id.equals(itemId))).write(
      ChecklistItemsCompanion(
        completed: Value(completed),
        completedAt: Value(completed ? DateTime.now() : null),
      ),
    );
  }

  // Routine blocks
  Future<List<RoutineBlock>> getRoutineBlocks(int flowId) {
    return (select(routineBlocks)
          ..where((t) => t.dailyFlowId.equals(flowId))
          ..orderBy([(t) => OrderingTerm.asc(t.blockIndex)]))
        .get();
  }

  Stream<List<RoutineBlock>> watchRoutineBlocks(int flowId) {
    return (select(routineBlocks)
          ..where((t) => t.dailyFlowId.equals(flowId))
          ..orderBy([(t) => OrderingTerm.asc(t.blockIndex)]))
        .watch();
  }

  Future<void> insertRoutineBlocks(List<RoutineBlocksCompanion> blocks) async {
    await batch((b) {
      b.insertAll(routineBlocks, blocks);
    });
  }

  Future<void> updateBlockStatus(int blockId, String status) {
    return (update(routineBlocks)..where((t) => t.id.equals(blockId))).write(
      RoutineBlocksCompanion(
        status: Value(status),
        completedAt: status == 'completed' ? Value(DateTime.now()) : const Value.absent(),
      ),
    );
  }

  // Routine tasks
  Future<List<RoutineTask>> getRoutineTasks(int blockId) {
    return (select(routineTasks)
          ..where((t) => t.routineBlockId.equals(blockId))
          ..orderBy([(t) => OrderingTerm.asc(t.orderIndex)]))
        .get();
  }

  Stream<List<RoutineTask>> watchRoutineTasks(int blockId) {
    return (select(routineTasks)
          ..where((t) => t.routineBlockId.equals(blockId))
          ..orderBy([(t) => OrderingTerm.asc(t.orderIndex)]))
        .watch();
  }

  Future<void> insertRoutineTasks(List<RoutineTasksCompanion> tasks) async {
    await batch((b) {
      b.insertAll(routineTasks, tasks);
    });
  }

  Future<void> updateTaskStatus(int taskId, String status) {
    return (update(routineTasks)..where((t) => t.id.equals(taskId))).write(
      RoutineTasksCompanion(
        status: Value(status),
        completedAt: status == 'completed' ? Value(DateTime.now()) : const Value.absent(),
      ),
    );
  }

  Future<List<RoutineTask>> getAllTasksForFlow(int flowId) async {
    final blocks = await getRoutineBlocks(flowId);
    final allTasks = <RoutineTask>[];
    for (final block in blocks) {
      final tasks = await getRoutineTasks(block.id);
      allTasks.addAll(tasks);
    }
    return allTasks;
  }
}
