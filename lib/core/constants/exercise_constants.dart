/// Exercise video resources configuration.
/// Centralized definition of all exercise videos and their metadata.
class ExerciseConstants {
  ExerciseConstants._();

  static const List<ExerciseVideoConfig> allVideos = [
    ExerciseVideoConfig(
      id: 'breathing',
      title: 'Ejercicios de respiracion',
      category: 'breathing',
      assetPath: 'assets/videos/breathing.mp4',
      estimatedDurationSeconds: 600, // 10 min
      shortDescription: 'Ejercicios para mejorar tu respiracion y controlar el ahogo.',
      tags: ['respiracion', 'diafragma', 'relajacion'],
    ),
    ExerciseVideoConfig(
      id: 'arms',
      title: 'Ejercicios para fortalecer brazos',
      category: 'arms',
      assetPath: 'assets/videos/arms.mp4',
      estimatedDurationSeconds: 480, // 8 min
      shortDescription: 'Ejercicios suaves para fortalecer los brazos.',
      tags: ['fuerza', 'brazos', 'goma elastica'],
    ),
    ExerciseVideoConfig(
      id: 'cardio_legs',
      title: 'Ejercicios cardiovasculares y piernas',
      category: 'cardioLegs',
      assetPath: 'assets/videos/cardio_legs.mp4',
      estimatedDurationSeconds: 600, // 10 min
      shortDescription: 'Ejercicios de intensidad media para el corazon y las piernas.',
      tags: ['cardiovascular', 'piernas', 'resistencia'],
    ),
    ExerciseVideoConfig(
      id: 'relaxation',
      title: 'Ejercicios de relajacion',
      category: 'relaxation',
      assetPath: 'assets/videos/relaxation.mp4',
      estimatedDurationSeconds: 480, // 8 min
      shortDescription: 'Ejercicios de relajacion para terminar el dia tranquilo.',
      tags: ['relajacion', 'estiramientos', 'calma'],
    ),
  ];

  static ExerciseVideoConfig? getById(String id) {
    try {
      return allVideos.firstWhere((v) => v.id == id);
    } catch (_) {
      return null;
    }
  }

  static ExerciseVideoConfig? getByCategory(String category) {
    try {
      return allVideos.firstWhere((v) => v.category == category);
    } catch (_) {
      return null;
    }
  }
}

/// Immutable configuration for an exercise video resource.
class ExerciseVideoConfig {
  final String id;
  final String title;
  final String category;
  final String assetPath;
  final int estimatedDurationSeconds;
  final String shortDescription;
  final List<String> tags;

  const ExerciseVideoConfig({
    required this.id,
    required this.title,
    required this.category,
    required this.assetPath,
    required this.estimatedDurationSeconds,
    required this.shortDescription,
    required this.tags,
  });
}
