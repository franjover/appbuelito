import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/user_profiles.dart';
import '../tables/emergency_contacts.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [UserProfiles, EmergencyContacts])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  // User profile
  Future<UserProfile?> getProfile() async {
    return (select(userProfiles)..limit(1)).getSingleOrNull();
  }

  Stream<UserProfile?> watchProfile() {
    return (select(userProfiles)..limit(1)).watchSingleOrNull();
  }

  Future<int> insertProfile(UserProfilesCompanion profile) {
    return into(userProfiles).insert(profile);
  }

  Future<bool> updateProfile(UserProfilesCompanion profile) {
    return update(userProfiles).replace(
      profile.copyWith(updatedAt: Value(DateTime.now())),
    );
  }

  Future<int> upsertProfile(UserProfilesCompanion profile) {
    return into(userProfiles).insertOnConflictUpdate(profile);
  }

  // Emergency contacts
  Future<List<EmergencyContact>> getEmergencyContacts() {
    return (select(emergencyContacts)
          ..orderBy([(t) => OrderingTerm.asc(t.priority)]))
        .get();
  }

  Stream<List<EmergencyContact>> watchEmergencyContacts() {
    return (select(emergencyContacts)
          ..orderBy([(t) => OrderingTerm.asc(t.priority)]))
        .watch();
  }

  Future<int> insertContact(EmergencyContactsCompanion contact) {
    return into(emergencyContacts).insert(contact);
  }

  Future<bool> updateContact(EmergencyContactsCompanion contact) {
    return update(emergencyContacts).replace(contact);
  }

  Future<int> deleteContact(int contactId) {
    return (delete(emergencyContacts)..where((t) => t.id.equals(contactId)))
        .go();
  }

  Future<void> updateContactPriorities(List<int> contactIds) async {
    await transaction(() async {
      for (var i = 0; i < contactIds.length; i++) {
        await (update(emergencyContacts)
              ..where((t) => t.id.equals(contactIds[i])))
            .write(EmergencyContactsCompanion(priority: Value(i + 1)));
      }
    });
  }

  Future<void> replaceAllContacts(List<EmergencyContactsCompanion> contacts) async {
    await transaction(() async {
      await delete(emergencyContacts).go();
      for (final contact in contacts) {
        await into(emergencyContacts).insert(contact);
      }
    });
  }
}
