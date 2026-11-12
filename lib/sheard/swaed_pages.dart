import 'package:body_buliding/features/auth/presentation/views/auth_view.dart';
import 'package:body_buliding/features/auth/presentation/views/auth_view_secend.dart';
import 'package:body_buliding/sheard/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SwaedPages extends StatefulWidget {
  const SwaedPages({super.key});

  @override
  State<SwaedPages> createState() => _SwaedPagesState();
}

class _SwaedPagesState extends State<SwaedPages> {
  final PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButton(
        text: 'التالي',
        onTap: () {
          controller.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              children: [
                const AuthView(),
                AuthViewSecend(
                  onHeightChanged: (_) {},
                  onWeightChanged: (_) {},
                  onBodyFatChanged: (_) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
