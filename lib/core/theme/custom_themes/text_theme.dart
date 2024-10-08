import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KTextTheme {
  KTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 36,
      color: KAppColors.textPrimary,
      fontWeight: FontWeight.w900,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 34,
      color: KAppColors.textPrimary,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 26,
      color: KAppColors.textPrimary,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 22,
      color: KAppColors.textPrimary,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 20,
      color: KAppColors.textPrimary,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 18,
      color: KAppColors.textPrimary,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 18,
      color: KAppColors.textPrimary,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 16,
      color: KAppColors.textPrimary,
      fontWeight: FontWeight.w300,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14,
      color: KAppColors.textPrimary,
      fontWeight: FontWeight.w300,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 18,
      color: KAppColors.textPrimary,
      fontWeight: FontWeight.w300,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 14,
      color: KAppColors.textPrimary,
      fontWeight: FontWeight.w300,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: 12,
      color: KAppColors.textPrimary,
      fontWeight: FontWeight.w300,
    ),
  );
}
