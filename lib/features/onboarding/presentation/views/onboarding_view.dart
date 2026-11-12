import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:body_buliding/features/auth/presentation/views/auth_view_secend.dart';
import 'package:body_buliding/features/auth/presentation/views/widgets/auth_view_body.dart';
import 'package:body_buliding/features/onboarding/presentation/view_model/onboarding_view_model.dart';
import 'package:body_buliding/features/onboarding/presentation/views/widgets/goal_selection_page.dart';
import 'package:body_buliding/features/onboarding/presentation/views/widgets/how_it_works_page.dart';
import 'package:body_buliding/features/onboarding/presentation/views/widgets/progress_tracking_page.dart';
import 'package:body_buliding/features/onboarding/presentation/views/widgets/welcome_page.dart';
import 'package:body_buliding/sheard/widgets/custom_button.dart';
import 'package:body_buliding/sheard/widgets/onboarding_indicator.dart';
import 'package:body_buliding/sheard/widgets/onboarding_step_progress.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:body_buliding/features/user/data/models/user_model.dart';
import 'package:body_buliding/features/user/view_model/cubit/user_cubit.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final OnboardingViewModel _viewModel;

  static const List<String> _formPageTitles = [
    'البيانات الأساسية',
    'القياسات',
    'هدفك',
  ];

  @override
  void initState() {
    super.initState();
    _viewModel = OnboardingViewModel();
    _viewModel.addListener(_onViewModelChanged);
  }

  void _onViewModelChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _viewModel.removeListener(_onViewModelChanged);
    _viewModel.dispose();
    super.dispose();
  }

  void _handleNext() {
    if (_viewModel.currentPage == OnboardingViewModel.totalPages - 1) {
      final user = UserModel(
        name: _viewModel.name,
        age: int.tryParse(_viewModel.age) ?? 0,
        height: double.tryParse(_viewModel.height) ?? 0.0,
        weight: double.tryParse(_viewModel.weight) ?? 0.0,
        goal: _viewModel.selectedGoal ?? '',
      );
      context.read<UserCubit>().setUser(user);

      context.go('/home');
    } else {
      _viewModel.nextPage();
    }
  }

  String _buttonText(int page) {
    if (page == 2) return 'ابدأ الآن';
    return 'التالي';
  }

  @override
  @override
  @override
  Widget build(BuildContext context) {
    final currentPage = _viewModel.currentPage;
    final isIntroPage = currentPage <= 2;
    final isFormPage = currentPage >= 3;
    final formStep = currentPage - 2;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBg,
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Column(
                children: [
                  // 1. قسم العنوان العلوي
                  isFormPage
                      ? Column(
                          key: const ValueKey('form_header'), // مفتاح لتثبيت الهيدر
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: _viewModel.previousPage,
                                    child: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: AppColors.white,
                                      size: 20,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      _formPageTitles[formStep - 1],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: AppColors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32),
                              child: OnboardingStepProgress(currentStep: formStep),
                            ),
                            const SizedBox(height: 20),
                          ],
                        )
                      : const SizedBox.shrink(key: ValueKey('empty_header')),

                  // 2. قسم الـ PageView (هنا ضفنا المفتاح السحري)
                  Expanded(
                    key: const ValueKey(
                      'main_page_view_expanded',
                    ), // 👈 هذا المفتاح يمنع إعادة البناء
                    child: PageView(
                      key: const ValueKey('main_page_view'),
                      controller: _viewModel.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: _viewModel.setCurrentPage,
                      children: [
                        WelcomePage(onGetStarted: _viewModel.nextPage),
                        const HowItWorksPage(),
                        const ProgressTrackingPage(),
                        AuthViewBody(
                          selectedGender: _viewModel.gender,
                          onGenderChanged: _viewModel.setGender,
                          onNameChanged: _viewModel.setName,
                          onAgeChanged: _viewModel.setAge,
                        ),
                        AuthViewSecend(
                          onHeightChanged: _viewModel.setHeight,
                          onWeightChanged: _viewModel.setWeight,
                          onBodyFatChanged: _viewModel.setBodyFat,
                        ),
                        GoalSelectionPage(
                          selectedGoal: _viewModel.selectedGoal,
                          onGoalSelected: _viewModel.setGoal,
                        ),
                      ],
                    ),
                  ),

                  // 3. قسم الزرار الرئيسي
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                    child: CustomButton(
                      text: _buttonText(currentPage),
                      onTap: _viewModel.canProceed ? _handleNext : null,
                    ),
                  ),

                  // 4. قسم المؤشر السفلي (تم تغليفه في Column واحد للحفاظ على البنية)
                  isIntroPage
                      ? Column(
                          key: const ValueKey('intro_indicators'),
                          children: [
                            const SizedBox(height: 16),
                            OnboardingIndicator(
                              currentIndex: currentPage,
                              totalSteps: 3,
                            ),
                            const SizedBox(height: 16),
                          ],
                        )
                      : const SizedBox(
                          height: 24,
                          key: ValueKey('empty_indicators'),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
