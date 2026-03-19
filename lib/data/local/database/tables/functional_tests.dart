import 'package:drift/drift.dart';

class FunctionalTests extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get dailyFlowId => integer()();
  TextColumn get type => text()();
  DateTimeColumn get timestamp => dateTime()();
  IntColumn get pauses => integer().withDefault(const Constant(0))();
  IntColumn get difficulty => integer().nullable()();
  TextColumn get resultText => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
