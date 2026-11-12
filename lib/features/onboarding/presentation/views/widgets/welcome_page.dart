import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final VoidCallback onGetStarted;

  const WelcomePage({super.key, required this.onGetStarted});

  static const String _heroImage =
      'assets/oneborading/onbordaing1.png';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHeight = constraints.maxHeight;
        final isSmallScreen = screenHeight < 620;
        final imageSize = (screenHeight * 0.32).clamp(130.0, 260.0);

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const Spacer(flex: 1),
                  SizedBox(
                    height: imageSize,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: imageSize * 0.85,
                          height: imageSize * 0.85,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.18),
                                blurRadius: isSmallScreen ? 30 : 60,
                                spreadRadius: isSmallScreen ? 10 : 20,
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          _heroImage,
                          height: imageSize,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 16 : 28),
                  Text(
                    'مرحباً بك في',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: isSmallScreen ? 20 : 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'FitBoost',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: isSmallScreen ? 28 : 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 12 : 20),
                  Text(
                    'رفيقك الأمثل لبناء جسم مثالي\nوتحقيق أهدافك الرياضية',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: isSmallScreen ? 13 : 15,
                      height: 1.5,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
