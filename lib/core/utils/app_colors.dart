import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color(0xFF312C51);
  static const Color secondary = Color(0xFF48426D);
  static const Color accent = Color(0xFFF0C38E);
  static const Color salmonpink = Color(0xFFF1AA9B);

  static const Color deep = Color(0xFF1B1831);
  static const Color surface = Color(0xFF2F2951);
  static const Color light = Color(0xFF5C52A1);
  static const Color glow = Color(0xFFF7D7A9);


  static const Color primarytext = Color(0xFFFFFFFF);
  static const Color secondarytext = Color(0xFFA7A3C8);
  static const Color captiontext = Color(0xFF7A76A4);
  static const Color error = Color(0xFFFF6B6B);
}

abstract class AppGradients {
  static const LinearGradient primary = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.primary, AppColors.secondary],
  );

  static const LinearGradient accent = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [AppColors.accent, AppColors.salmonpink],
  );


  static const LinearGradient screenBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.secondary, AppColors.primary, AppColors.deep],
    stops: [0.0, 0.45, 1.0],
  );
}
