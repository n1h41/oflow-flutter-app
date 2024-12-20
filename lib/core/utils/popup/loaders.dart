import 'package:flutter/material.dart';
import 'package:oflow/core/constants/colors.dart';

class KLoaders {
  static hideSnackBar(BuildContext context) =>
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

  static customToast(BuildContext context, {required message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: KAppColors.containerBackgroundDark.withValues(alpha: 0.9),
          ),
          child: Center(
            child: Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: KAppColors.textWhite),
            ),
          ),
        ),
      ),
    );
  }
}
