import 'package:flutter/material.dart';
import 'package:body_buliding/core/utils/app_colors.dart';

class MotivationSection extends StatelessWidget {
  const MotivationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withOpacity(0.2), width: 1),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.format_quote_rounded,
            color: AppColors.primary,
            size: 40,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              'لا تتوقف عندما تتعب، بل توقف عندما تنتهي.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
