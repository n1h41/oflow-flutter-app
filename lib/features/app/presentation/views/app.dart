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
          create: (_) => HomeBloc(),
        ),
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(
            usecase: getIt<AuthUsecase>(),
            router: getIt<AppRouter>().router,
          ),
        ),
      ],
      child: Authenticator(
        /* authenticatorBuilder: (context, state) {
          switch (state.currentStep) {
            case AuthenticatorStep.signIn:
              return Scaffold(
                appBar: AppBar(title: const Text('Oflow App')),
                body: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SignInForm(),
                      TextButton(
                        onPressed: () {},
                        child: Text('Create an account'),
                      ),
                    ],
                  ),
                ),
              );
            case AuthenticatorStep.signUp:
              return Scaffold(
                appBar: AppBar(title: const Text('Oflow App')),
                body: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SignUpForm.custom(
                        fields: [
                          SignUpFormField.username(),
                          SignUpFormField.password(),
                          SignUpFormField.passwordConfirmation(),
                          SignUpFormField.custom(
                            title: "First Name",
                            attributeKey: const CognitoUserAttributeKey.custom(
                                "first_name"),
                            required: true,
                          ),
                          SignUpFormField.custom(
                            title: "Last Name",
                            attributeKey: const CognitoUserAttributeKey.custom(
                                "last_name"),
                            required: true,
                          ),
                          if (state.usernameSelection ==
                              UsernameSelection.email)
                            SignUpFormField.email(),
                          if (state.usernameSelection ==
                              UsernameSelection.phoneNumber)
                            SignUpFormField.phoneNumber(),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Already have an account? Sign in'),
                      ),
                    ],
                  ),
                ),
              );
            default:
              return null;
          }
        }, */
        /* signUpForm: SignUpForm.custom(
          fields: [
            SignUpFormField.username(),
            SignUpFormField.password(),
            SignUpFormField.passwordConfirmation(),
            SignUpFormField.custom(
              title: "First Name",
              attributeKey: const CognitoUserAttributeKey.custom("first_name"),
              required: true,
            ),
            SignUpFormField.custom(
              title: "Last Name",
              attributeKey: const CognitoUserAttributeKey.custom("last_name"),
              required: true,
            ),
          ],
        ), */
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: getIt<AppRouter>().router,
          title: 'Oflow application',
          themeMode: ThemeMode.light,
          theme: AppTheme.lightTheme,
          builder: Authenticator.builder(),
        ),
      ),
    );
  }
}

/* class _Unfocus extends StatelessWidget {
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
} */
