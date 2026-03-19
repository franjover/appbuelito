import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/large_button.dart';
import '../../../core/widgets/likert_scale.dart';
import '../../../core/widgets/yes_no_selector.dart';
import '../../../data/local/database/app_database.dart';
import '../../providers/app_providers.dart';
import '../../router/route_names.dart';

class EveningQuestionnaireScreen extends ConsumerStatefulWidget {
  const EveningQuestionnaireScreen({super.key});

  @override
  ConsumerState<EveningQuestionnaireScreen> createState() =>
      _EveningQuestionnaireScreenState();
}

class _EveningQuestionnaireScreenState
    extends ConsumerState<EveningQuestionnaireScreen> {
  int? _howWasDay;
  bool? _moreBreathless;
  bool? _moreCough;
  bool? _worseThanYesterday;
  bool? _medicationTaken;
  String _notes = '';
  bool _isSaving = false;
  String? _regularMedication;

  @override
  void initState() {
    super.initState();
    _loadMedication();
  }

  Future<void> _loadMedication() async {
    final profile = ref.read(userProfileProvider).value;
    if (profile != null && profile.regularMedication != null) {
      setState(() => _regularMedication = profile.regularMedication);
    }
  }

  Future<void> _submitAndArchive() async {
    setState(() => _isSaving = true);

    try {
      final flowAsync = ref.read(currentFlowProvider);
      final flow = flowAsync.value;
      if (flow == null) return;

      final db = ref.read(databaseProvider);

      // Save evening symptom check
      await db.symptomDao.insertSymptomCheck(
        SymptomChecksCompanion.insert(
          dailyFlowId: flow.id,
          moment: 'evening',
          breathingToday: Value(_howWasDay),
          cough: Value(_moreCough == true ? 4 : 1),
          notes: Value(_notes.isNotEmpty ? _notes : null),
        ),
      );

      // Update flow with evening data
      await (db.update(db.dailyFlows)
            ..where((t) => t.id.equals(flow.id)))
          .write(DailyFlowsCompanion(
        eveningQuestionnaireCompleted: const Value(true),
        eveningNotes: Value(_notes.isNotEmpty ? _notes : null),
        medicationTaken: Value(_medicationTaken),
        respiratoryStabilityScore: Value(
          _calculateStabilityScore(),
        ),
        updatedAt: Value(DateTime.now()),
      ));

      // Archive the flow
      final service = ref.read(dailyFlowServiceProvider);
      await service.archiveCurrentFlow();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Dia archivado correctamente'),
            duration: Duration(seconds: 2),
          ),
        );
        context.goNamed(RouteNames.home);
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  double _calculateStabilityScore() {
    double score = 0;
    score += (_howWasDay ?? 3).toDouble();
    if (_moreBreathless == true) score += 3;
    if (_moreCough == true) score += 2;
    if (_worseThanYesterday == true) score += 3;
    return score;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cierre del dia')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Como ha ido el dia?',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 24),
            LikertScale(
              value: _howWasDay,
              onChanged: (v) => setState(() => _howWasDay = v),
              labels: const ['Muy bien', 'Bien', 'Normal', 'Mal', 'Muy mal'],
            ),

            const SizedBox(height: 32),
            Text('Te has ahogado mas de lo normal?',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            YesNoSelector(
              value: _moreBreathless,
              onChanged: (v) => setState(() => _moreBreathless = v),
            ),

            const SizedBox(height: 32),
            Text('Has tenido mas tos?',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            YesNoSelector(
              value: _moreCough,
              onChanged: (v) => setState(() => _moreCough = v),
            ),

            const SizedBox(height: 32),
            Text('Te notas peor que ayer?',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            YesNoSelector(
              value: _worseThanYesterday,
              onChanged: (v) => setState(() => _worseThanYesterday = v),
            ),

            if (_regularMedication != null && _regularMedication!.isNotEmpty) ...[
              const SizedBox(height: 32),
              Text('Has tomado tu medicacion hoy?',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 4),
              Text(
                _regularMedication!,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
              ),
              const SizedBox(height: 12),
              YesNoSelector(
                value: _medicationTaken,
                onChanged: (v) => setState(() => _medicationTaken = v),
              ),
            ],

            const SizedBox(height: 32),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Notas del dia (opcional)',
                hintText: 'Algo que quieras apuntar...',
              ),
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 3,
              onChanged: (v) => _notes = v,
            ),

            const SizedBox(height: 32),
            LargeButton(
              text: 'Cerrar el dia',
              variant: LargeButtonVariant.success,
              icon: Icons.check_circle,
              isLoading: _isSaving,
              onPressed: _isSaving ? null : _submitAndArchive,
            ),
          ],
        ),
      ),
    );
  }
}
