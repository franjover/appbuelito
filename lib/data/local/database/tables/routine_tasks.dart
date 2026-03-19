import 'package:drift/drift.dart';

class RoutineTasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get routineBlockId => integer()();
  TextColumn get exerciseType => text()();
  TextColumn get title => text()();
  TextColumn get description => text().withDefault(const Constant(''))();
  IntColumn get durationSeconds => integer()();
  TextColumn get videoAssetPath => text().nullable()();
  IntColumn get orderIndex => integer().withDefault(const Constant(0))();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  BoolColumn get postponed => boolean().withDefault(const Constant(false))();
  DateTimeColumn get completedAt => dateTime().nullable()();
}
