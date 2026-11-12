import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:body_buliding/features/user/view_model/cubit/user_cubit.dart';
import 'package:body_buliding/features/user/view_model/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// A lightweight screen that waits for persisted user data to load, then
/// navigates to either the onboarding flow or the home screen.
/// Prevents the onboarding screen from flashing before saved data is ready.
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAndNavigate();
    });
  }

  void _checkAndNavigate() {
    if (!mounted || _hasNavigated) return;
    final state = context.read<UserCubit>().state;
    if (!state.isLoading) {
      _navigate(state);
    }
  }

  void _navigate(UserState state) {
    if (!mounted || _hasNavigated) return;
    _hasNavigated = true;
    if (state.user != null) {
      context.go('/home');
    } else {
      context.go('/onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (!state.isLoading) {
          _navigate(state);
        }
      },
      child: const Scaffold(
        backgroundColor: AppColors.scaffoldBg,
        body: Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      ),
    );
  }
}
