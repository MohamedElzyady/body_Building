class ExerciseModel {
  final String name;
  final String thumbNail;
  final String targetMuscle;
  final int sets;
  final String reps;
  final String? videoPath;
  final String restTime;

  const ExerciseModel({
    required this.name,
    required this.thumbNail,
    required this.targetMuscle,
    required this.sets,
    required this.reps,
    required this.restTime,
    this.videoPath,
  });
}

/// Represents a single training day within a workout system.
class WorkoutDayModel {
  final String name;
  final List<ExerciseModel> exercises;

  const WorkoutDayModel({required this.name, required this.exercises});
}

/// Represents a workout system (e.g. PPL, Arnold Split).
/// Contains metadata and its associated training days.
class WorkoutSystemModel {
  final String title;
  final String supTitle;
  final List<WorkoutDayModel> workoutDays;

  const WorkoutSystemModel({
    required this.title,
    required this.supTitle,
    required this.workoutDays,
  });

  static const List<WorkoutSystemModel> sampleSystems = [
    // PPL
    WorkoutSystemModel(
      title: 'PPL',
      supTitle: 'النظام',
      workoutDays: [
        WorkoutDayModel(
          name: 'Push',
          exercises: [
            ExerciseModel(
              videoPath: 'assets/execrices/chest/bench_press.mp4',
              name: 'Bench Press',
              thumbNail: 'assets/thumbnail/chest/bench_press.jpg',
              targetMuscle: 'Chest',
              sets: 4,
              reps: '8-12',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'Incline Dumbbell Press',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Upper Chest',
              sets: 3,
              reps: '10-12',
              restTime: '90s',
            ),
            ExerciseModel(
              videoPath: 'assets/execrices/shoulder/Front_shoulder_bar.mp4',
              name: 'Shoulder Press',
              thumbNail: 'assets/thumbnail/shoulder/Front_shoulder_bar.jpg',
              targetMuscle: 'Shoulders',
              sets: 2,
              reps: '8-10',
              restTime: '90s',
            ),
            ExerciseModel(
              videoPath: 'assets/execrices/shoulder/Dumbbell_lateral_raise.mp4',
              name: 'Lateral Raise',
              thumbNail: 'assets/thumbnail/shoulder/Dumbbell_lateral_raise.jpg',
              targetMuscle: 'Side Delts',
              sets: 4,
              reps: '12-15',
              restTime: '60s',
            ),
            ExerciseModel(
              videoPath: 'assets/execrices/trysebses/Triceps_Pushdown.mp4',
              name: 'Triceps Pushdown',
              thumbNail: 'assets/thumbnail/trysebses/Triceps_Pushdown.jpg',
              targetMuscle: 'Triceps',
              sets: 3,
              reps: '10-15',
              restTime: '60s',
            ),
          ],
        ),
        WorkoutDayModel(
          name: 'Pull',
          exercises: [
            ExerciseModel(
              videoPath: 'assets/execrices/back/T-Bar_row.mp4',
              name: 'T-Bar Row',
              thumbNail: 'assets/thumbnail/back/T-Bar_row.jpg',
              targetMuscle: 'Back',
              sets: 4,
              reps: '8-10',
              restTime: '90s',
            ),
            ExerciseModel(
              videoPath: 'assets/execrices/back/Pull-up.mp4',
              name: 'Pull Up',
              thumbNail: 'assets/thumbnail/back/Pull-up.jpg',
              targetMuscle: 'Lats',
              sets: 4,
              reps: '8-12',
              restTime: '90s',
            ),
            ExerciseModel(
              videoPath: 'assets/execrices/back/one_arm_Dumbbell_row.mp4',
              name: 'Dumbbell row',
              thumbNail: 'assets/thumbnail/back/one_arm_Dumbbell_row.jpg',
              targetMuscle: 'Mid Back',
              sets: 3,
              reps: '10-12',
              restTime: '90s',
            ),
            ExerciseModel(
              videoPath: 'assets/execrices/back/Lower_back.mp4',
              name: 'Lower back',
              thumbNail: 'assets/thumbnail/back/Lower_back.jpg',
              targetMuscle: 'Rear Delts',
              sets: 3,
              reps: '12-15',
              restTime: '60s',
            ),
            ExerciseModel(
              videoPath: 'assets/execrices/shoulder/batterfly_rar_shoulder.mp4',
              name: 'Machine Rear Delt Fly',
              thumbNail: 'assets/thumbnail/shoulder/batterfly_rar_shoulder.jpg',
              targetMuscle: 'Rear shoulder',
              sets: 3,
              reps: '10-12',
              restTime: '60s',
            ),
            ExerciseModel(
              videoPath: 'assets/execrices/shoulder/Trapezius.mp4',
              name: 'Trapezius',
              thumbNail: 'assets/thumbnail/shoulder/Trapezius.jpg',
              targetMuscle: 'Upper Trapezius',
              sets: 3,
              reps: '10-12',
              restTime: '60s',
            ),
            ExerciseModel(
              videoPath: 'assets/execrices/baysibses/Biceps.mp4',
              name: 'Biceps',
              thumbNail: 'assets/thumbnail/baysibses/Biceps.jpg',
              targetMuscle: 'Inner Biceps',
              sets: 3,
              reps: '10-12',
              restTime: '60s',
            ),
          ],
        ),
        WorkoutDayModel(
          name: 'Legs',
          exercises: [
            ExerciseModel(
              videoPath: 'assets/execrices/leg/Leg_Extension.mp4',
              name: 'Leg Extension',
              thumbNail: 'assets/thumbnail/leg/Leg_Extension.jpg',
              targetMuscle: 'Quads',
              sets: 3,
              reps: '12-15',
              restTime: '60s',
            ),
            ExerciseModel(
              videoPath: 'assets/execrices/leg/Barbell_squat.mp4',
              name: 'Squat',
              thumbNail: 'assets/thumbnail/leg/Barbell_squat.jpg',
              targetMuscle: 'Quads',
              sets: 4,
              reps: '8-10',
              restTime: '120s',
            ),
            ExerciseModel(
              videoPath: 'assets/execrices/leg/Leg_Press.mp4',
              name: 'Leg Press',
              thumbNail: 'assets/thumbnail/leg/Leg_Press.jpg',
              targetMuscle: 'Quads',
              sets: 3,
              reps: '10-15',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'Standing Calf Raise',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Calves',
              sets: 3,
              reps: '15-20',
              restTime: '60s',
            ),
          ],
        ),
      ],
    ),
    // Arnold Split
    WorkoutSystemModel(
      title: 'Arnold Split',
      supTitle: 'النظام',
      workoutDays: [
        WorkoutDayModel(
          name: 'Chest & Back',
          exercises: [
            ExerciseModel(
              name: 'incline dumbell press',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Upper Chest',
              sets: 4,
              reps: '8-12',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'T-Bar Row',
              videoPath: 'assets/execrices/back/T-Bar_row.mp4',
              thumbNail: 'assets/thumbnail/back/T-Bar_row.jpg',
              targetMuscle: 'Back',
              sets: 4,
              reps: '8-12',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'Bench Press',
              videoPath: 'assets/execrices/chest/bench_press.mp4',
              thumbNail: 'assets/thumbnail/chest/bench_press.jpg',
              targetMuscle: 'chest',
              sets: 3,
              reps: '10-12',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'Lat Pulldown',
              videoPath: 'assets/execrices/back/Pull-up.mp4',

              thumbNail: 'assets/thumbnail/back/Pull-up.jpg',
              targetMuscle: 'Back',
              sets: 4,
              reps: '8-10',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'machine_chest_fly',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'chest',
              sets: 4,
              reps: '8-10',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'Seated Cable Row',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Back',
              sets: 4,
              reps: '8-10',
              restTime: '90s',
            ),
            ExerciseModel(
              videoPath: 'assets/execrices/back/one_arm_Dumbbell_row.mp4',
              name: 'Dumbbell row',
              thumbNail: 'assets/thumbnail/back/one_arm_Dumbbell_row.jpg',
              targetMuscle: 'Mid Back',
              sets: 3,
              reps: '10-12',
              restTime: '90s',
            ),
          ],
        ),
        WorkoutDayModel(
          name: 'Shoulders & Arms',
          exercises: [
            ExerciseModel(
              name: 'Shoulder Press',
              videoPath: 'assets/execrices/shoulder/Front_shoulder_bar.mp4',
              thumbNail: 'assets/thumbnail/shoulder/Front_shoulder_bar.jpg',
              targetMuscle: 'Shoulders',
              sets: 4,
              reps: '8-10',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'Machine Preacher Curl',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Biceps',
              sets: 3,
              reps: '10-12',
              restTime: '60s',
            ),
            ExerciseModel(
              videoPath: 'assets/execrices/shoulder/Dumbbell_lateral_raise.mp4',
              name: 'Fly Lateral Raise',
              thumbNail: 'assets/thumbnail/shoulder/Dumbbell_lateral_raise.jpg',
              targetMuscle: 'Shoulders',
              sets: 3,
              reps: '10-15',
              restTime: '60s',
            ),
            ExerciseModel(
              name: 'Cable Overhead Extension',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Triceps',
              sets: 4,
              reps: '12-15',
              restTime: '60s',
            ),
            ExerciseModel(
              name: 'Cable Biceps Curl',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'biceps',
              sets: 3,
              reps: '10-15',
              restTime: '60s',
            ),
            ExerciseModel(
              name: 'Triceps PushDown',
              videoPath: 'assets/execrices/trysebses/Triceps_Pushdown.mp4',
              thumbNail: 'assets/thumbnail/trysebses/Triceps_Pushdown.jpg',
              targetMuscle: 'Triceps',
              sets: 4,
              reps: '12-15',
              restTime: '60s',
            ),
            ExerciseModel(
              name: 'Hammer Curl',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'biceps',
              sets: 3,
              reps: '10-15',
              restTime: '60s',
            ),
            ExerciseModel(
              videoPath: 'assets/execrices/shoulder/Trapezius.mp4',
              name: 'Trapezius',
              thumbNail: 'assets/thumbnail/shoulder/Trapezius.jpg',
              targetMuscle: 'Upper Trapezius',
              sets: 3,
              reps: '10-12',
              restTime: '60s',
            ),
            ExerciseModel(
              name: 'Reverse Fly',
              videoPath: 'assets/execrices/shoulder/batterfly_rar_shoulder.mp4',
              thumbNail: 'assets/thumbnail/shoulder/batterfly_rar_shoulder.jpg',
              targetMuscle: 'Shoulders',
              sets: 4,
              reps: '12-15',
              restTime: '60s',
            ),
          ],
        ),
        WorkoutDayModel(
          name: 'Legs',
          exercises: [
            ExerciseModel(
              videoPath: 'assets/execrices/leg/Leg_Extension.mp4',
              name: 'Leg Extension',
              thumbNail: 'assets/thumbnail/leg/Leg_Extension.jpg',
              targetMuscle: 'Quads',
              sets: 3,
              reps: '12-15',
              restTime: '60s',
            ),
            ExerciseModel(
              videoPath: 'assets/execrices/leg/Barbell_squat.mp4',
              name: 'Squat',
              thumbNail: 'assets/thumbnail/leg/Barbell_squat.jpg',
              targetMuscle: 'Quads',
              sets: 4,
              reps: '8-10',
              restTime: '120s',
            ),
            ExerciseModel(
              videoPath: 'assets/execrices/leg/Leg_Press.mp4',
              name: 'Leg Press',
              thumbNail: 'assets/thumbnail/leg/Leg_Press.jpg',
              targetMuscle: 'Quads',
              sets: 3,
              reps: '10-15',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'Seated Leg Curl',
              thumbNail: 'assets/thumbnail/leg/Leg_Press.jpg',
              targetMuscle: 'hamstring',
              sets: 3,
              reps: '10-15',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'Hide Adductor Machine',
              thumbNail: 'assets/thumbnail/leg/Leg_Press.jpg',
              targetMuscle: 'adductor',
              sets: 3,
              reps: '10-15',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'Standing Calf Raise',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Calves',
              sets: 3,
              reps: '15-20',
              restTime: '60s',
            ),
          ],
        ),
      
      ],
    ),
    // Pro Split
    WorkoutSystemModel(
      title: 'Pro Split',
      supTitle: 'النظام',
      workoutDays: [
        WorkoutDayModel(
          name: 'Chest',
          exercises: [
            ExerciseModel(
              name: 'Bench Press',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Chest',
              sets: 4,
              reps: '8-12',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'Incline Dumbbell Press',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Upper Chest',
              sets: 3,
              reps: '10-12',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'Cable Crossover',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Inner Chest',
              sets: 3,
              reps: '12-15',
              restTime: '60s',
            ),
          ],
        ),
        WorkoutDayModel(
          name: 'Back',
          exercises: [
            ExerciseModel(
              name: 'Pull Up',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Lats',
              sets: 4,
              reps: '8-12',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'Barbell Row',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Back',
              sets: 4,
              reps: '8-10',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'Lat Pulldown',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Lats',
              sets: 3,
              reps: '10-12',
              restTime: '60s',
            ),
          ],
        ),
        WorkoutDayModel(
          name: 'Shoulders',
          exercises: [
            ExerciseModel(
              name: 'Shoulder Press',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Shoulders',
              sets: 4,
              reps: '8-10',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'Lateral Raise',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Side Delts',
              sets: 4,
              reps: '12-15',
              restTime: '60s',
            ),
            ExerciseModel(
              name: 'Face Pull',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Rear Delts',
              sets: 3,
              reps: '12-15',
              restTime: '60s',
            ),
          ],
        ),
        WorkoutDayModel(
          name: 'Arms',
          exercises: [
            ExerciseModel(
              name: 'Barbell Curl',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Biceps',
              sets: 4,
              reps: '10-12',
              restTime: '60s',
            ),
            ExerciseModel(
              name: 'Triceps Pushdown',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Triceps',
              sets: 4,
              reps: '10-15',
              restTime: '60s',
            ),
            ExerciseModel(
              name: 'Hammer Curl',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Brachialis',
              sets: 3,
              reps: '10-12',
              restTime: '60s',
            ),
          ],
        ),
        WorkoutDayModel(
          name: 'Legs',
          exercises: [
            ExerciseModel(
              name: 'Squat',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Quads',
              sets: 4,
              reps: '8-10',
              restTime: '120s',
            ),
            ExerciseModel(
              name: 'Romanian Deadlift',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Hamstrings',
              sets: 4,
              reps: '8-12',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'Leg Extension',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Quads',
              sets: 3,
              reps: '12-15',
              restTime: '60s',
            ),
          ],
        ),
      ],
    ),
    // Upper / Lower
    WorkoutSystemModel(
      title: 'Upper / Lower',
      supTitle: 'النظام',
      workoutDays: [
        WorkoutDayModel(
          name: 'Upper',
          exercises: [
            ExerciseModel(
              name: 'Bench Press',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Chest',
              sets: 4,
              reps: '8-12',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'Pull Up',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Back',
              sets: 4,
              reps: '8-12',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'Overhead Press',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Shoulders',
              sets: 3,
              reps: '8-10',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'Barbell Row',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Back',
              sets: 3,
              reps: '10-12',
              restTime: '90s',
            ),
          ],
        ),
        WorkoutDayModel(
          name: 'Lower',
          exercises: [
            ExerciseModel(
              name: 'Squat',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Quads',
              sets: 4,
              reps: '8-10',
              restTime: '120s',
            ),
            ExerciseModel(
              name: 'Romanian Deadlift',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Hamstrings',
              sets: 4,
              reps: '8-12',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'Leg Press',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Quads',
              sets: 3,
              reps: '10-15',
              restTime: '90s',
            ),
            ExerciseModel(
              name: 'Standing Calf Raise',
              thumbNail: 'assets/images/placeholder.png',
              targetMuscle: 'Calves',
              sets: 4,
              reps: '15-20',
              restTime: '60s',
            ),
          ],
        ),
      ],
    ),
  ];
}
