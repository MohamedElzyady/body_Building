import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class WeightChip extends StatelessWidget {
  final double weight;

  const WeightChip({super.key, required this.weight});

  @override
  Widget build(BuildContext context) {
    final label = '${weight % 1 == 0 ? weight.toInt() : weight} kg';
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.fitness_center, size: 13, color: AppColors.primary),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
