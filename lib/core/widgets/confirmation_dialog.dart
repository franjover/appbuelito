import 'package:flutter/material.dart';
import 'large_button.dart';

/// A confirmation dialog with large buttons, designed for elderly users.
/// Used for emergency confirmations, skip confirmations, etc.
Future<bool> showLargeConfirmationDialog({
  required BuildContext context,
  required String title,
  required String message,
  String confirmText = 'Si',
  String cancelText = 'Cancelar',
  LargeButtonVariant confirmVariant = LargeButtonVariant.primary,
  bool isDangerous = false,
}) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) => Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            LargeButton(
              text: confirmText,
              variant: isDangerous
                  ? LargeButtonVariant.danger
                  : confirmVariant,
              onPressed: () => Navigator.of(context).pop(true),
            ),
            const SizedBox(height: 12),
            LargeButton(
              text: cancelText,
              variant: LargeButtonVariant.outlined,
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ],
        ),
      ),
    ),
  );
  return result ?? false;
}
