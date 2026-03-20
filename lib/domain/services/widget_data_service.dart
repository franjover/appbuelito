import 'package:home_widget/home_widget.dart';
import '../../data/local/database/app_database.dart';

/// Pushes current state to Android home screen widgets via SharedPreferences.
class WidgetDataService {
  final AppDatabase _db;

  WidgetDataService(this._db);

  /// Update widget data based on current flow state.
  Future<void> updateWidgetData({
    String? patientName,
    String? classification,
    String? nextAction,
  }) async {
    if (patientName != null) {
      await HomeWidget.saveWidgetData('widget_patient_name', patientName);
    }
    if (classification != null) {
      await HomeWidget.saveWidgetData('widget_classification', classification);
    }
    if (nextAction != null) {
      await HomeWidget.saveWidgetData('widget_next_action', nextAction);
    }

    // Refresh both widgets
    await HomeWidget.updateWidget(
      androidName: 'StatusWidgetProvider',
    );
  }

  /// Compute and push widget state from current daily flow.
  Future<void> refreshFromCurrentFlow() async {
    final flow = await _db.dailyFlowDao.getCurrentFlow();
    final profile = await _db.userDao.getProfile();

    final name = profile?.name ?? 'Paciente';

    String classLabel = '--';
    String nextAction = 'Sin actividad pendiente';

    if (flow != null) {
      classLabel = switch (flow.dayClassification) {
        'green' => '🟢 Dia verde',
        'yellow' => '🟡 Dia amarillo',
        'red' => '🔴 Dia rojo',
        _ => '--',
      };

      nextAction = switch (flow.status) {
        'checklist' => 'Preparar materiales',
        'morningQuestionnaire' => 'Cuestionario de manana',
        'routineActive' => 'Actividades del dia',
        'eveningQuestionnaire' => 'Cuestionario de tarde',
        'archived' => 'Dia completado',
        _ => 'Sin actividad pendiente',
      };
    }

    await updateWidgetData(
      patientName: name,
      classification: classLabel,
      nextAction: nextAction,
    );
  }
}
