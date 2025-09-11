import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand Colors
  static const Color primary = Color(0xFFE50914);
  static const Color primaryDark = Color(0xFF6F060B);
  static const Color secondary = Color(0xFF5949E6);

  // White Tones
  static const Color white90 = Color(0xE6FFFFFF); // 90%
  static const Color white80 = Color(0xCCFFFFFF); // 80%
  static const Color white70 = Color(0xB3FFFFFF); // 70%
  static const Color white60 = Color(0x99FFFFFF); // 60%
  static const Color white50 = Color(0x80FFFFFF); // 50%
  static const Color white40 = Color(0x66FFFFFF); // 40%
  static const Color white30 = Color(0x4DFFFFFF); // 30%
  static const Color white20 = Color(0x33FFFFFF); // 20%
  static const Color white10 = Color(0x1AFFFFFF); // 10%
  static const Color white5 = Color(0x0DFFFFFF); // 5%

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

  // Dark Theme Gradients
  static const LinearGradient darkBackgroundGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.4, 1.0],
    colors: [
      Color(0xFF090909), // black
      Color(0xFF3F0306), // primaryDark
    ],
  );

  static const RadialGradient darkRadialGradient = RadialGradient(
    center: Alignment.center,
    radius: 0.5,
    colors: [
      Color(0xFFE50914), // primary
      Color(0x008D0000), // transparent red
    ],
    stops: [0.0, 1.0],
  );

  static const LinearGradient appIconGradient = LinearGradient(
    colors: [Color(0xFFE50914), Color(0xFF7F050B)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const BoxShadow appIconShadow = BoxShadow(
    color: Color(0xFF585858),
    offset: Offset(0, 4),
    blurRadius: 14.2,
    spreadRadius: -2,
  );

  static const LinearGradient appIconBorderGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFF5D5D5D)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // TODO: Popular Card ve Normal Card gradient renkleri eksik
  // TODO: Active Nav rengi eksik
}
