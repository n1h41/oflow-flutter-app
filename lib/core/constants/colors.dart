import 'package:flutter/material.dart';

class KAppColors {
  KAppColors._();

  // INFO: App Basic Colors
  // static const Color primary = Color();
  // static const Color secondary = Color();
  static const Color accent = Color(0XFF06D6FF);

  // INFO: Text Colors
  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Colors.black;
  static const Color textWhite = Colors.white;
  static const Color textError = Colors.red;

  // Background Colors
  static const Color backgroundPrimary = Color(0XFFFAFAFA);

  // Backgorund Container Colors
  static const Color containerBackground = Colors.white;
  static const Color containerBackgroundDark = Colors.black;

  // Circle Background Colors
  static const Color circleBackground = Color(0X00000008);

  // Shadow Colors
  static Color shadowColor = Colors.black.withValues(alpha: 0.6);

  // Border Colors
  static Color borderPrimary = Colors.black.withValues(alpha: 0.1);
}
