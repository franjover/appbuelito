import 'package:drift/drift.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/exercise_constants.dart';
import '../../data/local/database/app_database.dart';
import '../../data/local/preferences/app_preferences.dart';
import '../../data/models/day_classification.dart';

/// Rule-based engine that composes the daily routine
/// based on day classification and historical feedback.
class RoutineEngine {
  final AppDatabase _db;
  final AppPreferences _prefs;

  RoutineEngine(this._db, this._prefs);

  /// Generates the full daily routine (5 blocks with tasks)
  /// based on the day classification and recent exercise history.
  Future<void> generateRoutine(int flowId, DayClassification classification) async {
    // Get recent feedback for adaptation
    final recentFeedbacks = await _db.exerciseDao.getRecentFeedbacks(days: 7);
    final shouldReduceIntensity = _shouldReduceIntensity(recentFeedbacks);
    final lastDayExerciseType = await _getLastMainExerciseType();

    final blocks = <RoutineBlocksCompanion>[];
    final tasksByBlock = <int, List<RoutineTasksCompanion>>{};

    switch (classification) {
      case DayClassification.green:
        _buildGreenDay(blocks, tasksByBlock, shouldReduceIntensity, lastDayExerciseType);
      case DayClassification.yellow:
        _buildYellowDay(blocks, tasksByBlock);
      case DayClassification.red:
        _buildRedDay(blocks, tasksByBlock);
    }

    // Insert blocks
    await _db.dailyFlowDao.insertRoutineBlocks(
      blocks.map((b) => b.copyWith(dailyFlowId: Value(flowId))).toList(),
    );

    // Get inserted block IDs
    final insertedBlocks = await _db.dailyFlowDao.getRoutineBlocks(flowId);

    // Insert tasks for each block
    for (var i = 0; i < insertedBlocks.length; i++) {
      final tasks = tasksByBlock[i];
      if (tasks != null && tasks.isNotEmpty) {
        await _db.dailyFlowDao.insertRoutineTasks(
          tasks.map((t) => t.copyWith(
            routineBlockId: Value(insertedBlocks[i].id),
          )).toList(),
        );
      }
    }
  }

  void _buildGreenDay(
    List<RoutineBlocksCompanion> blocks,
    Map<int, List<RoutineTasksCompanion>> tasks,
    bool reduceIntensity,
    String? lastMainExercise,
  ) {
    // Alternate between arms and cardio/legs for variety
    final mainExercise = lastMainExercise == 'arms' ? 'cardioLegs' : 'arms';
    final secondaryExercise = mainExercise == 'arms' ? 'cardioLegs' : 'arms';

    // Block 0: Morning - Breathing
    blocks.add(_block(0, AppConstants.blockNames[0], _prefs.getBlockTime(0), 15));
    tasks[0] = [_task('breathing', 'Respiracion matutina',
        'Ejercicios de respiracion para empezar el dia', 600, 0)];

    // Block 1: Mid-morning - Main exercise
    blocks.add(_block(1, AppConstants.blockNames[1], _prefs.getBlockTime(1), 15));
    final mainConfig = ExerciseConstants.getByCategory(mainExercise);
    tasks[1] = [_task(mainExercise, mainConfig?.title ?? 'Ejercicio principal',
        mainConfig?.shortDescription ?? '', reduceIntensity ? 360 : 480, 0)];

    // Block 2: Midday - Pause + tracking
    blocks.add(_block(2, AppConstants.blockNames[2], _prefs.getBlockTime(2), 10));
    tasks[2] = [_task('breathing', 'Pausa respiratoria',
        'Respiracion breve y registro de estado', 300, 0)];

    // Block 3: Afternoon - Secondary exercise
    blocks.add(_block(3, AppConstants.blockNames[3], _prefs.getBlockTime(3), 15));
    final secConfig = ExerciseConstants.getByCategory(secondaryExercise);
    tasks[3] = [_task(secondaryExercise, secConfig?.title ?? 'Ejercicio secundario',
        secConfig?.shortDescription ?? '', reduceIntensity ? 360 : 480, 0)];

    // Block 4: Night - Relaxation
    blocks.add(_block(4, AppConstants.blockNames[4], _prefs.getBlockTime(4), 15));
    tasks[4] = [_task('relaxation', 'Relajacion nocturna',
        'Ejercicios de relajacion para terminar el dia', 480, 0)];
  }

  void _buildYellowDay(
    List<RoutineBlocksCompanion> blocks,
    Map<int, List<RoutineTasksCompanion>> tasks,
  ) {
    // Block 0: Morning - Breathing
    blocks.add(_block(0, AppConstants.blockNames[0], _prefs.getBlockTime(0), 15));
    tasks[0] = [_task('breathing', 'Respiracion matutina',
        'Ejercicios de respiracion para empezar el dia', 600, 0)];

    // Block 1: Mid-morning - Light breathing + mobility
    blocks.add(_block(1, AppConstants.blockNames[1], _prefs.getBlockTime(1), 10));
    tasks[1] = [_task('breathing', 'Respiracion suave',
        'Respiracion breve y movilidad suave', 300, 0)];

    // Block 2: Midday - Guided pause
    blocks.add(_block(2, AppConstants.blockNames[2], _prefs.getBlockTime(2), 10));
    tasks[2] = [_task('relaxation', 'Pausa guiada',
        'Descanso activo y registro de estado', 300, 0)];

    // Block 3: Afternoon - Brief breathing
    blocks.add(_block(3, AppConstants.blockNames[3], _prefs.getBlockTime(3), 10));
    tasks[3] = [_task('breathing', 'Respiracion breve',
        'Respiracion corta para la tarde', 300, 0)];

    // Block 4: Night - Extended relaxation
    blocks.add(_block(4, AppConstants.blockNames[4], _prefs.getBlockTime(4), 15));
    tasks[4] = [_task('relaxation', 'Relajacion nocturna',
        'Relajacion extendida para cerrar el dia', 600, 0)];
  }

  void _buildRedDay(
    List<RoutineBlocksCompanion> blocks,
    Map<int, List<RoutineTasksCompanion>> tasks,
  ) {
    // Block 0: Morning - Guided breathing (extended)
    blocks.add(_block(0, AppConstants.blockNames[0], _prefs.getBlockTime(0), 20));
    tasks[0] = [_task('breathing', 'Respiracion guiada',
        'Respiracion guiada con calma. Hoy es dia de cuidarte.', 900, 0)];

    // Block 1: Mid-morning - Gentle breathing
    blocks.add(_block(1, AppConstants.blockNames[1], _prefs.getBlockTime(1), 10));
    tasks[1] = [_task('breathing', 'Respiracion suave',
        'Solo respiracion muy suave', 300, 0)];

    // Block 2: Midday - Rest + tracking
    blocks.add(_block(2, AppConstants.blockNames[2], _prefs.getBlockTime(2), 5));
    tasks[2] = [_task('relaxation', 'Descanso',
        'Registro de estado y descanso', 300, 0)];

    // Block 3: Afternoon - Brief relaxation
    blocks.add(_block(3, AppConstants.blockNames[3], _prefs.getBlockTime(3), 10));
    tasks[3] = [_task('relaxation', 'Relajacion breve',
        'Relajacion suave para la tarde', 300, 0)];

    // Block 4: Night - Relaxation
    blocks.add(_block(4, AppConstants.blockNames[4], _prefs.getBlockTime(4), 15));
    tasks[4] = [_task('relaxation', 'Relajacion nocturna',
        'Relajacion para cerrar el dia. Vigila como te encuentras.', 600, 0)];
  }

  bool _shouldReduceIntensity(List<ExerciseFeedback> recentFeedbacks) {
    if (recentFeedbacks.isEmpty) return false;
    final tooHardCount = recentFeedbacks
        .where((f) => f.toleranceRating == 'tooHard' || f.toleranceRating == 'hard')
        .length;
    return tooHardCount >= AppConstants.tooHardThreshold;
  }

  Future<String?> _getLastMainExerciseType() async {
    final recentFeedbacks = await _db.exerciseDao.getRecentFeedbacks(days: 3);
    if (recentFeedbacks.isNotEmpty) {
      // Simplified: would join with routine_tasks in practice
      return null; // Will alternate by default
    }
    return null;
  }

  RoutineBlocksCompanion _block(int index, String name, String time, int estimatedMin) {
    return RoutineBlocksCompanion.insert(
      dailyFlowId: 0, // Will be replaced
      blockIndex: index,
      blockName: name,
      scheduledTime: time,
      estimatedDurationMinutes: Value(estimatedMin),
    );
  }

  RoutineTasksCompanion _task(
      String exerciseType, String title, String description,
      int durationSeconds, int order) {
    final config = ExerciseConstants.getByCategory(exerciseType);
    return RoutineTasksCompanion.insert(
      routineBlockId: 0, // Will be replaced
      exerciseType: exerciseType,
      title: title,
      description: Value(description),
      durationSeconds: durationSeconds,
      videoAssetPath: Value(config?.assetPath),
      orderIndex: Value(order),
    );
  }
}
