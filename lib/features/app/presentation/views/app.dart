import 'package:flutter/material.dart';
import 'package:oflow/core/theme/app_theme.dart';

import '../../../../core/router/router.dart';
import '../../../../core/service_locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: getIt<AppRouter>().router,
      title: 'Oflow application',
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
    );
  }
}
