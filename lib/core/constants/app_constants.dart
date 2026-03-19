/// Core application constants.
class AppConstants {
  AppConstants._();

  // Daily reset
  static const int dailyResetHour = 8;
  static const int dailyResetMinute = 0;

  // Block schedule (default hours)
  static const String block0Time = '08:30'; // Morning - start
  static const String block1Time = '11:00'; // Mid-morning
  static const String block2Time = '13:00'; // Midday
  static const String block3Time = '16:00'; // Afternoon
  static const String block4Time = '20:00'; // Night

  static const List<String> blockTimes = [
    block0Time,
    block1Time,
    block2Time,
    block3Time,
    block4Time,
  ];

  static const List<String> blockNames = [
    'Inicio del dia',
    'Media manana',
    'Mediodia',
    'Tarde',
    'Noche',
  ];

  // Day classification thresholds (morning questionnaire score)
  static const int greenMaxScore = 10;
  static const int yellowMaxScore = 17;
  // Above yellowMaxScore = red

  // Notification IDs
  static const int morningNotificationId = 1;
  static const int checklistReminderId = 2;
  static const int morningQuestionnaireReminderId = 3;
  static const int eveningQuestionnaireReminderId = 4;
  static const int block0ReminderId = 10;
  static const int block1ReminderId = 11;
  static const int block2ReminderId = 12;
  static const int block3ReminderId = 13;
  static const int block4ReminderId = 14;
  static const int inactivityReminderId = 20;

  // Inactivity threshold (hours without activity before sending reminder)
  static const int inactivityThresholdHours = 4;

  // Choking flow
  static const int breatheInSeconds = 2;
  static const int breatheHoldSeconds = 0;
  static const int breatheOutSeconds = 5;
  static const int microSessionDurationSeconds = 60;
  static const int maxMicroSessions = 3;

  // Emergency
  static const int emergencyLongPressDurationMs = 2000;

  // Exercise adaptation thresholds
  static const int tooHardThreshold = 2; // exercises rated "too hard" to trigger adaptation
  static const int easyThreshold = 3; // consecutive "easy" days to allow progression

  // Checklist items
  static const List<String> mandatoryChecklistItems = [
    'Medicacion',
    'Inhalador',
    'Esterilla',
    'Goma elastica',
    'Bateria del movil',
    'Cargador',
  ];

  static const List<String> optionalChecklistItems = [
    'Agua',
    'Pulsioximetro',
    'Panuelos',
    'Silla estable',
    'Gafas',
    'Telefono con sonido',
    'Zapatos comodos',
  ];
}
