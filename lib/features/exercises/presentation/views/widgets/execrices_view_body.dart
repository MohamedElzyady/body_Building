import 'package:body_buliding/sheard/custom_appbar.dart';
import 'package:flutter/material.dart';

class ExecricesViewBody extends StatefulWidget {
  const ExecricesViewBody({super.key});

  @override
  State<ExecricesViewBody> createState() => _ExecricesViewBodyState();
}

class _ExecricesViewBodyState extends State<ExecricesViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomAppBar(title: 'نظام التمارين'),
      
    ],);
  }
}