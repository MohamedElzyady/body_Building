import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:body_buliding/sheard/widgets/custom_text_field.dart';
import 'package:body_buliding/sheard/widgets/gender_selector.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AuthViewBody extends StatefulWidget {
  final String? selectedGender;
  final ValueChanged<String> onGenderChanged;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onAgeChanged;

  const AuthViewBody({
    super.key,
    required this.selectedGender,
    required this.onGenderChanged,
    required this.onNameChanged,
    required this.onAgeChanged,
  });

  @override
  State<AuthViewBody> createState() => _AuthViewBodyState();
}

class _AuthViewBodyState extends State<AuthViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
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
                    'الاسم',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const Gap(8),
                CustomTextField(
                  controller: _nameController,
                  hint: 'أحمد محمد',
                  textAlign: TextAlign.right,
                  onChanged: widget.onNameChanged,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال الاسم';
                    }
                    return null;
                  },
                ),
                const Gap(20),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'العمر',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const Gap(8),
                CustomTextField(
                  controller: _ageController,
                  hint: '25 سنة',
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.right,
                  onChanged: widget.onAgeChanged,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال العمر';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          const Gap(24),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'الجنس',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
          const Gap(12),
          GenderSelector(
            selectedGender: widget.selectedGender,
            onChanged: widget.onGenderChanged,
          ),
          const Gap(16),
        ],
      ),
    );
  }
}
