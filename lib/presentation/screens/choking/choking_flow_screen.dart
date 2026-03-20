import 'dart:async';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/large_button.dart';
import '../../../data/local/database/app_database.dart';
import '../../providers/app_providers.dart';
import '../../router/route_names.dart';

/// Critical "Me ahogo" flow with guided breathing and escalation.
class ChokingFlowScreen extends ConsumerStatefulWidget {
  const ChokingFlowScreen({super.key});

  @override
  ConsumerState<ChokingFlowScreen> createState() => _ChokingFlowScreenState();
}

class _ChokingFlowScreenState extends ConsumerState<ChokingFlowScreen>
    with TickerProviderStateMixin {
  int _microSessionCount = 0;
  bool _inMicroSession = false;
  bool _showFeedback = false;
  bool _inhalerUsed = false;
  bool _inhalerSaved = false;
  late AnimationController _breathController;
  late Animation<double> _breathAnimation;
  Timer? _sessionTimer;
  int _sessionSecondsLeft = 0;
  String _phase = 'inhale'; // inhale, exhale

  @override
  void initState() {
    super.initState();
    _breathController = AnimationController(
      duration: Duration(
        seconds: AppConstants.breatheInSeconds +
            AppConstants.breatheHoldSeconds +
            AppConstants.breatheOutSeconds,
      ),
      vsync: this,
    );
    _breathAnimation = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _breathController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _breathController.dispose();
    _sessionTimer?.cancel();
    super.dispose();
  }

  Future<void> _registerInhalerUse() async {
    if (_inhalerSaved) return;
    final db = ref.read(databaseProvider);
    final flow = ref.read(currentFlowProvider).value;
    await db.inhalerDao.insertUse(
      RescueInhalerUsesCompanion.insert(
        timestamp: DateTime.now(),
        usageContext: 'chokingFlow',
        dailyFlowId: Value(flow?.id),
      ),
    );
    setState(() => _inhalerSaved = true);
  }

  Future<void> _saveEpisode(String improvement) async {
    final db = ref.read(databaseProvider);
    final flow = ref.read(currentFlowProvider).value;

    await db.symptomDao.insertEpisode(
      BreathlessnessEpisodesCompanion.insert(
        dailyFlowId: flow?.id ?? 0,
        context: const Value('chokingFlow'),
        microSessionCount: Value(_microSessionCount),
        inhalerUsed: Value(_inhalerUsed),
        improvement: Value(improvement),
      ),
    );

    // Save inhaler use only if not already saved
    if (_inhalerUsed && !_inhalerSaved) {
      await _registerInhalerUse();
    }
  }

  void _startMicroSession() {
    setState(() {
      _inMicroSession = true;
      _showFeedback = false;
      _microSessionCount++;
      _sessionSecondsLeft = AppConstants.microSessionDurationSeconds;
    });

    _breathController.repeat();

    _sessionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _sessionSecondsLeft--;
        final totalCycle = AppConstants.breatheInSeconds +
            AppConstants.breatheHoldSeconds +
            AppConstants.breatheOutSeconds;
        final position = (AppConstants.microSessionDurationSeconds -
                _sessionSecondsLeft) %
            totalCycle;
        if (position < AppConstants.breatheInSeconds) {
          _phase = 'inhale';
        } else {
          _phase = 'exhale';
        }
      });

      if (_sessionSecondsLeft <= 0) {
        timer.cancel();
        _breathController.stop();
        setState(() {
          _inMicroSession = false;
          _showFeedback = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A237E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: _inMicroSession
              ? _buildBreathingUI()
              : _showFeedback
                  ? _buildFeedbackUI()
                  : _buildInitialUI(),
        ),
      ),
    );
  }

  Widget _buildInitialUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.air, size: 64, color: Colors.white),
        const SizedBox(height: 32),
        Text(
          'Para.\nSientate o apoyate.',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Ejercicio de respiracion',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.lightBlueAccent,
                ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Vamos paso a paso.',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white70,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 48),
        LargeButton(
          text: 'Respiracion con labios fruncidos',
          variant: LargeButtonVariant.primary,
          onPressed: _startMicroSession,
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Estoy bien, volver',
              style: TextStyle(color: Colors.white70, fontSize: 18)),
        ),
      ],
    );
  }

  Widget _buildBreathingUI() {
    final phaseText = _phase == 'inhale'
        ? 'Inhala por la nariz...'
        : 'Exhala con labios fruncidos...';
    final phaseColor = _phase == 'inhale'
        ? Colors.lightBlueAccent
        : Colors.greenAccent;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          phaseText,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: phaseColor,
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(height: 40),
        AnimatedBuilder(
          animation: _breathAnimation,
          builder: (context, _) {
            final size = 200 * _breathAnimation.value;
            return Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: phaseColor.withValues(alpha: 0.3),
                border: Border.all(color: phaseColor, width: 3),
              ),
            );
          },
        ),
        const SizedBox(height: 40),
        Text(
          '${_sessionSecondsLeft}s',
          style: const TextStyle(
              color: Colors.white70, fontSize: 24, fontWeight: FontWeight.w600),
        ),
        Text(
          'Sesion $_microSessionCount de ${AppConstants.maxMicroSessions}',
          style: const TextStyle(color: Colors.white38, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildFeedbackUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sesion $_microSessionCount completada',
          style: const TextStyle(color: Colors.white54, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Text(
          'Mejoras?',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(height: 40),
        LargeButton(
          text: 'Si, estoy mejor',
          variant: LargeButtonVariant.success,
          onPressed: () async {
            await _saveEpisode('improved');
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Bien hecho. Mejoraste tras $_microSessionCount sesion${_microSessionCount == 1 ? '' : 'es'}.',
                  ),
                  backgroundColor: Colors.green.shade700,
                ),
              );
              context.pop();
            }
          },
        ),
        const SizedBox(height: 12),
        if (_microSessionCount < AppConstants.maxMicroSessions)
          LargeButton(
            text: 'Un poco, otra sesion',
            variant: LargeButtonVariant.outlined,
            onPressed: _startMicroSession,
          ),
        const SizedBox(height: 12),
        LargeButton(
          text: _inhalerUsed
              ? 'Inhalador registrado'
              : 'He usado el inhalador',
          variant: LargeButtonVariant.secondary,
          icon: Icons.medication,
          onPressed: _inhalerUsed
              ? null
              : () {
                  setState(() => _inhalerUsed = true);
                  _registerInhalerUse();
                },
        ),
        const SizedBox(height: 12),
        LargeButton(
          text: 'Necesito ayuda',
          variant: LargeButtonVariant.danger,
          icon: Icons.emergency,
          onPressed: () => context.pushNamed(RouteNames.emergency),
        ),
      ],
    );
  }
}
