import 'package:drift/drift.dart';

class SymptomChecks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get dailyFlowId => integer()();
  TextColumn get moment => text()();
  IntColumn get breathingToday => integer().nullable()();
  IntColumn get fatigue => integer().nullable()();
  IntColumn get cough => integer().nullable()();
  IntColumn get phlegm => integer().nullable()();
  IntColumn get awakenings => integer().nullable()();
  RealColumn get saturation => real().nullable()();
  IntColumn get pulse => integer().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
