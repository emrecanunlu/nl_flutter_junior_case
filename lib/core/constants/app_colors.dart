import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand Colors
  static const Color primary = Color(0xFFE50914);
  static const Color primaryDark = Color(0xFF6F060B);
  static const Color secondary = Color(0xFF5949E6);

  // White Tones
  static const Color white90 = Color(0xFFFFFFFF); // 90%
  static const Color white80 = Color(0xFFFFFFFF); // 80%
  static const Color white70 = Color(0xFFFFFFFF); // 70%
  static const Color white60 = Color(0xFFFFFFFF); // 60%
  static const Color white50 = Color(0xFFFFFFFF); // 50%
  static const Color white40 = Color(0xFFFFFFFF); // 40%
  static const Color white30 = Color(0xFFFFFFFF); // 30%
  static const Color white20 = Color(0xFFFFFFFF); // 20%
  static const Color white10 = Color(0xFFFFFFFF); // 10%
  static const Color white5 = Color(0xFFFFFFFF); // 5%

  // Alert & Status Colors
  static const Color success = Color(0xFF00C247);
  static const Color info = Color(0xFF004CE8);
  static const Color warning = Color(0xFFFFBE16);
  static const Color error = Color(0xFFF47171);

  // Basic Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // Gradients
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [Color(0xFF3F0306), Color(0xFF090909)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // TODO: Popular Card ve Normal Card gradient renkleri eksik
  // TODO: Active Nav rengi eksik
}
