import 'package:drift/drift.dart';

class ActivityLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().nullable()();
  TextColumn get type => text()();
  TextColumn get title => text()();
  IntColumn get durationMinutes => integer().nullable()();
  IntColumn get perceivedEffort => integer().nullable()();
  TextColumn get source => text().withDefault(const Constant('free'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
