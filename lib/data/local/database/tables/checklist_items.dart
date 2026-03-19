import 'package:drift/drift.dart';

class ChecklistItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get dailyFlowId => integer()();
  TextColumn get type => text()();
  TextColumn get name => text()();
  BoolColumn get isRequired => boolean().withDefault(const Constant(false))();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
  DateTimeColumn get completedAt => dateTime().nullable()();
}
