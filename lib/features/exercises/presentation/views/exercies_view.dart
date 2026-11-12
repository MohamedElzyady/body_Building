import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:body_buliding/features/exercises/presentation/views/widgets/exercise_card.dart';
import 'package:body_buliding/features/home/data/exercise_model.dart';
import 'package:body_buliding/sheard/custom_appbar.dart';
import 'package:flutter/material.dart';

class ExerciesView extends StatelessWidget {
  final WorkoutDayModel workoutDay;

  const ExerciesView({
    super.key,
    required this.workoutDay,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: CustomAppBar(title: workoutDay.name),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            itemCount: workoutDay.exercises.length,
            itemBuilder: (context, index) {
              final exercise = workoutDay.exercises[index];
              return ExerciseCard(exercise: exercise);
            },
          ),
        ),
      ),
    );
  
  
  }
}