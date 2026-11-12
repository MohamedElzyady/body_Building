import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HowItWorksPage extends StatelessWidget {
  const HowItWorksPage({super.key});

  static const String _heroImage =
      'assets/oneborading/onbordaing2.png';

  static const List<String> _steps = [
    'أدخل بياناتك الأساسية',
    'سجّل قياسات جسمك',
    'اختر هدفك الرياضي',
    'ابدأ التمرين وتابع تقدمك',
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHeight = constraints.maxHeight;
        final isSmallScreen = screenHeight < 620;
        final imageSize = (screenHeight * 0.28).clamp(120.0, 240.0);

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
                  SizedBox(height: isSmallScreen ? 14 : 24),
                  Text(
                    'كيف يعمل التطبيق؟',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: isSmallScreen ? 20 : 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 16 : 24),
                  ...List.generate(
                    _steps.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(
                        bottom: index == _steps.length - 1
                            ? 0
                            : (isSmallScreen ? 10 : 14),
                      ),
                      child: _StepItem(
                        stepNumber: index + 1,
                        text: _steps[index],
                      ),
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

class _StepItem extends StatelessWidget {
  final int stepNumber;
  final String text;

  const _StepItem({
    required this.stepNumber,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 14),
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
          child: Center(
            child: Text(
              '$stepNumber',
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
