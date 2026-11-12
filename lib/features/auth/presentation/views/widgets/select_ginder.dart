import 'package:flutter/material.dart';

class SelectGinder extends StatefulWidget {
  final String textGinder;
  const SelectGinder({super.key, required this.textGinder});

  @override
  State<SelectGinder> createState() => _SelectGinderState();
}

class _SelectGinderState extends State<SelectGinder> {
  bool isPress = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPress = !isPress;
        });
      },
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isPress
              ? const Color.fromARGB(56, 54, 240, 61)
              : Color.fromARGB(57, 255, 255, 255),
        ),
        child: Text(
          widget.textGinder,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
