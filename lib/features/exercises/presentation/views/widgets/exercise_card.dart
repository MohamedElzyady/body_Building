import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:body_buliding/features/exercises/presentation/views/widgets/exercices_ifo_chip.dart';
import 'package:body_buliding/features/exercises/presentation/views/widgets/exercise_media.dart';
import 'package:body_buliding/features/exercises/presentation/views/widgets/weightButtom.dart';
import 'package:body_buliding/features/exercises/presentation/views/widgets/weightChip.dart';
import 'package:body_buliding/features/exercises/presentation/views/widgets/weight_edit_dialog.dart';
import 'package:body_buliding/features/exercises/view_model/cubit/weight_cubit.dart';
import 'package:body_buliding/features/exercises/view_model/cubit/weight_state.dart';
import 'package:body_buliding/features/home/data/exercise_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseCard extends StatelessWidget {
  final ExerciseModel exercise;

  const ExerciseCard({super.key, required this.exercise});

  void _openWeightDialog(BuildContext context, double? currentWeight) {
    showDialog<void>(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<WeightCubit>(),
        child: WeightEditDialog(
          exerciseName: exercise.name,
          currentWeight: currentWeight,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeightCubit, WeightState>(
      builder: (context, state) {
        final lastWeight = state.weightFor(exercise.name);

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.cardBg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0x0DFFFFFF), width: 1),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExerciseMedia(exercise: exercise),
              const SizedBox(width: 16),
              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Target: ${exercise.targetMuscle}',
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ExercisesInfoChip(text: '${exercise.sets} Sets'),
                        ExercisesInfoChip(text: '${exercise.reps} Reps'),
                        ExercisesInfoChip(text: exercise.restTime),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Last Weight row
                    Row(
                      children: [
                        Expanded(
                          child: lastWeight != null
                              ? WeightChip(weight: lastWeight)
                              : const Text(
                                  'No weight logged',
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 12,
                                  ),
                                ),
                        ),
                        EditWeightButton(
                          onTap: () => _openWeightDialog(context, lastWeight),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
