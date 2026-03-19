import 'package:drift/drift.dart';

class ExerciseFeedbacks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get routineTaskId => integer()();
  DateTimeColumn get startedAt => dateTime().nullable()();
  DateTimeColumn get endedAt => dateTime().nullable()();
  TextColumn get completedStatus => text()();
  IntColumn get preExerciseState => integer().nullable()();
  IntColumn get postExerciseState => integer().nullable()();
  IntColumn get breathlessnessLevel => integer().nullable()();
  IntColumn get pauseCount => integer().withDefault(const Constant(0))();
  BoolColumn get rescueInhalerUsed => boolean().withDefault(const Constant(false))();
  TextColumn get rescueInhalerTiming => text().nullable()();
  IntColumn get recoveryMinutes => integer().nullable()();
  IntColumn get perceivedEffort => integer().nullable()();
  TextColumn get toleranceRating => text().nullable()();
  BoolColumn get repeatSameLevelTomorrow => boolean().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
