import 'package:drift/drift.dart';

class EmergencyEvents extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().nullable()();
  IntColumn get dailyFlowId => integer().nullable()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get type => text()();
  TextColumn get contactCalled => text().nullable()();
  BoolColumn get smsSent => boolean().withDefault(const Constant(false))();
  TextColumn get result => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
