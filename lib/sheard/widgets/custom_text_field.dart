import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? suffixText;
  final String? prefixText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.keyboardType,
    this.validator,
    this.suffixText,
    this.prefixText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      textDirection: textDirection ?? TextDirection.rtl,
      textAlign: textAlign,
      onChanged: onChanged,
      style: const TextStyle(color: AppColors.white, fontSize: 15),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.grey, fontSize: 15),
        suffixText: suffixText,
        prefixText: prefixText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        suffixStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14,
        ),
        prefixStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14,
        ),
      ),
    );
  }
}
