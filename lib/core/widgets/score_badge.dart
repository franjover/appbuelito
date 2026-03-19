import 'package:flutter/material.dart';
import '../../data/models/day_classification.dart';
import '../theme/app_colors.dart';

/// Visual badge showing the day classification (green/yellow/red).
class ScoreBadge extends StatelessWidget {
  final DayClassification classification;
  final bool large;

  const ScoreBadge({
    super.key,
    required this.classification,
    this.large = false,
  });

  @override
  Widget build(BuildContext context) {
    final (bgColor, fgColor, iconData) = _getStyle();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: large ? 24 : 16,
        vertical: large ? 12 : 8,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(large ? 16 : 12),
        border: Border.all(color: fgColor, width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, color: fgColor, size: large ? 28 : 20),
          const SizedBox(width: 8),
          Text(
            classification.displayName,
            style: TextStyle(
              color: fgColor,
              fontSize: large ? 20 : 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  (Color, Color, IconData) _getStyle() {
    switch (classification) {
      case DayClassification.green:
        return (AppColors.greenDayBg, AppColors.greenDay, Icons.check_circle);
      case DayClassification.yellow:
        return (AppColors.yellowDayBg, AppColors.yellowDay, Icons.warning_rounded);
      case DayClassification.red:
        return (AppColors.redDayBg, AppColors.redDay, Icons.error);
    }
  }
}
