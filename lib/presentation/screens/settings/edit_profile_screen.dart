import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/widgets/large_button.dart';
import '../../../data/local/database/app_database.dart';
import '../../providers/app_providers.dart';

/// Screen to edit the patient's profile information.
class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _nameCtrl = TextEditingController();
  final _diagnosisCtrl = TextEditingController();
  final _medicationCtrl = TextEditingController();
  final _inhalerCtrl = TextEditingController();
  bool _usesOxygen = false;
  bool _usesPulseOximeter = false;
  bool _isSaving = false;
  bool _loaded = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _diagnosisCtrl.dispose();
    _medicationCtrl.dispose();
    _inhalerCtrl.dispose();
    super.dispose();
  }

  void _loadProfile(dynamic profile) {
    if (_loaded || profile == null) return;
    _loaded = true;
    _nameCtrl.text = profile.name as String;
    _diagnosisCtrl.text = (profile.diagnosis as String?) ?? '';
    _medicationCtrl.text = (profile.regularMedication as String?) ?? '';
    _inhalerCtrl.text = (profile.rescueInhaler as String?) ?? '';
    _usesOxygen = (profile.usesOxygen as bool?) ?? false;
    _usesPulseOximeter = (profile.usesPulseOximeter as bool?) ?? false;
  }

  Future<void> _save() async {
    setState(() => _isSaving = true);
    try {
      final db = ref.read(databaseProvider);
      final profile = ref.read(userProfileProvider).value;
      if (profile == null) return;

      await (db.update(db.userProfiles)
            ..where((t) => t.id.equals(profile.id)))
          .write(UserProfilesCompanion(
        name: Value(_nameCtrl.text),
        diagnosis: Value(_diagnosisCtrl.text),
        regularMedication: Value(_medicationCtrl.text),
        rescueInhaler: Value(_inhalerCtrl.text),
        usesOxygen: Value(_usesOxygen),
        usesPulseOximeter: Value(_usesPulseOximeter),
        updatedAt: Value(DateTime.now()),
      ));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Perfil actualizado')),
        );
        Navigator.of(context).pop();
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(userProfileProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Editar perfil')),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (profile) {
          _loadProfile(profile);
          if (profile == null) {
            return const Center(child: Text('No hay perfil'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _nameCtrl,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _diagnosisCtrl,
                  decoration: const InputDecoration(labelText: 'Diagnostico'),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
                SwitchListTile(
                  title: Text('Uso oxigeno',
                      style: Theme.of(context).textTheme.bodyLarge),
                  value: _usesOxygen,
                  onChanged: (v) => setState(() => _usesOxygen = v),
                ),
                SwitchListTile(
                  title: Text('Tengo pulsioximetro',
                      style: Theme.of(context).textTheme.bodyLarge),
                  value: _usesPulseOximeter,
                  onChanged: (v) => setState(() => _usesPulseOximeter = v),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _medicationCtrl,
                  decoration:
                      const InputDecoration(labelText: 'Medicacion habitual'),
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 2,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _inhalerCtrl,
                  decoration:
                      const InputDecoration(labelText: 'Inhalador de rescate'),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 32),
                LargeButton(
                  text: 'Guardar cambios',
                  variant: LargeButtonVariant.success,
                  icon: Icons.save,
                  isLoading: _isSaving,
                  onPressed: _isSaving ? null : _save,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
