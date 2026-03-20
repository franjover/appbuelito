import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/widgets/confirmation_dialog.dart';
import '../../../core/widgets/large_button.dart';
import '../../../data/local/database/app_database.dart';
import '../../providers/app_providers.dart';

class EmergencyScreen extends ConsumerStatefulWidget {
  const EmergencyScreen({super.key});

  @override
  ConsumerState<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends ConsumerState<EmergencyScreen> {
  bool _isHolding = false;
  bool _callInProgress = false;
  double _holdProgress = 0;

  void _startHold() {
    setState(() => _isHolding = true);
    _animateHold();
  }

  void _cancelHold() {
    setState(() {
      _isHolding = false;
      _holdProgress = 0;
    });
  }

  Future<void> _animateHold() async {
    const totalMs = 2000;
    const stepMs = 50;
    for (var i = 0; i < totalMs / stepMs; i++) {
      if (!_isHolding || !mounted) return;
      await Future.delayed(const Duration(milliseconds: stepMs));
      if (!mounted) return;
      setState(() => _holdProgress = (i + 1) * stepMs / totalMs);
    }
    if (_isHolding && mounted) {
      _triggerEmergency();
    }
  }

  Future<void> _confirmAndCall(EmergencyContact contact) async {
    final confirmed = await showLargeConfirmationDialog(
      context: context,
      title: 'Llamar a ${contact.name}?',
      message: 'Se iniciara una llamada a ${contact.name} (${contact.phone}).',
      confirmText: 'Llamar',
      confirmVariant: LargeButtonVariant.danger,
    );
    if (confirmed && mounted) {
      _triggerEmergency(contact: contact);
    }
  }

  Future<void> _triggerEmergency({EmergencyContact? contact}) async {
    setState(() => _callInProgress = true);

    final contacts = ref.read(emergencyContactsProvider).value ?? [];
    final profile = ref.read(userProfileProvider).value;
    final emergencyService = ref.read(emergencyServiceProvider);

    if (contacts.isEmpty) {
      await emergencyService.callEmergencyServices();
    } else {
      final targetContacts = contact != null ? [contact] : contacts;
      await emergencyService.triggerEmergency(
        contacts: targetContacts,
        patientName: profile?.name ?? 'Paciente',
      );
    }

    if (mounted) {
      setState(() {
        _callInProgress = false;
        _isHolding = false;
        _holdProgress = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final contactsAsync = ref.watch(emergencyContactsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF8B0000),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        foregroundColor: Colors.white,
        title: const Text('Emergencia'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.emergency, size: 64, color: Colors.white),
              const SizedBox(height: 24),
              Text(
                'Manten pulsado para llamar',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Hold-to-call button
              GestureDetector(
                onLongPressStart: (_) => _startHold(),
                onLongPressEnd: (_) {
                  if (_holdProgress < 1.0) _cancelHold();
                },
                onLongPressCancel: _cancelHold,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 160,
                      height: 160,
                      child: CircularProgressIndicator(
                        value: _holdProgress,
                        strokeWidth: 8,
                        color: Colors.white,
                        backgroundColor: Colors.white24,
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 140,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white24,
                      ),
                      child: Icon(
                        _callInProgress ? Icons.phone_in_talk : Icons.phone,
                        size: 56,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              if (_callInProgress)
                Text(
                  'Llamando...',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                      ),
                ),

              const SizedBox(height: 32),

              // Contact list
              contactsAsync.when(
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
                data: (contacts) {
                  if (contacts.isEmpty) {
                    return Text(
                      'No hay contactos configurados.\nSe llamara al 112.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white70,
                          ),
                      textAlign: TextAlign.center,
                    );
                  }
                  // Show principal contact name above the hold button
                  // Secondary contacts as direct-call buttons
                  final secondary = contacts.length > 1 ? contacts.sublist(1) : <EmergencyContact>[];
                  return Column(
                    children: [
                      Text(
                        'Llamando a ${contacts.first.name}',
                        style: const TextStyle(color: Colors.white70, fontSize: 18),
                      ),
                      if (secondary.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        Text(
                          'O llama directamente a:',
                          style: const TextStyle(color: Colors.white54, fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        ...secondary.map((c) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                side: const BorderSide(color: Colors.white38),
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                              icon: const Icon(Icons.phone, size: 22),
                              label: Text(
                                '${c.name} · ${c.relationship}',
                                style: const TextStyle(fontSize: 18),
                              ),
                              onPressed: _callInProgress ? null : () => _confirmAndCall(c),
                            ),
                          ),
                        )),
                      ],
                    ],
                  );
                },
              ),

              const Spacer(),

              // Call 112 directly
              LargeButton(
                text: 'Llamar al 112',
                variant: LargeButtonVariant.danger,
                icon: Icons.local_hospital,
                onPressed: () async {
                  final service = ref.read(emergencyServiceProvider);
                  await service.callEmergencyServices();
                },
              ),

              const SizedBox(height: 12),

              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancelar',
                    style: TextStyle(color: Colors.white70, fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
