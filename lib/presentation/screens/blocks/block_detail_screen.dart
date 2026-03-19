import 'dart:async';
import 'package:chewie/chewie.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/large_button.dart';
import '../../../core/widgets/large_card.dart';
import '../../../core/widgets/likert_scale.dart';
import '../../../data/local/database/app_database.dart';
import '../../providers/app_providers.dart';

/// Provider to watch tasks for a specific block.
final blockTasksProvider = StreamProvider.family((ref, int blockId) {
  final db = ref.watch(databaseProvider);
  return db.dailyFlowDao.watchRoutineTasks(blockId);
});

/// Screen to execute the exercises within a routine block.
class BlockDetailScreen extends ConsumerStatefulWidget {
  final int blockId;
  const BlockDetailScreen({super.key, required this.blockId});

  @override
  ConsumerState<BlockDetailScreen> createState() => _BlockDetailScreenState();
}

class _BlockDetailScreenState extends ConsumerState<BlockDetailScreen> {
  int? _activeTaskIndex;
  Timer? _timer;
  int _elapsedSeconds = 0;
  bool _showFeedback = false;
  int? _feedbackTaskId;
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;

  // Feedback form
  String _completedStatus = 'full';
  bool _breathlessDuringExercise = false;
  int? _toleranceRating;
  int _recoverySeconds = 0;

  @override
  void dispose() {
    _timer?.cancel();
    _disposeVideo();
    super.dispose();
  }

  void _disposeVideo() {
    _chewieController?.dispose();
    _videoController?.dispose();
    _chewieController = null;
    _videoController = null;
  }

  Future<void> _initVideo(String exerciseType) async {
    _disposeVideo();
    final videoService = ref.read(videoSourceServiceProvider);
    final controller = await videoService.getController(exerciseType);
    if (controller != null && mounted) {
      _videoController = controller;
      _chewieController = ChewieController(
        videoPlayerController: controller,
        autoPlay: true,
        looping: true,
        showOptions: false,
        materialProgressColors: ChewieProgressColors(
          playedColor: AppColors.primary,
          handleColor: AppColors.primary,
          bufferedColor: AppColors.primaryLight,
        ),
      );
      setState(() {});
    }
  }

  void _startTask(int taskIndex, String exerciseType) {
    _timer?.cancel();
    setState(() {
      _activeTaskIndex = taskIndex;
      _elapsedSeconds = 0;
      _showFeedback = false;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _elapsedSeconds++);
    });
    _initVideo(exerciseType);
  }

  void _finishTask(int taskId) {
    _timer?.cancel();
    _disposeVideo();
    setState(() {
      _showFeedback = true;
      _feedbackTaskId = taskId;
      _completedStatus = 'full';
      _breathlessDuringExercise = false;
      _toleranceRating = null;
      _recoverySeconds = _elapsedSeconds;
    });
  }

  void _skipTask(int taskId) async {
    _disposeVideo();
    final db = ref.read(databaseProvider);
    await db.dailyFlowDao.updateTaskStatus(taskId, 'skipped');
    setState(() {
      _activeTaskIndex = null;
      _showFeedback = false;
    });
  }

  Future<void> _saveFeedback() async {
    if (_feedbackTaskId == null) return;
    final db = ref.read(databaseProvider);

    // Save feedback
    await db.exerciseDao.insertFeedback(
      ExerciseFeedbacksCompanion.insert(
        routineTaskId: _feedbackTaskId!,
        completedStatus: _completedStatus,
        breathlessnessLevel: Value(_breathlessDuringExercise ? 3 : 0),
        toleranceRating: Value(_toleranceToString()),
        recoveryMinutes: Value((_recoverySeconds / 60).ceil()),
      ),
    );

    // Mark task as completed
    await db.dailyFlowDao.updateTaskStatus(_feedbackTaskId!, 'completed');

    setState(() {
      _activeTaskIndex = null;
      _showFeedback = false;
      _feedbackTaskId = null;
    });
  }

  String _toleranceToString() {
    switch (_toleranceRating) {
      case 1:
        return 'easy';
      case 2:
        return 'manageable';
      case 3:
        return 'hard';
      case 4:
        return 'tooHard';
      default:
        return 'manageable';
    }
  }

  Future<void> _completeBlock() async {
    final db = ref.read(databaseProvider);
    await db.dailyFlowDao.updateBlockStatus(widget.blockId, 'completed');
    if (mounted) Navigator.of(context).pop();
  }

  Future<void> _skipBlock() async {
    final db = ref.read(databaseProvider);
    await db.dailyFlowDao.updateBlockStatus(widget.blockId, 'skipped');
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final tasksAsync = ref.watch(blockTasksProvider(widget.blockId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicios del bloque'),
        actions: [
          TextButton(
            onPressed: _skipBlock,
            child: const Text('Saltar bloque',
                style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),
      body: tasksAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (tasks) {
          if (tasks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No hay ejercicios en este bloque.',
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 24),
                  LargeButton(
                    text: 'Completar bloque',
                    variant: LargeButtonVariant.success,
                    onPressed: _completeBlock,
                  ),
                ],
              ),
            );
          }

          if (_showFeedback) {
            return _buildFeedbackForm(context);
          }

          final allDone = tasks.every(
              (t) => t.status == 'completed' || t.status == 'skipped');

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...tasks.asMap().entries.map((entry) {
                  final index = entry.key;
                  final task = entry.value;
                  final isActive = _activeTaskIndex == index;
                  final isDone =
                      task.status == 'completed' || task.status == 'skipped';
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: LargeCard(
                      backgroundColor: isDone
                          ? AppColors.greenDayBg
                          : isActive
                              ? AppColors.primaryLight.withValues(alpha: 0.1)
                              : null,
                      borderColor: isActive ? AppColors.primary : null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                isDone
                                    ? Icons.check_circle
                                    : _getExerciseIcon(task.exerciseType),
                                size: 28,
                                color: isDone
                                    ? AppColors.success
                                    : AppColors.primary,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  task.title,
                                  style:
                                      Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                            ],
                          ),
                          if (task.description.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Text(
                              task.description,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: AppColors.textSecondary),
                            ),
                          ],
                          if (isActive) ...[
                            const SizedBox(height: 16),
                            // Video player
                            if (_chewieController != null)
                              AspectRatio(
                                aspectRatio: _videoController!.value.aspectRatio,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Chewie(controller: _chewieController!),
                                ),
                              )
                            else
                              Container(
                                height: 180,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryLight.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(_getExerciseIcon(task.exerciseType),
                                          size: 48, color: AppColors.primary),
                                      const SizedBox(height: 8),
                                      Text('Sigue las instrucciones',
                                          style: Theme.of(context).textTheme.bodyLarge),
                                    ],
                                  ),
                                ),
                              ),
                            const SizedBox(height: 16),
                            // Timer display
                            Center(
                              child: Text(
                                _formatTime(_elapsedSeconds),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Center(
                              child: Text(
                                'Duracion sugerida: ${_formatTime(task.durationSeconds)}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: LargeButton(
                                    text: 'Hecho',
                                    variant: LargeButtonVariant.success,
                                    icon: Icons.check,
                                    onPressed: () => _finishTask(task.id),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: LargeButton(
                                    text: 'Saltar',
                                    variant: LargeButtonVariant.outlined,
                                    onPressed: () => _skipTask(task.id),
                                  ),
                                ),
                              ],
                            ),
                          ] else if (!isDone) ...[
                            const SizedBox(height: 12),
                            LargeButton(
                              text: 'Empezar',
                              onPressed: () => _startTask(index, task.exerciseType),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                }),

                if (allDone) ...[
                  const SizedBox(height: 16),
                  LargeButton(
                    text: 'Completar bloque',
                    variant: LargeButtonVariant.success,
                    icon: Icons.check_circle,
                    onPressed: _completeBlock,
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeedbackForm(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Como ha ido?',
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 24),

          // Completion status
          Text('Lo has completado?',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Column(
            children: ['full', 'partial', 'skipped'].map((status) {
              final label = status == 'full'
                  ? 'Completo'
                  : status == 'partial'
                      ? 'A medias'
                      : 'No lo hice';
              return RadioListTile<String>(
                title:
                    Text(label, style: Theme.of(context).textTheme.bodyLarge),
                value: status,
                groupValue: _completedStatus,
                onChanged: (v) => setState(() => _completedStatus = v ?? _completedStatus),
              );
            }).toList(),
          ),

          const SizedBox(height: 24),

          // Breathlessness
          Text('Te has ahogado durante el ejercicio?',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ChoiceChip(
                  label: Text('Si',
                      style: TextStyle(
                          fontSize: 18,
                          color: _breathlessDuringExercise
                              ? Colors.white
                              : AppColors.textPrimary)),
                  selected: _breathlessDuringExercise,
                  selectedColor: AppColors.danger,
                  onSelected: (_) =>
                      setState(() => _breathlessDuringExercise = true),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ChoiceChip(
                  label: Text('No',
                      style: TextStyle(
                          fontSize: 18,
                          color: !_breathlessDuringExercise
                              ? Colors.white
                              : AppColors.textPrimary)),
                  selected: !_breathlessDuringExercise,
                  selectedColor: AppColors.success,
                  onSelected: (_) =>
                      setState(() => _breathlessDuringExercise = false),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Tolerance
          Text('Como lo has tolerado?',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          LikertScale(
            value: _toleranceRating,
            onChanged: (v) => setState(() => _toleranceRating = v),
            labels: const ['Facil', 'Bien', 'Duro', 'Demasiado'],
            icons: const [
              Icons.sentiment_very_satisfied,
              Icons.sentiment_satisfied,
              Icons.sentiment_dissatisfied,
              Icons.sentiment_very_dissatisfied,
            ],
            colors: const [
              AppColors.greenDay,
              Color(0xFF66BB6A),
              AppColors.yellowDay,
              AppColors.redDay,
            ],
          ),

          const SizedBox(height: 32),

          LargeButton(
            text: 'Guardar y continuar',
            variant: LargeButtonVariant.success,
            onPressed: _saveFeedback,
          ),
        ],
      ),
    );
  }

  IconData _getExerciseIcon(String type) {
    switch (type) {
      case 'breathing':
        return Icons.air;
      case 'arms':
        return Icons.fitness_center;
      case 'cardioLegs':
        return Icons.directions_walk;
      case 'relaxation':
        return Icons.self_improvement;
      default:
        return Icons.play_arrow;
    }
  }

  String _formatTime(int seconds) {
    final min = seconds ~/ 60;
    final sec = seconds % 60;
    return '${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
  }
}
