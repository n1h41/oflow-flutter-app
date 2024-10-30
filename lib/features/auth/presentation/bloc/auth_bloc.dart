import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/usecase/params/params.dart';
import '../../domain/usecase/usecase.dart';
import 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  final AuthUsecase usecase;
  final GoRouter router;

  AuthBloc({
    required this.usecase,
    required this.router,
  }) : super(AuthState.initial());

  Future<void> signIn(SignInParams params) async {
    emit(
      state.copyWith(
        status: AuthStatus.loading,
        errorMessage: null,
      ),
    );
    final result = await usecase.signIn(params);
    result.fold(
      (l) => emit(
        state.copyWith(
          status: AuthStatus.error,
          errorMessage: l.message,
        ),
      ),
      (r) {
        router.replace('/device');
        emit(
          state.copyWith(
            status: AuthStatus.authenticated,
            errorMessage: null,
            authenticationResult: r,
          ),
        );
      },
    );
  }
}
