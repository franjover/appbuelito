import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Progress indicator for multi-step flows (onboarding, questionnaires).
class StepIndicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final double dotSize;

  const StepIndicator({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    this.dotSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        final isCompleted = index < currentStep;
        final isCurrent = index == currentStep;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isCurrent ? dotSize * 2.5 : dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            color: isCompleted || isCurrent
                ? AppColors.primary
                : AppColors.disabled,
            borderRadius: BorderRadius.circular(dotSize / 2),
          ),
        );
      }),
    );
  }
}
