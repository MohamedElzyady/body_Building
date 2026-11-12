import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProgressTrackingPage extends StatelessWidget {
  const ProgressTrackingPage({super.key});

  static const String _heroImage = 'assets/oneborading/onbordaing3.png';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHeight = constraints.maxHeight;
        final isSmallScreen = screenHeight < 620;
        final imageSize = (screenHeight * 0.32).clamp(130.0, 250.0);

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  SizedBox(height: isSmallScreen ? 10 : 20),
                  Image.asset(
                    _heroImage,
                    height: imageSize,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: isSmallScreen ? 16 : 32),
                  Text(
                    'كل تقدمك في مكان واحد',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: isSmallScreen ? 20 : 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 10 : 16),
                  Text(
                    'سجل اوزانك وتابع تطور جسمك\n وحقق افضل النتائج',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: isSmallScreen ? 13 : 15,
                      height: 1.5,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
