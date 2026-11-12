import 'package:flutter/material.dart';
import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:body_buliding/features/home/data/exercise_model.dart';
import 'package:body_buliding/features/exercises/presentation/views/exercies_view.dart';

class FeaturedExerciseSection extends StatelessWidget {
  const FeaturedExerciseSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch data
    final workoutSystem = WorkoutSystemModel.sampleSystems.first;
    final selectedWorkoutDay = workoutSystem.workoutDays.first;
    final featuredExercise = selectedWorkoutDay.exercises.first;

    final imagePath = featuredExercise.thumbNail.isNotEmpty
        ? featuredExercise.thumbNail
        : 'assets/images/placeholder.png';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'تمرين مقترح لك',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ExerciesView(
                  workoutDay: selectedWorkoutDay,
                ),
              ),
            );
          },
          child: LayoutBuilder(
            builder: (context, constraints) {
              final imageSize =
                  (constraints.maxWidth * 0.24).clamp(70.0, 90.0);

              return Container(
                decoration: BoxDecoration(
                  color: AppColors.cardBg,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.05),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: imageSize,
                      height: imageSize,
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.play_circle_fill,
                            color: AppColors.primary,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        featuredExercise.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        featuredExercise.targetMuscle,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white30,
                    size: 16,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
  ],
);
  }
}

