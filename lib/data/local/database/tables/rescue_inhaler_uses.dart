import 'package:drift/drift.dart';

class RescueInhalerUses extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get dailyFlowId => integer().nullable()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get usageContext => text()();
  IntColumn get puffs => integer().withDefault(const Constant(1))();
  IntColumn get reliefLevel => integer().nullable()();
  IntColumn get recoveryMinutes => integer().nullable()();
  TextColumn get activityContext => text().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
