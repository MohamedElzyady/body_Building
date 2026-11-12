import 'package:flutter/material.dart';
import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:body_buliding/sheard/custom_appbar.dart';
import 'package:body_buliding/features/main/presentation/views/widgets/main_view_body.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: CustomAppBar(title: 'الرئيسية'),
      body: MainViewBody(),
    );
  }
}
