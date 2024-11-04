import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/router.dart';
import '../../../../core/service_locator.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../auth/domain/usecase/usecase.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(
            usecase: getIt<AuthUsecase>(),
            router: getIt<AppRouter>().router,
          ) /* ..getAuthenticatedUser() */,
        ),
      ],
      child: Authenticator(
        child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: getIt<AppRouter>().router,
            title: 'Oflow application',
            themeMode: ThemeMode.light,
            theme: AppTheme.lightTheme,
            builder: Authenticator.builder()
            /* builder: (context, child) {
            return _Unfocus(
              child: SafeArea(
                child: child!,
              ),
            );
          }, */
            ),
      ),
    );
  }
}

class _Unfocus extends StatelessWidget {
  final Widget child;

  const _Unfocus({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
