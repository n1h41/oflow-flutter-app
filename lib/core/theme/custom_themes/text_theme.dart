import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 22,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: const TextStyle().copyWith(),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w300,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w300,
    ),
  );
}
