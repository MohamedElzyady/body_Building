import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingStepProgress extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const OnboardingStepProgress({
    super.key,
    required this.currentStep,
    this.totalSteps = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: List.generate(totalSteps * 2 - 1, (index) {
          if (index.isOdd) {
            final lineIndex = index ~/ 2;
            final isActive = lineIndex < currentStep - 1;
            return Expanded(
              child: Container(
                height: 2,
                color: isActive ? AppColors.primary : AppColors.indicatorInactive,
              ),
            );
          }

          final stepNumber = (index ~/ 2) + 1;
          final isActive = stepNumber <= currentStep;
          final isCurrent = stepNumber == currentStep;

          return _StepNode(
            stepNumber: stepNumber,
            isActive: isActive,
            isCurrent: isCurrent,
          );
        }),
      ),
    );
  }
}

class _StepNode extends StatelessWidget {
  final int stepNumber;
  final bool isActive;
  final bool isCurrent;

  const _StepNode({
    required this.stepNumber,
    required this.isActive,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.primary : AppColors.indicatorInactive,
        boxShadow: isCurrent
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.35),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ]
            : null,
      ),
      child: Center(
        child: Text(
          '$stepNumber',
          style: TextStyle(
            color: isActive ? AppColors.black : AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
