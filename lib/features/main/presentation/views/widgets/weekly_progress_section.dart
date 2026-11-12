import 'package:flutter/material.dart';
import 'package:body_buliding/core/utils/app_colors.dart';

class WeeklyProgressSection extends StatelessWidget {
  const WeeklyProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy boolean list representing week days completion
    final weekDays = ['س', 'ح', 'ن', 'ث', 'ر', 'خ', 'ج'];
    final progress = [true, false, true, true, false, false, false];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'نشاط الأسبوع',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final itemSize = (constraints.maxWidth / 8.5).clamp(24.0, 36.0);
              final iconSize = (itemSize * 0.55).clamp(14.0, 20.0);

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(7, (index) {
                  final isCompleted = progress[index];
                  return Column(
                    children: [
                      Container(
                        width: itemSize,
                        height: itemSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isCompleted
                              ? AppColors.primary
                              : AppColors.primary.withValues(alpha: 0.1),
                        ),
                        child: Icon(
                          Icons.check_rounded,
                          color: isCompleted
                              ? AppColors.scaffoldBg
                              : Colors.transparent,
                          size: iconSize,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        weekDays[index],
                        style: TextStyle(
                          color: isCompleted
                              ? AppColors.primary
                              : AppColors.textSecondary,
                          fontSize: 12,
                          fontWeight:
                              isCompleted ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
