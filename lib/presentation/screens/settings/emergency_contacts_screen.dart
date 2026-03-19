import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/large_button.dart';
import '../../../core/widgets/large_card.dart';
import '../../../core/widgets/confirmation_dialog.dart';
import '../../../data/local/database/app_database.dart';
import '../../providers/app_providers.dart';

/// Screen to manage emergency contacts with reordering support.
class EmergencyContactsScreen extends ConsumerWidget {
  const EmergencyContactsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactsAsync = ref.watch(emergencyContactsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactos de emergencia'),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'add_contact',
        backgroundColor: AppColors.primary,
        onPressed: () => _showContactDialog(context, ref),
        child: const Icon(Icons.add, size: 28),
      ),
      body: contactsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (contacts) {
          if (contacts.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.contacts_outlined,
                        size: 64, color: AppColors.disabled),
                    const SizedBox(height: 16),
                    Text(
                      'No hay contactos de emergencia.\nAnade al menos uno.',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    LargeButton(
                      text: 'Anadir contacto',
                      icon: Icons.person_add,
                      onPressed: () => _showContactDialog(context, ref),
                    ),
                  ],
                ),
              ),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                child: Text(
                  'Manten pulsado y arrastra para reordenar',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.textSecondary),
                ),
              ),
              Expanded(
                child: ReorderableListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: contacts.length,
                  onReorder: (oldIndex, newIndex) async {
                    if (newIndex > oldIndex) newIndex--;
                    final reordered = List<EmergencyContact>.from(contacts);
                    final item = reordered.removeAt(oldIndex);
                    reordered.insert(newIndex, item);
                    final db = ref.read(databaseProvider);
                    await db.userDao.updateContactPriorities(
                      reordered.map((c) => c.id).toList(),
                    );
                  },
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    return Padding(
                      key: ValueKey(contact.id),
                      padding: const EdgeInsets.only(bottom: 8),
                      child: LargeCard(
                        leadingIcon: Icons.person,
                        child: Row(
                          children: [
                            const Icon(Icons.drag_handle,
                                size: 24, color: AppColors.textSecondary),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(contact.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge),
                                      if (index == 0) ...[
                                        const SizedBox(width: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text('Principal',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                      color: Colors.white)),
                                        ),
                                      ],
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(contact.phone,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                  Text(contact.relationship,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: AppColors.textSecondary)),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: AppColors.primary),
                                  onPressed: () => _showContactDialog(
                                      context, ref,
                                      existing: contact),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: AppColors.danger),
                                  onPressed: () async {
                                    final confirm =
                                        await showLargeConfirmationDialog(
                                      context: context,
                                      title: 'Eliminar contacto',
                                      message:
                                          'Seguro que quieres eliminar a ${contact.name}?',
                                      confirmText: 'Eliminar',
                                      isDangerous: true,
                                    );
                                    if (confirm) {
                                      final db = ref.read(databaseProvider);
                                      await db.userDao
                                          .deleteContact(contact.id);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showContactDialog(BuildContext context, WidgetRef ref,
      {dynamic existing}) {
    final nameCtrl = TextEditingController(text: existing?.name ?? '');
    final phoneCtrl = TextEditingController(text: existing?.phone ?? '');
    final relCtrl =
        TextEditingController(text: existing?.relationship ?? 'Familiar');
    final isEditing = existing != null;

    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                isEditing ? 'Editar contacto' : 'Nuevo contacto',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Nombre'),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phoneCtrl,
                decoration: const InputDecoration(labelText: 'Telefono'),
                style: Theme.of(context).textTheme.bodyLarge,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: relCtrl,
                decoration: const InputDecoration(
                    labelText: 'Relacion (hijo, hija, vecino...)'),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              LargeButton(
                text: isEditing ? 'Guardar cambios' : 'Anadir',
                variant: LargeButtonVariant.success,
                onPressed: () async {
                  if (nameCtrl.text.isEmpty || phoneCtrl.text.isEmpty) return;
                  final db = ref.read(databaseProvider);

                  if (isEditing) {
                    await db.userDao.updateContact(
                      EmergencyContactsCompanion(
                        id: Value(existing.id as int),
                        userId: Value(existing.userId as int),
                        name: Value(nameCtrl.text),
                        phone: Value(phoneCtrl.text),
                        relationship: Value(relCtrl.text),
                        priority: Value(existing.priority as int),
                      ),
                    );
                  } else {
                    await db.userDao.insertContact(
                      EmergencyContactsCompanion.insert(
                        userId: 1,
                        name: nameCtrl.text,
                        phone: phoneCtrl.text,
                        relationship: relCtrl.text,
                      ),
                    );
                  }
                  if (ctx.mounted) Navigator.of(ctx).pop();
                },
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('Cancelar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
