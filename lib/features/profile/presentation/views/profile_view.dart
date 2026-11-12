import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:body_buliding/sheard/custom_appbar.dart';
import 'package:body_buliding/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:body_buliding/features/profile/presentation/views/widgets/profile_info_card.dart';
import 'package:body_buliding/features/profile/presentation/views/widgets/profile_action_tile.dart';
import 'package:body_buliding/features/user/view_model/cubit/user_cubit.dart';
import 'package:body_buliding/features/user/view_model/cubit/user_state.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: const CustomAppBar(title: 'الملف الشخصي'),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          final user = state.user;
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 680),
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                children: [
                  // Profile Header Section
                  ProfileHeader(user: user),

                  // Information Card
                  ProfileInfoCard(user: user),
                  const SizedBox(height: 24),

                  // Quick Actions Section
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.cardBg,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0x0DFFFFFF), width: 1),
                    ),
                    child: Column(
                      children: [
                        const ProfileActionTile(
                          icon: Icons.trending_up_rounded,
                          title: 'التقدم',
                        ),
                        Divider(
                          color: Colors.white.withValues(alpha: 0.06),
                          thickness: 1,
                          height: 1,
                        ),
                        const ProfileActionTile(
                          icon: Icons.straighten_rounded,
                          title: 'القياسات',
                        ),
                        Divider(
                          color: Colors.white.withValues(alpha: 0.06),
                          thickness: 1,
                          height: 1,
                        ),
                        const ProfileActionTile(
                          icon: Icons.favorite_border_rounded,
                          title: 'التمارين المفضلة',
                        ),
                        Divider(
                          color: Colors.white.withValues(alpha: 0.06),
                          thickness: 1,
                          height: 1,
                        ),
                        const ProfileActionTile(
                          icon: Icons.settings_outlined,
                          title: 'الإعدادات',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Logout Button
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.cardBg,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0x0DFFFFFF), width: 1),
                    ),
                    child: ProfileActionTile(
                      icon: Icons.logout_rounded,
                      title: 'تسجيل الخروج',
                      onTap: () => _showLogoutDialog(context),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            backgroundColor: AppColors.cardBg,
            insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            actionsOverflowDirection: VerticalDirection.down,
            title: const Text(
              'تسجيل الخروج',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const SingleChildScrollView(
              child: Text(
                'هل أنت متأكد أنك تريد تسجيل الخروج؟ سيتم حذف بيانات الملف الشخصي فقط.',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text(
                  'إلغاء',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(dialogContext).pop();
                  await context.read<UserCubit>().clearUser();
                  if (context.mounted) {
                    context.go('/onboarding');
                  }
                },
                child: const Text(
                  'تسجيل الخروج',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
