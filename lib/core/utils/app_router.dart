import 'package:body_buliding/features/home/data/exercise_model.dart';
import 'package:body_buliding/features/exercises/presentation/views/exercies_view.dart';
import 'package:body_buliding/features/home/presentation/views/home_view.dart';
import 'package:body_buliding/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:body_buliding/features/onboarding/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(path: '/home', builder: (context, state) => const HomeView()),
      GoRoute(
        path: '/exercises',
        builder: (context, state) {
          final workoutDay = state.extra as WorkoutDayModel;
          return ExerciesView(workoutDay: workoutDay);
        },
      ),
    ],
  );
}

