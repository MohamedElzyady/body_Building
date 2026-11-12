import 'package:flutter/material.dart';
import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:body_buliding/features/user/data/models/user_model.dart';

class ProfileInfoCard extends StatelessWidget {
  final UserModel? user;

  const ProfileInfoCard({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    final weight = user?.weight ?? 0.0;
    final height = user?.height ?? 0.0;
    final age = user?.age ?? 0;

    String bmiStr = '-';
    if (weight > 0 && height > 0) {
      final heightInMeters = height / 100;
      final bmi = weight / (heightInMeters * heightInMeters);
      bmiStr = bmi.toStringAsFixed(1);
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0x0DFFFFFF), width: 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildInfoItem(
                icon: Icons.monitor_weight_outlined,
                label: 'الوزن',
                value: weight > 0 ? (weight % 1 == 0 ? weight.toInt().toString() : weight.toStringAsFixed(1)) : '-',
                unit: 'KG',
              ),
              _buildDivider(),
              _buildInfoItem(
                icon: Icons.height_rounded,
                label: 'الطول',
                value: height > 0 ? (height % 1 == 0 ? height.toInt().toString() : height.toStringAsFixed(1)) : '-',
                unit: 'CM',
              ),
            ],
          ),
          const SizedBox(height: 20),
          Divider(color: Colors.white.withValues(alpha: 0.06), thickness: 1),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildInfoItem(
                icon: Icons.cake_outlined,
                label: 'العمر',
                value: age > 0 ? age.toString() : '-',
                unit: 'سنة',
              ),
              _buildDivider(),
              _buildInfoItem(
                icon: Icons.speed_rounded,
                label: 'BMI',
                value: bmiStr,
                unit: 'طبيعي',
                unitColor: AppColors.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
    required String unit,
    Color? unitColor,
  }) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primary, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        value,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        unit,
                        style: TextStyle(
                          color: unitColor ?? AppColors.textSecondary,
                          fontSize: 12,
                          fontWeight: unitColor != null
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 44,
      color: Colors.white.withValues(alpha: 0.06),
    );
  }
}
