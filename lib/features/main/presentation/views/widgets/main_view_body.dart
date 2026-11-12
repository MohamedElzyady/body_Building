import 'package:flutter/material.dart';
import 'package:body_buliding/features/main/presentation/views/widgets/greeting_section.dart';
import 'package:body_buliding/features/main/presentation/views/widgets/today_workout_card.dart';
import 'package:body_buliding/features/main/presentation/views/widgets/quick_stats_section.dart';
import 'package:body_buliding/features/main/presentation/views/widgets/weekly_progress_section.dart';
import 'package:body_buliding/features/main/presentation/views/widgets/featured_exercise_section.dart';
import 'package:body_buliding/features/main/presentation/views/widgets/motivation_section.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            children: const [
              GreetingSection(),
              SizedBox(height: 24),
              TodayWorkoutCard(),
              SizedBox(height: 24),
              QuickStatsSection(),
              SizedBox(height: 24),
              WeeklyProgressSection(),
              SizedBox(height: 24),
              FeaturedExerciseSection(),
              SizedBox(height: 24),
              MotivationSection(),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
