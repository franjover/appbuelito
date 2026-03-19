import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/large_button.dart';
import '../../../core/widgets/step_indicator.dart';
import '../../../data/local/database/app_database.dart';
import '../../providers/app_providers.dart';
import '../../router/route_names.dart';

/// Multi-step onboarding wizard.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageController = PageController();
  int _currentStep = 0;
  static const _totalSteps = 5;

  // Form data
  String _name = '';
  int _age = 70;
  String _sex = 'hombre';
  String _diagnosis = 'EPOC';
  bool _usesOxygen = false;
  bool _usesPulseOximeter = false;
  String _medication = '';
  String _rescueInhaler = '';
  final List<Map<String, String>> _contacts = [];
  bool _isSaving = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < _totalSteps - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() => _currentStep++);
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() => _currentStep--);
    }
  }

  Future<void> _finishOnboarding() async {
    setState(() => _isSaving = true);

    try {
      final db = ref.read(databaseProvider);
      final prefs = ref.read(appPreferencesProvider);

      // Save user profile
      await db.userDao.insertProfile(
        UserProfilesCompanion.insert(
          name: _name.isEmpty ? 'Paciente' : _name,
          birthDate: Value(DateTime.now().subtract(Duration(days: _age * 365))),
          sex: Value(_sex),
          diagnosis: Value(_diagnosis),
          usesOxygen: Value(_usesOxygen),
          usesPulseOximeter: Value(_usesPulseOximeter),
          regularMedication: Value(_medication),
          rescueInhaler: Value(_rescueInhaler),
        ),
      );

      // Save emergency contacts if provided
      for (var i = 0; i < _contacts.length; i++) {
        final c = _contacts[i];
        if (c['name']!.isNotEmpty && c['phone']!.isNotEmpty) {
          await db.userDao.insertContact(
            EmergencyContactsCompanion.insert(
              userId: 1,
              name: c['name']!,
              relationship: c['relationship'] ?? 'Familiar',
              phone: c['phone']!,
              priority: Value(i + 1),
            ),
          );
        }
      }

      // Mark onboarding as complete
      await prefs.setOnboardingComplete(true);

      // Create first daily flow
      final flowService = ref.read(dailyFlowServiceProvider);
      await flowService.ensureCurrentFlow();

      // Initialize notifications
      final notifService = ref.read(notificationServiceProvider);
      await notifService.initialize();
      await notifService.scheduleMorningNotification();

      if (mounted) context.goNamed(RouteNames.home);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuracion inicial'),
        leading: _currentStep > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back, size: 28),
                onPressed: _previousStep,
              )
            : null,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            StepIndicator(totalSteps: _totalSteps, currentStep: _currentStep),
            const SizedBox(height: 24),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildWelcomeStep(),
                  _buildPersonalInfoStep(),
                  _buildHealthInfoStep(),
                  _buildContactStep(),
                  _buildSummaryStep(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeStep() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.favorite, size: 80, color: AppColors.primary),
          const SizedBox(height: 32),
          Text(
            'Bienvenido a Appbuelito',
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Esta app te ayudara cada dia con tus ejercicios, '
            'tu respiracion y tu bienestar.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Vamos a configurar unas pocas cosas para empezar.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          LargeButton(
            text: 'Empezar',
            icon: Icons.arrow_forward,
            onPressed: _nextStep,
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tus datos', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 24),
          TextField(
            decoration: const InputDecoration(labelText: 'Tu nombre'),
            style: Theme.of(context).textTheme.bodyLarge,
            onChanged: (v) => _name = v,
          ),
          const SizedBox(height: 20),
          Text('Edad: $_age anos', style: Theme.of(context).textTheme.bodyLarge),
          Slider(
            value: _age.toDouble(),
            min: 40,
            max: 100,
            divisions: 60,
            label: '$_age',
            onChanged: (v) => setState(() => _age = v.round()),
          ),
          const SizedBox(height: 20),
          Text('Sexo', style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 8),
          SegmentedButton<String>(
            segments: const [
              ButtonSegment(value: 'hombre', label: Text('Hombre')),
              ButtonSegment(value: 'mujer', label: Text('Mujer')),
            ],
            selected: {_sex},
            onSelectionChanged: (v) => setState(() => _sex = v.first),
          ),
          const SizedBox(height: 32),
          LargeButton(text: 'Siguiente', onPressed: _nextStep),
        ],
      ),
    );
  }

  Widget _buildHealthInfoStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tu salud', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 24),
          TextField(
            decoration: const InputDecoration(labelText: 'Diagnostico'),
            style: Theme.of(context).textTheme.bodyLarge,
            controller: TextEditingController(text: _diagnosis),
            onChanged: (v) => _diagnosis = v,
          ),
          const SizedBox(height: 20),
          SwitchListTile(
            title: Text('Uso oxigeno', style: Theme.of(context).textTheme.bodyLarge),
            value: _usesOxygen,
            onChanged: (v) => setState(() => _usesOxygen = v),
          ),
          SwitchListTile(
            title: Text('Tengo pulsioximetro', style: Theme.of(context).textTheme.bodyLarge),
            value: _usesPulseOximeter,
            onChanged: (v) => setState(() => _usesPulseOximeter = v),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(labelText: 'Medicacion habitual'),
            style: Theme.of(context).textTheme.bodyLarge,
            onChanged: (v) => _medication = v,
            maxLines: 2,
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(labelText: 'Inhalador de rescate'),
            style: Theme.of(context).textTheme.bodyLarge,
            onChanged: (v) => _rescueInhaler = v,
          ),
          const SizedBox(height: 32),
          LargeButton(text: 'Siguiente', onPressed: _nextStep),
        ],
      ),
    );
  }

  void _showAddContactDialog() {
    String name = '';
    String phone = '';
    String relationship = 'Familiar';

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Anadir contacto'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Nombre'),
                onChanged: (v) => name = v,
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(labelText: 'Telefono'),
                keyboardType: TextInputType.phone,
                onChanged: (v) => phone = v,
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                    labelText: 'Relacion (ej: hijo, hija, vecino)'),
                controller: TextEditingController(text: relationship),
                onChanged: (v) => relationship = v,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              if (name.isNotEmpty && phone.isNotEmpty) {
                setState(() {
                  _contacts.add({
                    'name': name,
                    'phone': phone,
                    'relationship': relationship,
                  });
                });
              }
              Navigator.pop(ctx);
            },
            child: const Text('Anadir'),
          ),
        ],
      ),
    );
  }

  Widget _buildContactStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Contactos de emergencia',
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(
            'Personas a quienes podamos llamar si necesitas ayuda.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
          ),
          const SizedBox(height: 24),
          // Show added contacts
          for (var i = 0; i < _contacts.length; i++)
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: CircleAvatar(child: Text('${i + 1}')),
                title: Text(_contacts[i]['name']!,
                    style: Theme.of(context).textTheme.bodyLarge),
                subtitle: Text(
                    '${_contacts[i]['relationship']} - ${_contacts[i]['phone']}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline, color: AppColors.danger),
                  onPressed: () => setState(() => _contacts.removeAt(i)),
                ),
              ),
            ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: _showAddContactDialog,
            icon: const Icon(Icons.person_add),
            label: Text(
              _contacts.isEmpty ? 'Anadir contacto' : 'Anadir otro contacto',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          const SizedBox(height: 32),
          LargeButton(text: 'Siguiente', onPressed: _nextStep),
          const SizedBox(height: 12),
          Center(
            child: TextButton(
              onPressed: _nextStep,
              child: const Text('Lo hare mas tarde'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Todo listo', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 24),
          _summaryRow('Nombre', _name.isEmpty ? 'Paciente' : _name),
          _summaryRow('Edad', '$_age anos'),
          _summaryRow('Diagnostico', _diagnosis),
          if (_medication.isNotEmpty)
            _summaryRow('Medicacion', _medication),
          if (_rescueInhaler.isNotEmpty)
            _summaryRow('Inhalador', _rescueInhaler),
          for (var i = 0; i < _contacts.length; i++)
            _summaryRow(
              i == 0 ? 'Contacto' : 'Contacto ${i + 1}',
              '${_contacts[i]['name']} (${_contacts[i]['relationship']})',
            ),
          const SizedBox(height: 32),
          Text(
            'Puedes cambiar todo esto mas tarde en Ajustes.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          LargeButton(
            text: 'Comenzar',
            icon: Icons.check,
            variant: LargeButtonVariant.success,
            isLoading: _isSaving,
            onPressed: _isSaving ? null : _finishOnboarding,
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(label,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600)),
          ),
          Expanded(
            child: Text(value, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}
