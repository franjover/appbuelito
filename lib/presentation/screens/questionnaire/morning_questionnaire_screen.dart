import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/large_button.dart';
import '../../../core/widgets/likert_scale.dart';
import '../../../core/widgets/yes_no_selector.dart';
import '../../../core/widgets/score_badge.dart';
import '../../../data/models/day_classification.dart';
import '../../providers/app_providers.dart';
import '../../router/route_names.dart';

class MorningQuestionnaireScreen extends ConsumerStatefulWidget {
  const MorningQuestionnaireScreen({super.key});

  @override
  ConsumerState<MorningQuestionnaireScreen> createState() =>
      _MorningQuestionnaireScreenState();
}

class _MorningQuestionnaireScreenState
    extends ConsumerState<MorningQuestionnaireScreen> {
  final _pageController = PageController();
  int _currentQuestion = 0;
  static const _totalQuestions = 5;

  // Answers (1-5 scale, higher = worse)
  int? _breathing;
  int? _sleep;
  int? _fatigue;
  int? _cough;
  bool? _phlegm;

  void _nextQuestion() {
    if (_currentQuestion < _totalQuestions - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() => _currentQuestion++);
    }
  }

  double get _totalScore {
    double score = 0;
    score += (_breathing ?? 3).toDouble();
    score += (_sleep ?? 3).toDouble();
    score += (_fatigue ?? 3).toDouble();
    score += (_cough ?? 3).toDouble();
    score += (_phlegm == true ? 5 : 1).toDouble();
    return score;
  }

  DayClassification get _classification {
    final score = _totalScore;
    if (score <= AppConstants.greenMaxScore) return DayClassification.green;
    if (score <= AppConstants.yellowMaxScore) return DayClassification.yellow;
    return DayClassification.red;
  }

  Future<void> _submitQuestionnaire() async {
    final flowAsync = ref.read(currentFlowProvider);
    final flow = flowAsync.value;
    if (flow == null) return;

    final service = ref.read(dailyFlowServiceProvider);
    await service.setDayClassification(
        flow.id, _classification.name, _totalScore);

    // Generate routine
    final engine = ref.read(routineEngineProvider);
    await engine.generateRoutine(flow.id, _classification);

    // Schedule block reminder notifications
    final notifService = ref.read(notificationServiceProvider);
    final prefs = ref.read(appPreferencesProvider);
    for (var i = 0; i < 5; i++) {
      await notifService.scheduleBlockReminder(
        blockIndex: i,
        blockName: AppConstants.blockNames[i],
        scheduledTime: prefs.getBlockTime(i),
      );
    }

    // Update home screen widgets with new classification
    try {
      final widgetService = ref.read(widgetDataServiceProvider);
      await widgetService.refreshFromCurrentFlow();
    } catch (_) {}

    if (mounted) context.goNamed(RouteNames.home);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pregunta ${_currentQuestion + 1} de $_totalQuestions'),
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildBreathingQuestion(),
            _buildSleepQuestion(),
            _buildFatigueQuestion(),
            _buildCoughQuestion(),
            _buildResultPage(),
          ],
        ),
      ),
    );
  }

  Widget _questionWrapper({
    required String question,
    required Widget child,
    bool showNext = true,
    bool canAdvance = true,
  }) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(flex: 1),
          Text(
            question,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          child,
          const Spacer(flex: 2),
          if (showNext)
            LargeButton(
              text: 'Siguiente',
              onPressed: canAdvance ? _nextQuestion : null,
            ),
        ],
      ),
    );
  }

  Widget _buildBreathingQuestion() {
    return _questionWrapper(
      question: 'Como respiras hoy?',
      canAdvance: _breathing != null,
      child: LikertScale(
        value: _breathing,
        onChanged: (v) => setState(() => _breathing = v),
        labels: const ['Muy bien', 'Bien', 'Normal', 'Mal', 'Muy mal'],
      ),
    );
  }

  Widget _buildSleepQuestion() {
    return _questionWrapper(
      question: 'Como has dormido?',
      canAdvance: _sleep != null,
      child: LikertScale(
        value: _sleep,
        onChanged: (v) => setState(() => _sleep = v),
        labels: const ['Muy bien', 'Bien', 'Regular', 'Mal', 'Muy mal'],
      ),
    );
  }

  Widget _buildFatigueQuestion() {
    return _questionWrapper(
      question: 'Te notas cansado?',
      canAdvance: _fatigue != null,
      child: LikertScale(
        value: _fatigue,
        onChanged: (v) => setState(() => _fatigue = v),
        labels: const [
          'Nada cansado',
          'Un poco',
          'Normal',
          'Bastante',
          'Muy cansado'
        ],
      ),
    );
  }

  Widget _buildCoughQuestion() {
    return _questionWrapper(
      question: 'Tienes tos hoy?',
      canAdvance: _cough != null,
      child: Column(
        children: [
          LikertScale(
            value: _cough,
            onChanged: (v) => setState(() => _cough = v),
            labels: const ['Nada', 'Poca', 'Normal', 'Bastante', 'Mucha'],
          ),
          const SizedBox(height: 32),
          Text('Has notado flema?',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          YesNoSelector(
            value: _phlegm,
            onChanged: (v) => setState(() => _phlegm = v),
          ),
        ],
      ),
    );
  }

  Widget _buildResultPage() {
    final classification = _classification;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScoreBadge(classification: classification, large: true),
          const SizedBox(height: 24),
          Text(
            classification.description,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          LargeButton(
            text: 'Empezar la rutina del dia',
            variant: LargeButtonVariant.success,
            onPressed: _submitQuestionnaire,
          ),
        ],
      ),
    );
  }
}
