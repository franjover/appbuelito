import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/large_button.dart';
import '../../../core/widgets/likert_scale.dart';
import '../../../data/local/database/app_database.dart';
import '../../providers/app_providers.dart';

class InhalerRegistryScreen extends ConsumerStatefulWidget {
  const InhalerRegistryScreen({super.key});

  @override
  ConsumerState<InhalerRegistryScreen> createState() =>
      _InhalerRegistryScreenState();
}

class _InhalerRegistryScreenState
    extends ConsumerState<InhalerRegistryScreen> {
  String _context = 'spontaneous';
  int _puffs = 1;
  int? _relief;
  bool _isSaving = false;

  final _contexts = [
    ('spontaneous', 'Uso normal'),
    ('routine', 'Durante ejercicio'),
    ('chokingFlow', 'Me estaba ahogando'),
    ('symptomCheck', 'Control de sintomas'),
  ];

  Future<void> _save() async {
    setState(() => _isSaving = true);
    try {
      final db = ref.read(databaseProvider);
      final flow = ref.read(currentFlowProvider).value;

      await db.inhalerDao.insertUse(
        RescueInhalerUsesCompanion.insert(
          timestamp: DateTime.now(),
          usageContext: _context,
          puffs: Value(_puffs),
          reliefLevel: Value(_relief),
          dailyFlowId: Value(flow?.id),
        ),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Uso de inhalador registrado')),
        );
        Navigator.of(context).pop();
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar inhalador')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Motivo', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            Column(
              children: _contexts.map((c) => RadioListTile<String>(
                title: Text(c.$2,
                    style: Theme.of(context).textTheme.bodyLarge),
                value: c.$1,
                groupValue: _context,
                onChanged: (v) => setState(() => _context = v ?? _context),
              )).toList(),
            ),

            const SizedBox(height: 24),
            Text('Pulsaciones: $_puffs',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [1, 2, 3, 4].map((n) {
                final selected = _puffs == n;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ChoiceChip(
                    label: Text('$n',
                        style: TextStyle(
                            fontSize: 20,
                            color:
                                selected ? Colors.white : AppColors.textPrimary)),
                    selected: selected,
                    selectedColor: AppColors.primary,
                    onSelected: (_) => setState(() => _puffs = n),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),
            Text('Te ha aliviado?',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            LikertScale(
              value: _relief,
              onChanged: (v) => setState(() => _relief = v),
              labels: const [
                'Nada',
                'Poco',
                'Regular',
                'Bastante',
                'Mucho'
              ],
              icons: const [
                Icons.sentiment_very_dissatisfied,
                Icons.sentiment_dissatisfied,
                Icons.sentiment_neutral,
                Icons.sentiment_satisfied,
                Icons.sentiment_very_satisfied,
              ],
            ),

            const SizedBox(height: 32),
            LargeButton(
              text: 'Guardar',
              variant: LargeButtonVariant.success,
              isLoading: _isSaving,
              onPressed: _isSaving ? null : _save,
            ),
          ],
        ),
      ),
    );
  }
}
