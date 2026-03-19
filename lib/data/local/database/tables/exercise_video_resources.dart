import 'package:drift/drift.dart';

class ExerciseVideoResources extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get videoId => text().unique()();
  TextColumn get title => text()();
  TextColumn get category => text()();
  TextColumn get assetPath => text()();
  IntColumn get estimatedDurationSeconds => integer()();
  TextColumn get shortDescription => text().withDefault(const Constant(''))();
  TextColumn get tags => text().withDefault(const Constant(''))();
  BoolColumn get isAvailable => boolean().withDefault(const Constant(true))();
}
