/// Classification of the patient's day based on the morning questionnaire.
enum DayClassification {
  green,
  yellow,
  red;

  String get displayName {
    switch (this) {
      case DayClassification.green:
        return 'Dia verde';
      case DayClassification.yellow:
        return 'Dia amarillo';
      case DayClassification.red:
        return 'Dia rojo';
    }
  }

  String get description {
    switch (this) {
      case DayClassification.green:
        return 'Te encuentras bien. Vamos con la rutina completa.';
      case DayClassification.yellow:
        return 'Hoy vas un poco peor. Haremos una rutina mas suave.';
      case DayClassification.red:
        return 'Hoy necesitas descansar. Solo haremos respiracion y relajacion.';
    }
  }
}

/// Status of the daily flow state machine.
enum DailyFlowStatus {
  checklist,
  morningQuestionnaire,
  routineActive,
  eveningQuestionnaire,
  archived;

  String get displayName {
    switch (this) {
      case DailyFlowStatus.checklist:
        return 'Preparacion';
      case DailyFlowStatus.morningQuestionnaire:
        return 'Cuestionario matutino';
      case DailyFlowStatus.routineActive:
        return 'Rutina del dia';
      case DailyFlowStatus.eveningQuestionnaire:
        return 'Cierre del dia';
      case DailyFlowStatus.archived:
        return 'Dia archivado';
    }
  }
}

/// Exercise type categories.
enum ExerciseType {
  breathing,
  arms,
  cardioLegs,
  relaxation;

  String get displayName {
    switch (this) {
      case ExerciseType.breathing:
        return 'Respiracion';
      case ExerciseType.arms:
        return 'Brazos';
      case ExerciseType.cardioLegs:
        return 'Cardio y piernas';
      case ExerciseType.relaxation:
        return 'Relajacion';
    }
  }

  String get icon {
    switch (this) {
      case ExerciseType.breathing:
        return 'air';
      case ExerciseType.arms:
        return 'fitness_center';
      case ExerciseType.cardioLegs:
        return 'directions_walk';
      case ExerciseType.relaxation:
        return 'self_improvement';
    }
  }
}

/// Status of a routine block or task.
enum TaskStatus {
  pending,
  active,
  completed,
  skipped;

  String get displayName {
    switch (this) {
      case TaskStatus.pending:
        return 'Pendiente';
      case TaskStatus.active:
        return 'En curso';
      case TaskStatus.completed:
        return 'Completado';
      case TaskStatus.skipped:
        return 'Omitido';
    }
  }
}

/// Completion status for exercise feedback.
enum CompletedStatus {
  full,
  partial,
  skipped;

  String get displayName {
    switch (this) {
      case CompletedStatus.full:
        return 'Completo';
      case CompletedStatus.partial:
        return 'Parcial';
      case CompletedStatus.skipped:
        return 'No lo hice';
    }
  }
}

/// Context for rescue inhaler usage.
enum InhalerContext {
  routine,
  symptomCheck,
  chokingFlow,
  spontaneous;

  String get displayName {
    switch (this) {
      case InhalerContext.routine:
        return 'Durante ejercicio';
      case InhalerContext.symptomCheck:
        return 'Control de sintomas';
      case InhalerContext.chokingFlow:
        return 'Episodio de ahogo';
      case InhalerContext.spontaneous:
        return 'Uso espontaneo';
    }
  }
}

/// Tolerance rating for exercise feedback.
enum ToleranceRating {
  easy,
  manageable,
  hard,
  tooHard;

  String get displayName {
    switch (this) {
      case ToleranceRating.easy:
        return 'Facil';
      case ToleranceRating.manageable:
        return 'Llevadero';
      case ToleranceRating.hard:
        return 'Duro';
      case ToleranceRating.tooHard:
        return 'Demasiado duro';
    }
  }
}
