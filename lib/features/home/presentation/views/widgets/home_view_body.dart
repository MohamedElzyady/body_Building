import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:body_buliding/features/home/data/exercise_model.dart';
import 'package:body_buliding/sheard/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeMainBody extends StatefulWidget {
  const HomeMainBody({super.key});

  @override
  State<HomeMainBody> createState() => _HomeMainBodyState();
}

class _HomeMainBodyState extends State<HomeMainBody> {
  int? _expandedIndex; // Tracks the index of the currently expanded card

  final List<WorkoutSystemModel> excersisesList = WorkoutSystemModel.sampleSystems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: const CustomAppBar(title: 'التمارين'),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            itemCount: excersisesList.length,
        itemBuilder: (context, index) {
          WorkoutSystemModel exercise = excersisesList[index];
          final isExpanded = _expandedIndex == index;

          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: AppColors.cardBg,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0x0DFFFFFF), width: 1),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _expandedIndex = isExpanded ? null : index;
                  });
                },
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Main Card Header
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 24,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color(0x1AD0FD3E),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.fitness_center_rounded,
                              color: AppColors.primary,
                              size: 30,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  exercise.title.trim(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  exercise.supTitle,
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedRotation(
                            turns: isExpanded ? -0.25 : 0.0,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInOut,
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white54,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Expandable Section
                    AnimatedSize(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      child: isExpanded
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Divider(
                                    color: Colors.white10,
                                    thickness: 1,
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'أيام التدريب في هذا النظام:',
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  ...exercise.workoutDays.map(
                                    (day) => _WorkoutDayItem(workoutDay: day),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ),
  ),
);
  }
}

class _WorkoutDayItem extends StatelessWidget {
  final WorkoutDayModel workoutDay;

  const _WorkoutDayItem({required this.workoutDay});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push('/exercises', extra: workoutDay);
        },
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: Row(
            children: [
              const Icon(
                Icons.radio_button_checked_rounded,
                color: AppColors.primary,
                size: 14,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  workoutDay.name,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white30,
                size: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
