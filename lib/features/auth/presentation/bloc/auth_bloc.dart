import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oflow/features/auth/domain/entity/authentication_result_entity.dart';

import '../../../../core/utils/local_storage/local_storage.dart';
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
    await result.fold(
      (l) async => emit(
        state.copyWith(
          status: AuthStatus.error,
          errorMessage: l.message,
        ),
      ),
      (r) async {
        // INFO: Save the token to local storage
        await _saveLoginCredentials(r);

        router.replace('/device/C4DEE2879A60');
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

  Future<void> _saveLoginCredentials(AuthenticationResultEntity r) async {
    // INFO: Save the token to local storage
    try {
      await LocalStorage.instance.saveString(
        'AuthenticatedCredential',
        jsonEncode(r.toJson()),
      );
    } catch (e) {
      throw Exception('Error saving login credentials: $e');
    }
  }
}
