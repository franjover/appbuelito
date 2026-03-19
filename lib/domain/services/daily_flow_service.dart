import 'package:drift/drift.dart';
import '../../core/constants/app_constants.dart';
import '../../data/local/database/app_database.dart';
import '../../data/local/preferences/app_preferences.dart';

/// Orchestrates the daily lifecycle:
/// - 8AM reset and new flow creation
/// - State machine transitions
/// - Flow archival
class DailyFlowService {
  final AppDatabase _db;
  final AppPreferences _prefs;

  DailyFlowService(this._db, this._prefs);

  /// Determines the "flow date" based on the 8AM reset rule.
  /// Before 8AM, the flow date is yesterday.
  static DateTime getFlowDate(DateTime now) {
    if (now.hour < AppConstants.dailyResetHour) {
      return DateTime(now.year, now.month, now.day - 1);
    }
    return DateTime(now.year, now.month, now.day);
  }

  /// Ensures a current flow exists. Archives old ones if needed.
  /// Returns the current DailyFlow, or null if today's flow is already archived
  /// and the next day hasn't started yet (before 8AM reset).
  Future<DailyFlow?> ensureCurrentFlow() async {
    final now = DateTime.now();
    final flowDate = getFlowDate(now);
    final flowDateStr = '${flowDate.year}-${flowDate.month.toString().padLeft(2, '0')}-${flowDate.day.toString().padLeft(2, '0')}';

    // Check if we already have a flow for today's flow date
    final existingFlow = await _db.dailyFlowDao.getFlowByDate(flowDate);
    if (existingFlow != null) {
      // If the flow is still active (not archived), use it
      if (existingFlow.status != 'archived') {
        return existingFlow;
      }
      // Flow is archived — today's flow is done, wait for 8AM reset
      return null;
    }

    // No flow for today — archive any leftover non-archived flows
    final currentFlow = await _db.dailyFlowDao.getCurrentFlow();
    if (currentFlow != null) {
      await _db.dailyFlowDao.archiveFlow(currentFlow.id);
    }

    // Create new flow with error handling for unique constraint
    try {
      final newFlowId = await _db.dailyFlowDao.createFlow(
        DailyFlowsCompanion.insert(
          flowDate: flowDate,
        ),
      );

      // Create checklist items for the new flow
      await _createChecklistItems(newFlowId);

      // Update last flow date
      await _prefs.setLastFlowDate(flowDateStr);

      return (await _db.dailyFlowDao.getFlowByDate(flowDate))!;
    } catch (_) {
      // Unique constraint violation — flow was created by another call
      return await _db.dailyFlowDao.getFlowByDate(flowDate);
    }
  }

  /// Creates the default checklist items for a new daily flow.
  Future<void> _createChecklistItems(int flowId) async {
    final items = <ChecklistItemsCompanion>[];

    // Mandatory items
    for (final name in AppConstants.mandatoryChecklistItems) {
      items.add(ChecklistItemsCompanion.insert(
        dailyFlowId: flowId,
        type: 'mandatory',
        name: name,
        isRequired: const Value(true),
      ));
    }

    // Optional items
    for (final name in AppConstants.optionalChecklistItems) {
      items.add(ChecklistItemsCompanion.insert(
        dailyFlowId: flowId,
        type: 'optional',
        name: name,
        isRequired: const Value(false),
      ));
    }

    await _db.dailyFlowDao.insertChecklistItems(items);
  }

  /// Advances the flow to the next status.
  Future<void> advanceFlowStatus(int flowId, String newStatus) async {
    await _db.dailyFlowDao.updateFlowStatus(flowId, newStatus);
  }

  /// Sets the day classification after the morning questionnaire.
  Future<void> setDayClassification(
      int flowId, String classification, double morningScore) async {
    await ((_db.update(_db.dailyFlows))
          ..where((t) => t.id.equals(flowId)))
        .write(DailyFlowsCompanion(
      dayClassification: Value(classification),
      morningScore: Value(morningScore),
      morningQuestionnaireCompleted: const Value(true),
      status: const Value('routineActive'),
      updatedAt: Value(DateTime.now()),
    ));
  }

  /// Archives the current flow (end of day).
  Future<void> archiveCurrentFlow() async {
    final currentFlow = await _db.dailyFlowDao.getCurrentFlow();
    if (currentFlow != null) {
      await _db.dailyFlowDao.archiveFlow(currentFlow.id);
    }
  }
}
