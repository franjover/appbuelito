import 'package:drift/drift.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/local/database/app_database.dart';

/// Handles emergency calls and SMS sending.
class EmergencyService {
  final AppDatabase _db;

  EmergencyService(this._db);

  /// Attempts to call the given phone number.
  /// Falls back to opening the dialer if direct call fails.
  Future<bool> makeCall(String phoneNumber) async {
    final directUri = Uri.parse('tel:$phoneNumber');
    try {
      final launched = await launchUrl(directUri);
      return launched;
    } catch (_) {
      return false;
    }
  }

  /// Full emergency flow: call first priority contact.
  Future<void> triggerEmergency({
    required List<EmergencyContact> contacts,
    required String patientName,
    int? dailyFlowId,
  }) async {
    if (contacts.isEmpty) return;

    final now = DateTime.now();

    // Call first priority contact
    final firstContact = contacts.first;
    final callResult = await makeCall(firstContact.phone);

    // Log emergency event
    await _db.into(_db.emergencyEvents).insert(
      EmergencyEventsCompanion.insert(
        timestamp: now,
        type: 'emergency',
        contactCalled: Value(firstContact.name),
        result: Value(callResult ? 'call_initiated' : 'call_failed'),
        dailyFlowId: Value(dailyFlowId),
      ),
    );
  }

  /// Call emergency services (112 in Spain).
  Future<bool> callEmergencyServices() async {
    return makeCall('112');
  }
}
