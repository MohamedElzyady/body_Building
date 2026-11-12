import 'package:body_buliding/features/auth/presentation/views/widgets/auth_view_body.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  final String? selectedGender;
  final ValueChanged<String>? onGenderChanged;
  final ValueChanged<String>? onNameChanged;
  final ValueChanged<String>? onAgeChanged;

  const AuthView({
    super.key,
    this.selectedGender,
    this.onGenderChanged,
    this.onNameChanged,
    this.onAgeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AuthViewBody(
      selectedGender: selectedGender,
      onGenderChanged: onGenderChanged ?? (_) {},
      onNameChanged: onNameChanged ?? (_) {},
      onAgeChanged: onAgeChanged ?? (_) {},
    );
  }
}
