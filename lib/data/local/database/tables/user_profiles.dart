import 'package:drift/drift.dart';

class UserProfiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get birthDate => dateTime().nullable()();
  TextColumn get sex => text().nullable()();
  RealColumn get height => real().nullable()();
  RealColumn get weight => real().nullable()();
  TextColumn get diagnosis => text().withDefault(const Constant('EPOC'))();
  TextColumn get copdStage => text().nullable()();
  RealColumn get fev1 => real().nullable()();
  BoolColumn get usesOxygen => boolean().withDefault(const Constant(false))();
  BoolColumn get usesPulseOximeter => boolean().withDefault(const Constant(false))();
  TextColumn get regularMedication => text().nullable()();
  TextColumn get rescueInhaler => text().nullable()();
  IntColumn get rescueUsageFrequency => integer().nullable()();
  BoolColumn get wakesUpBreathless => boolean().withDefault(const Constant(false))();
  BoolColumn get snores => boolean().withDefault(const Constant(false))();
  BoolColumn get hasAnxiety => boolean().withDefault(const Constant(false))();
  TextColumn get physicalActivityLevel => text().nullable()();
  BoolColumn get canWalkFlat => boolean().withDefault(const Constant(true))();
  BoolColumn get canClimbStairs => boolean().withDefault(const Constant(false))();
  BoolColumn get makesFrequentPauses => boolean().withDefault(const Constant(false))();
  IntColumn get preferredStartHour => integer().withDefault(const Constant(8))();
  IntColumn get sleepHour => integer().withDefault(const Constant(22))();
  TextColumn get language => text().withDefault(const Constant('es'))();
  TextColumn get techLevel => text().withDefault(const Constant('bajo'))();
  TextColumn get city => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
