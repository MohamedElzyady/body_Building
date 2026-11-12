import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title; // متغير لتغيير عنوان الصفحة من الخارج

  const CustomAppBar({
    super.key,
    required this.title, // بنخليه إجباري عشان كل صفحة تحط العنوان الخاص بيها
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          title, // العنوان المتغير
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  // 🔥 هذا السطر إجباري ومهم جداً لتحديد الارتفاع الافتراضي للـ AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
