import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oflow/features/device/presentation/bloc/device_bloc.dart';
import 'package:oflow/features/home/presentation/bloc/home_bloc.dart';

import '../../../../core/router/router.dart';
import '../../../../core/service_locator.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../auth/domain/usecase/usecase.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../home/domain/repository/repository.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DeviceBloc>(
          // lazy: false,
          create: (_) => DeviceBloc(),
        ),
        BlocProvider<HomeBloc>(
          // lazy: false,
          create: (_) => HomeBloc(
            router: getIt<AppRouter>().router,
            repository: getIt<HomeRepository>(),
          ),
        ),
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(
            usecase: getIt<AuthUsecase>(),
            router: getIt<AppRouter>().router,
          ),
        ),
      ],
      child: Authenticator(
        dialCodeOptions: const DialCodeOptions(
          defaultDialCode: DialCode.in1,
        ),
        signUpForm: SignUpForm(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: getIt<AppRouter>().router,
          title: 'Oflow application',
          themeMode: ThemeMode.light,
          theme: AppTheme.lightTheme,
          builder: (context, child) => Authenticator.builder()(
            context,
            _Unfocus(
              child: child!,
            ),
          ),
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
