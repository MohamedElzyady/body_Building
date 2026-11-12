import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:body_buliding/sheard/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AuthViewSecend extends StatefulWidget {
  final ValueChanged<String> onHeightChanged;
  final ValueChanged<String> onWeightChanged;
  final ValueChanged<String> onBodyFatChanged;

  const AuthViewSecend({
    super.key,
    required this.onHeightChanged,
    required this.onWeightChanged,
    required this.onBodyFatChanged,
  });

  @override
  State<AuthViewSecend> createState() => _AuthViewSecendState();
}

class _AuthViewSecendState extends State<AuthViewSecend> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _bodyFatController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    _bodyFatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Gap(8),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'الطول',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const Gap(8),
                CustomTextField(
                  controller: _heightController,
                 
                  keyboardType: TextInputType.number,
                  suffixText: 'سم',
                  textAlign: TextAlign.right,
                  onChanged: widget.onHeightChanged,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال الطول';
                    }
                    return null;
                  },
                ),
                const Gap(20),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'الوزن',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const Gap(8),
                CustomTextField(
                  controller: _weightController,
                 
                  keyboardType: TextInputType.number,
                  suffixText: 'كجم',
                  textAlign: TextAlign.right,
                  onChanged: widget.onWeightChanged,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال الوزن';
                    }
                    return null;
                  },
                ),
                const Gap(20),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'نسبة الدهون (اختياري)',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const Gap(8),
                CustomTextField(
                  controller: _bodyFatController,
                
                  keyboardType: TextInputType.number,
                  suffixText: '%',
                  textAlign: TextAlign.right,
                  onChanged: widget.onBodyFatChanged,
                ),
              ],
            ),
          ),
          const Gap(16),
        ],
      ),
    );
  }
}
