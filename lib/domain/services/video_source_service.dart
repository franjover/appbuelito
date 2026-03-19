import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import '../../core/constants/exercise_constants.dart';

/// Abstraction layer for video sources.
/// Today: local assets. Future: remote files or URLs.
abstract class VideoSource {
  Future<bool> isAvailable(String assetPath);
  Future<VideoPlayerController> getController(String assetPath);
}

/// Loads videos from Flutter assets (assets/videos/).
class AssetVideoSource implements VideoSource {
  @override
  Future<bool> isAvailable(String assetPath) async {
    try {
      await rootBundle.load(assetPath);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<VideoPlayerController> getController(String assetPath) async {
    final controller = VideoPlayerController.asset(assetPath);
    await controller.initialize();
    return controller;
  }
}

/// Service that manages video source resolution with fallback.
class VideoSourceService {
  final VideoSource _source;

  VideoSourceService({VideoSource? source})
      : _source = source ?? AssetVideoSource();

  /// Check if a video is available for an exercise category.
  Future<bool> isVideoAvailable(String category) async {
    final config = ExerciseConstants.getByCategory(category);
    if (config == null) return false;
    return _source.isAvailable(config.assetPath);
  }

  /// Get a video controller for an exercise category.
  /// Returns null if the video is not available.
  Future<VideoPlayerController?> getController(String category) async {
    final config = ExerciseConstants.getByCategory(category);
    if (config == null) return null;

    final available = await _source.isAvailable(config.assetPath);
    if (!available) return null;

    return _source.getController(config.assetPath);
  }

  /// Get video config for a category.
  ExerciseVideoConfig? getConfig(String category) {
    return ExerciseConstants.getByCategory(category);
  }
}
