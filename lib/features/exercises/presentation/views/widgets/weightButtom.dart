import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class EditWeightButton extends StatelessWidget {
  final VoidCallback onTap;

  const EditWeightButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.edit, size: 14, color: AppColors.primary),
      ),
    );
  }
}
