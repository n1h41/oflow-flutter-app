import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'text_theme.dart';

class KTextFormFieldTheme {
  KTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    hintStyle: KTextTheme.lightTextTheme.labelSmall,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: KAppColors.borderPrimary,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 10,
    ),
  );
}
