import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:body_buliding/sheard/widgets/goal_card.dart';
import 'package:flutter/material.dart';

class GoalSelectionPage extends StatelessWidget {
  final String? selectedGoal;
  final ValueChanged<String> onGoalSelected;

  const GoalSelectionPage({
    super.key,
    required this.selectedGoal,
    required this.onGoalSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          const Text(
            'ما هو هدفك الأساسي؟',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          GoalCard(
            title: 'بناء عضلات',
            icon: Icons.fitness_center_rounded,
            isSelected: selectedGoal == 'بناء عضلات',
            onTap: () => onGoalSelected('بناء عضلات'),
          ),
          const SizedBox(height: 12),
          GoalCard(
            title: 'تخسيس',
            icon: Icons.local_fire_department_rounded,
            isSelected: selectedGoal == 'تخسيس',
            onTap: () => onGoalSelected('تخسيس'),
          ),
          const SizedBox(height: 12),
          GoalCard(
            title: 'تنشيف',
            icon: Icons.water_drop_outlined,
            isSelected: selectedGoal == 'تنشيف',
            onTap: () => onGoalSelected('تنشيف'),
          ),
          const SizedBox(height: 12),
          GoalCard(
            title: 'تحسين اللياقة',
            icon: Icons.directions_run_rounded,
            isSelected: selectedGoal == 'تحسين اللياقة',
            onTap: () => onGoalSelected('تحسين اللياقة'),
          ),
          const SizedBox(height: 12),
          GoalCard(
            title: 'المحافظة على الوزن',
            icon: Icons.monitor_weight_outlined,
            isSelected: selectedGoal == 'المحافظة على الوزن',
            onTap: () => onGoalSelected('المحافظة على الوزن'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
