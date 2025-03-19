import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF1ED760);
  static const Color blackColor = Color(0xFF121212);
  static const Color secondaryBlackColor = Color(0xFF282828);
  static const Color greyColor = Color(0xFF777777);
  static const Color whiteColor = Color(0xFFFFFFFF);

  static  LinearGradient gradientColor = LinearGradient(
    colors: [Color(0xFF121212), Color(0xFF282828)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
