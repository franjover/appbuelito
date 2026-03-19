import 'package:drift/drift.dart';

class RoutineBlocks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get dailyFlowId => integer()();
  IntColumn get blockIndex => integer()();
  TextColumn get blockName => text()();
  TextColumn get scheduledTime => text()();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  IntColumn get estimatedDurationMinutes => integer().nullable()();
  IntColumn get actualDurationMinutes => integer().nullable()();
  IntColumn get perceivedEffort => integer().nullable()();
  DateTimeColumn get completedAt => dateTime().nullable()();
}
