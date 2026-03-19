import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/user_profiles.dart';
import 'tables/emergency_contacts.dart';
import 'tables/daily_flows.dart';
import 'tables/checklist_items.dart';
import 'tables/routine_blocks.dart';
import 'tables/routine_tasks.dart';
import 'tables/exercise_feedbacks.dart';
import 'tables/symptom_checks.dart';
import 'tables/breathlessness_episodes.dart';
import 'tables/rescue_inhaler_uses.dart';
import 'tables/functional_tests.dart';
import 'tables/activity_logs.dart';
import 'tables/emergency_events.dart';
import 'tables/exercise_video_resources.dart';

import 'daos/user_dao.dart';
import 'daos/daily_flow_dao.dart';
import 'daos/exercise_dao.dart';
import 'daos/symptom_dao.dart';
import 'daos/inhaler_dao.dart';
import 'daos/report_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    UserProfiles,
    EmergencyContacts,
    DailyFlows,
    ChecklistItems,
    RoutineBlocks,
    RoutineTasks,
    ExerciseFeedbacks,
    SymptomChecks,
    BreathlessnessEpisodes,
    RescueInhalerUses,
    FunctionalTests,
    ActivityLogs,
    EmergencyEvents,
    ExerciseVideoResources,
  ],
  daos: [
    UserDao,
    DailyFlowDao,
    ExerciseDao,
    SymptomDao,
    InhalerDao,
    ReportDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.addColumn(dailyFlows, dailyFlows.medicationTaken);
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'appbuelito.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
