import 'package:flutter/material.dart';

class MyCustomRoundedBtn extends StatelessWidget {
  MyCustomRoundedBtn({
    super.key,
    required this.onTap,
    required this.text,
    this.mWidth = 300,
    this.mHeight = 50,
    this.bgColor = Colors.white,
  });

  VoidCallback onTap;
  double mWidth;
  double mHeight;
  Color bgColor;
  String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: mWidth,
        height: mHeight,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
