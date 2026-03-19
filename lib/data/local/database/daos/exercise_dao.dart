import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/exercise_feedbacks.dart';
import '../tables/exercise_video_resources.dart';
import '../tables/activity_logs.dart';

part 'exercise_dao.g.dart';

@DriftAccessor(tables: [ExerciseFeedbacks, ExerciseVideoResources, ActivityLogs])
class ExerciseDao extends DatabaseAccessor<AppDatabase>
    with _$ExerciseDaoMixin {
  ExerciseDao(super.db);

  // Exercise feedback
  Future<int> insertFeedback(ExerciseFeedbacksCompanion feedback) {
    return into(exerciseFeedbacks).insert(feedback);
  }

  Future<ExerciseFeedback?> getFeedbackForTask(int taskId) {
    return (select(exerciseFeedbacks)
          ..where((t) => t.routineTaskId.equals(taskId)))
        .getSingleOrNull();
  }

  Future<List<ExerciseFeedback>> getRecentFeedbacks({int days = 7}) {
    final since = DateTime.now().subtract(Duration(days: days));
    return (select(exerciseFeedbacks)
          ..where((t) => t.createdAt.isBiggerOrEqualValue(since))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .get();
  }

  Future<List<ExerciseFeedback>> getFeedbacksForDateRange(
      DateTime start, DateTime end) {
    return (select(exerciseFeedbacks)
          ..where((t) =>
              t.createdAt.isBiggerOrEqualValue(start) &
              t.createdAt.isSmallerOrEqualValue(end))
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
        .get();
  }

  // Exercise video resources
  Future<List<ExerciseVideoResource>> getAllVideoResources() {
    return select(exerciseVideoResources).get();
  }

  Future<void> upsertVideoResource(ExerciseVideoResourcesCompanion resource) {
    return into(exerciseVideoResources).insertOnConflictUpdate(resource);
  }

  Future<void> seedVideoResources(
      List<ExerciseVideoResourcesCompanion> resources) async {
    await batch((b) {
      for (final r in resources) {
        b.insert(exerciseVideoResources, r, mode: InsertMode.insertOrReplace);
      }
    });
  }

  // Activity logs
  Future<int> insertActivity(ActivityLogsCompanion activity) {
    return into(activityLogs).insert(activity);
  }

  Future<List<ActivityLog>> getActivitiesForDateRange(
      DateTime start, DateTime end) {
    return (select(activityLogs)
          ..where((t) =>
              t.createdAt.isBiggerOrEqualValue(start) &
              t.createdAt.isSmallerOrEqualValue(end))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .get();
  }
}
