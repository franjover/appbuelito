import 'package:drift/drift.dart';

class DailyFlows extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get flowDate => dateTime().unique()();
  TextColumn get status => text().withDefault(const Constant('checklist'))();
  TextColumn get dayClassification => text().nullable()();
  RealColumn get morningScore => real().nullable()();
  RealColumn get respiratoryStabilityScore => real().nullable()();
  TextColumn get eveningNotes => text().nullable()();
  BoolColumn get checklistCompleted => boolean().withDefault(const Constant(false))();
  BoolColumn get morningQuestionnaireCompleted => boolean().withDefault(const Constant(false))();
  BoolColumn get eveningQuestionnaireCompleted => boolean().withDefault(const Constant(false))();
  BoolColumn get medicationTaken => boolean().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get archivedAt => dateTime().nullable()();
}
