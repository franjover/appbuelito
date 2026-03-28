import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/large_button.dart';
import '../../../core/widgets/large_card.dart';
import '../../../core/widgets/confirmation_dialog.dart';
import '../../../data/remote/sync_service.dart';
import '../../providers/app_providers.dart';

/// Screen to manage family access codes for remote report viewing.
class FamilyAccessScreen extends ConsumerStatefulWidget {
  const FamilyAccessScreen({super.key});

  @override
  ConsumerState<FamilyAccessScreen> createState() => _FamilyAccessScreenState();
}

class _FamilyAccessScreenState extends ConsumerState<FamilyAccessScreen> {
  List<Map<String, dynamic>> _codes = [];
  bool _loading = true;
  bool _creating = false;
  bool _syncing = false;

  @override
  void initState() {
    super.initState();
    _loadCodes();
  }

  Future<void> _loadCodes() async {
    final syncService = ref.read(syncServiceProvider);
    if (syncService == null) {
      setState(() => _loading = false);
      return;
    }

    try {
      final codes = await syncService.getAccessCodes();
      if (mounted) {
        setState(() {
          _codes = codes;
          _loading = false;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _createCode() async {
    final syncService = ref.read(syncServiceProvider);
    if (syncService == null) {
      _showNotConfigured();
      return;
    }

    final label = await _showLabelDialog();
    if (label == null || label.isEmpty) return;

    setState(() => _creating = true);
    try {
      final code = await syncService.createAccessCode(label);
      await _loadCodes();
      if (mounted) _showCodeCreatedDialog(code, label);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al crear acceso: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _creating = false);
    }
  }

  Future<void> _syncNow() async {
    final syncService = ref.read(syncServiceProvider);
    if (syncService == null) {
      _showNotConfigured();
      return;
    }

    setState(() => _syncing = true);
    try {
      final result = await syncService.syncAll();
      if (mounted) {
        if (result == SyncStatus.error) {
          final detail = syncService.lastError ?? 'Error desconocido';
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Error de sincronizacion'),
              content: SingleChildScrollView(
                child: SelectableText(
                  detail,
                  style: const TextStyle(fontSize: 12, fontFamily: 'monospace'),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Cerrar'),
                ),
              ],
            ),
          );
        } else {
          final msg = switch (result) {
            SyncStatus.success => 'Datos sincronizados correctamente',
            SyncStatus.offline => 'Sin conexion a internet',
            _ => 'Sincronizacion completada',
          };
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(msg)),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Error inesperado'),
            content: SingleChildScrollView(
              child: SelectableText(
                '$e',
                style: const TextStyle(fontSize: 12, fontFamily: 'monospace'),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Cerrar'),
              ),
            ],
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _syncing = false);
    }
  }

  void _showNotConfigured() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Supabase no esta configurado. Contacta al desarrollador.'),
      ),
    );
  }

  Future<String?> _showLabelDialog() async {
    String label = '';
    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Nombre del familiar'),
        content: TextField(
          decoration: const InputDecoration(
            labelText: 'Ej: Mi hija Maria',
          ),
          style: Theme.of(context).textTheme.bodyLarge,
          autofocus: true,
          onChanged: (v) => label = v,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, label),
            child: const Text('Crear'),
          ),
        ],
      ),
    );
  }

  void _showCodeCreatedDialog(String code, String label) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Acceso creado'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Comparte este codigo con $label:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryLight.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                code,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Tu familiar puede entrar con este codigo en la web del portal familiar.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: code));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Codigo copiado')),
              );
            },
            child: const Text('Copiar codigo'),
          ),
          TextButton(
            onPressed: () {
              Share.share(
                'Hola! Puedes ver mis datos de salud en el portal familiar de Appbuelito. '
                'Tu codigo de acceso es: $code',
                subject: 'Acceso a Appbuelito',
              );
            },
            child: const Text('Compartir'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Listo'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final prefs = ref.watch(appPreferencesProvider);
    final lastSync = prefs.lastSyncAt;
    final syncEnabled = prefs.cloudSyncEnabled;

    return Scaffold(
      appBar: AppBar(title: const Text('Acceso familiar')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Sync status card
            LargeCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        syncEnabled ? Icons.cloud_done : Icons.cloud_off,
                        color: syncEnabled ? AppColors.greenDay : AppColors.disabled,
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sincronizacion en la nube',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            if (lastSync != null)
                              Text(
                                'Ultima: ${_formatDate(lastSync)}',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                              ),
                          ],
                        ),
                      ),
                      Switch(
                        value: syncEnabled,
                        onChanged: (v) async {
                          await prefs.setCloudSyncEnabled(v);
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  if (syncEnabled) ...[
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: _syncing ? null : _syncNow,
                        icon: _syncing
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Icon(Icons.sync),
                        label: Text(_syncing ? 'Sincronizando...' : 'Sincronizar ahora'),
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Info card
            LargeCard(
              backgroundColor: AppColors.primaryLight.withValues(alpha: 0.1),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: AppColors.primary),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Crea un codigo de acceso para que tu familia pueda ver tus datos de salud desde cualquier dispositivo.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Create new code button
            LargeButton(
              text: _creating ? 'Creando...' : 'Crear acceso para un familiar',
              icon: Icons.person_add,
              onPressed: (_creating || !syncEnabled) ? null : _createCode,
            ),

            const SizedBox(height: 24),

            // Existing codes
            if (_loading)
              const Center(child: CircularProgressIndicator())
            else if (_codes.isEmpty)
              Center(
                child: Text(
                  'No hay codigos de acceso creados.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                ),
              )
            else ...[
              Text(
                'Accesos activos',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              for (final code in _codes)
                _buildCodeCard(code),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCodeCard(Map<String, dynamic> code) {
    final isActive = code['is_active'] as bool? ?? true;
    final label = code['label'] as String? ?? '';
    final accessCode = code['access_code'] as String? ?? '';
    final lastAccessed = code['last_accessed_at'] as String?;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: LargeCard(
        borderColor: isActive ? AppColors.greenDay : AppColors.disabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isActive ? Icons.person : Icons.person_off,
                  color: isActive ? AppColors.primary : AppColors.disabled,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label,
                          style: Theme.of(context).textTheme.titleMedium),
                      Text(
                        accessCode,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                      ),
                      if (lastAccessed != null)
                        Text(
                          'Ultimo acceso: ${_formatDate(DateTime.parse(lastAccessed))}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: accessCode));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Codigo copiado')),
                      );
                    },
                    icon: const Icon(Icons.copy, size: 18),
                    label: const Text('Copiar'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Share.share(
                        'Tu codigo de acceso para ver mis datos de salud en Appbuelito es: $accessCode',
                        subject: 'Acceso a Appbuelito',
                      );
                    },
                    icon: const Icon(Icons.share, size: 18),
                    label: const Text('Enviar'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    isActive ? Icons.pause_circle : Icons.play_circle,
                    color: isActive ? AppColors.yellowDay : AppColors.greenDay,
                  ),
                  tooltip: isActive ? 'Pausar acceso' : 'Activar acceso',
                  onPressed: () async {
                    final syncService = ref.read(syncServiceProvider);
                    if (syncService == null) return;
                    await syncService.toggleAccessCode(
                        code['id'] as String, !isActive);
                    await _loadCodes();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: AppColors.danger),
                  tooltip: 'Eliminar acceso',
                  onPressed: () async {
                    final confirm = await showLargeConfirmationDialog(
                      context: context,
                      title: 'Eliminar acceso',
                      message: 'Seguro que quieres eliminar el acceso de $label?',
                      confirmText: 'Eliminar',
                      isDangerous: true,
                    );
                    if (confirm) {
                      final syncService = ref.read(syncServiceProvider);
                      if (syncService == null) return;
                      await syncService.deleteAccessCode(code['id'] as String);
                      await _loadCodes();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inMinutes < 1) return 'Hace un momento';
    if (diff.inMinutes < 60) return 'Hace ${diff.inMinutes} min';
    if (diff.inHours < 24) return 'Hace ${diff.inHours} h';
    return '${dt.day}/${dt.month}/${dt.year} ${dt.hour}:${dt.minute.toString().padLeft(2, '0')}';
  }
}
