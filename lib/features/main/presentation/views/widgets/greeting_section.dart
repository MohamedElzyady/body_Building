import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:body_buliding/features/user/view_model/cubit/user_cubit.dart';
import 'package:body_buliding/features/user/view_model/cubit/user_state.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        final userName = state.user?.name ?? '-';
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'مرحباً،',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerRight,
              child: Text(
                userName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'استعد لتحطيم أرقامك القياسية اليوم!',
              style: TextStyle(
                color: AppColors.primary.withOpacity(0.8),
                fontSize: 14,
              ),
            ),
          ],
        );
      },
    );
  }
}
