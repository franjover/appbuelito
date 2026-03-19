import 'package:drift/drift.dart';

class EmergencyContacts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  TextColumn get name => text()();
  TextColumn get relationship => text()();
  TextColumn get phone => text()();
  IntColumn get priority => integer().withDefault(const Constant(1))();
  BoolColumn get receivesSms => boolean().withDefault(const Constant(true))();
  BoolColumn get receivesEmail => boolean().withDefault(const Constant(false))();
  TextColumn get email => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
