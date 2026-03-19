import 'package:drift/drift.dart';

class BreathlessnessEpisodes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get dailyFlowId => integer()();
  TextColumn get context => text().nullable()();
  IntColumn get intensity => integer().nullable()();
  BoolColumn get inhalerUsed => boolean().withDefault(const Constant(false))();
  IntColumn get microSessionCount => integer().withDefault(const Constant(0))();
  TextColumn get improvement => text().nullable()();
  IntColumn get durationMinutes => integer().nullable()();
  BoolColumn get calledFamily => boolean().withDefault(const Constant(false))();
  BoolColumn get escalatedEmergency => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
