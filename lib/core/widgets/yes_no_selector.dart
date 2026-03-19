import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Two giant buttons for yes/no questions. Designed for single-tap answers.
class YesNoSelector extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool> onChanged;
  final String yesText;
  final String noText;

  const YesNoSelector({
    super.key,
    this.value,
    required this.onChanged,
    this.yesText = 'Si',
    this.noText = 'No',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _OptionButton(
            text: yesText,
            isSelected: value == true,
            color: AppColors.success,
            onTap: () => onChanged(true),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _OptionButton(
            text: noText,
            isSelected: value == false,
            color: AppColors.danger,
            onTap: () => onChanged(false),
          ),
        ),
      ],
    );
  }
}

class _OptionButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;

  const _OptionButton({
    required this.text,
    required this.isSelected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? color : AppColors.surfaceVariant,
      borderRadius: BorderRadius.circular(16),
      elevation: isSelected ? 4 : 1,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
