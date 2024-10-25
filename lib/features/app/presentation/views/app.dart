import 'package:flutter/material.dart';

import '../../../../core/router/router.dart';
import '../../../../core/service_locator.dart';
import '../../../../core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: getIt<AppRouter>().router,
      title: 'Oflow application',
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      builder: (context, child) {
        return SafeArea(
          child: child!,
        );
      },
    );
  }
}
