import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:body_buliding/features/user/view_model/cubit/user_cubit.dart';
import 'package:body_buliding/features/user/view_model/cubit/user_state.dart';

class QuickStatsSection extends StatelessWidget {
  const QuickStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        final weight = state.user?.weight ?? 0.0;
        final height = state.user?.height ?? 0.0;
        final goal = state.user?.goal ?? '-';

        String bmiStr = '-';
        if (weight > 0 && height > 0) {
          final heightInMeters = height / 100;
          final bmi = weight / (heightInMeters * heightInMeters);
          bmiStr = bmi.toStringAsFixed(1);
        }

        final weightStr = weight > 0
            ? (weight % 1 == 0 ? weight.toInt().toString() : weight.toStringAsFixed(1))
            : '-';
        final weightLabel = weight > 0 ? '$weightStr KG' : '-';

        return LayoutBuilder(
          builder: (context, constraints) {
            final isNarrow = constraints.maxWidth < 340;
            final spacing = isNarrow ? 8.0 : 12.0;
            final padding = isNarrow ? 10.0 : 14.0;

            return Row(
              children: [
                _buildStatCard(
                  'الوزن',
                  weightLabel,
                  Icons.monitor_weight_outlined,
                  padding,
                ),
                SizedBox(width: spacing),
                _buildStatCard(
                  'BMI',
                  bmiStr,
                  Icons.speed_rounded,
                  padding,
                ),
                SizedBox(width: spacing),
                _buildStatCard(
                  'الهدف',
                  goal,
                  Icons.track_changes_rounded,
                  padding,
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    double padding,
  ) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: padding * 0.75,
          vertical: padding,
        ),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.05),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primary, size: 22),
            const SizedBox(height: 10),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
            const SizedBox(height: 4),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

