import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:body_buliding/features/home/presentation/view_model/home_view_model.dart';
import 'package:body_buliding/features/home/presentation/views/timer_page.dart';
import 'package:body_buliding/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:body_buliding/features/main/presentation/views/main_view.dart';
import 'package:body_buliding/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// Import your 4 actual page widgets here
// import 'widgets/home_body_page.dart';
// import 'widgets/workout_page.dart';
// import 'widgets/timer_page.dart';
// import 'widgets/profile_page.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late final HomeViewModel _viewModel;

  final List<Widget> _pages = [
    MainView(),
    HomeMainBody(),
    TimerPage(),
    ProfileView(),
  ];

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: IndexedStack(index: _viewModel.currentIndex, children: _pages),

      bottomNavigationBar: SafeArea(
        top: false,
        child: CurvedNavigationBar(
          backgroundColor: AppColors.scaffoldBg,
          color: const Color(0xFF1E1E2E),
          buttonBackgroundColor: AppColors.primary,
          height: 65,
          animationDuration: const Duration(milliseconds: 300),
          index: _viewModel.currentIndex,
          items: [
            Icon(Icons.home_rounded, size: 28, color: _getIconColor(0)),
            Icon(Icons.fitness_center_rounded, size: 28, color: _getIconColor(1)),
            Icon(Icons.timer_rounded, size: 28, color: _getIconColor(2)),
            Icon(Icons.person_rounded, size: 28, color: _getIconColor(3)),
          ],
          onTap: (index) {
            _viewModel.changeTab(index);
          },
        ),
      ),
    );
  }

  Color _getIconColor(int tabIndex) {
    return _viewModel.currentIndex == tabIndex ? Colors.black : Colors.white70;
  }
}
