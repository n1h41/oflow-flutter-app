import 'package:flutter/material.dart';
import 'package:oflow/core/constants/colors.dart';
import 'package:oflow/core/theme/custom_themes/app_bar_theme.dart';
import 'package:oflow/core/theme/custom_themes/elevated_button_theme.dart';
import 'package:oflow/core/theme/custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Urbanist',
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: KAppColors.backgroundPrimary,
    appBarTheme: KAppBarTheme.appBarTheme,
    textTheme: KTextTheme.lightTextTheme,
    elevatedButtonTheme: KElevatedButtonTheme.elevatedButtonTheme,
  );
}
