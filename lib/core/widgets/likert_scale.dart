import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// A 1-5 scale with large icons/emojis for symptom questionnaires.
class LikertScale extends StatelessWidget {
  final int? value;
  final ValueChanged<int> onChanged;
  final List<String> labels;
  final List<IconData>? icons;
  final List<Color>? colors;

  const LikertScale({
    super.key,
    this.value,
    required this.onChanged,
    required this.labels,
    this.icons,
    this.colors,
  });

  static const List<Color> defaultColors = [
    AppColors.greenDay,
    Color(0xFF66BB6A),
    AppColors.yellowDay,
    Color(0xFFFF9800),
    AppColors.redDay,
  ];

  static const List<IconData> defaultIcons = [
    Icons.sentiment_very_satisfied,
    Icons.sentiment_satisfied,
    Icons.sentiment_neutral,
    Icons.sentiment_dissatisfied,
    Icons.sentiment_very_dissatisfied,
  ];

  @override
  Widget build(BuildContext context) {
    final effectiveColors = colors ?? defaultColors;
    final effectiveIcons = icons ?? defaultIcons;
    final itemCount = labels.length;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(itemCount, (index) {
            final isSelected = value == (index + 1);
            final color = effectiveColors[index % effectiveColors.length];
            final icon = effectiveIcons[index % effectiveIcons.length];

            return GestureDetector(
              onTap: () => onChanged(index + 1),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: isSelected ? 68 : 60,
                height: isSelected ? 68 : 60,
                decoration: BoxDecoration(
                  color: isSelected ? color : AppColors.surfaceVariant,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? color : AppColors.border,
                    width: isSelected ? 3 : 1,
                  ),
                  boxShadow: isSelected
                      ? [BoxShadow(color: color.withValues(alpha: 0.4), blurRadius: 8)]
                      : null,
                ),
                child: Icon(
                  icon,
                  size: 36,
                  color: isSelected ? Colors.white : AppColors.textSecondary,
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 12),
        if (value != null && value! >= 1 && value! <= itemCount)
          Text(
            labels[value! - 1],
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
