import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

enum LargeButtonVariant { primary, secondary, danger, success, outlined }

/// A large, accessible button for elderly users.
/// Minimum height 56dp, large text, generous padding.
class LargeButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final LargeButtonVariant variant;
  final IconData? icon;
  final bool isLoading;
  final double? width;

  const LargeButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = LargeButtonVariant.primary,
    this.icon,
    this.isLoading = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    if (variant == LargeButtonVariant.outlined) {
      return SizedBox(
        width: width ?? double.infinity,
        child: OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(200, 60),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
            side: BorderSide(
              color: onPressed == null ? AppColors.disabled : AppColors.primary,
              width: 2,
            ),
          ),
          child: _buildChild(context, AppColors.primary),
        ),
      );
    }

    final (bgColor, fgColor) = _getColors();

    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          minimumSize: const Size(200, 60),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          disabledBackgroundColor: AppColors.disabledBg,
          disabledForegroundColor: AppColors.disabled,
        ),
        child: _buildChild(context, fgColor),
      ),
    );
  }

  Widget _buildChild(BuildContext context, Color color) {
    if (isLoading) {
      return SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          color: color,
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 28),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      );
    }

    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }

  (Color, Color) _getColors() {
    switch (variant) {
      case LargeButtonVariant.primary:
        return (AppColors.primary, AppColors.textOnPrimary);
      case LargeButtonVariant.secondary:
        return (AppColors.surfaceVariant, AppColors.textPrimary);
      case LargeButtonVariant.danger:
        return (AppColors.dangerBg, AppColors.textOnDanger);
      case LargeButtonVariant.success:
        return (AppColors.success, AppColors.textOnPrimary);
      case LargeButtonVariant.outlined:
        return (Colors.transparent, AppColors.primary);
    }
  }
}
