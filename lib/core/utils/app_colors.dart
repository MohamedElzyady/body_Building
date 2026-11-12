import 'package:flutter/material.dart';

abstract class AppColors {
  // Background
  static const Color scaffoldBg = Color(0xFF0B0E11);
  static const Color scaffoldBgLight = Color(0xFF141820);

  // Primary / Accent
  static const Color primary = Color(0xFFD0FD3E);
  static const Color primaryDark = Color(0xFFB8E035);
  static const Color primaryLight = Color(0x33D0FD3E);

  // Text
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Color(0xFF8E8E93);
  static const Color textSecondary = Color(0xFFA1A1A1);

  // Cards & Containers
  static const Color cardBg = Color(0xFF1C1C1E);
  static const Color cardBgSelected = Color(0xFF1C1C1E);

  // TextField
  static const Color textFieldFill = Color(0xFF1C1C1E);
  static const Color textFieldBorder = Color(0xFF2C2C2E);
  static const Color textFieldBorderFocused = Color(0xFFD0FD3E);

  // Indicator
  static const Color indicatorActive = Color(0xFFD0FD3E);
  static const Color indicatorInactive = Color(0xFF3A3A3C);

  // Button
  static const Color buttonDisabled = Color(0xFF3A3A3C);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFD0FD3E), Color(0xFFB8E035)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF1C1C1E), Color(0xFF1C1C1E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
