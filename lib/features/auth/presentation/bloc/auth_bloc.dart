import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/local_storage/local_storage.dart';
import '../../domain/entity/authentication_result_entity.dart';
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
    emit(AuthState.loading());
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

        emit(
          state.copyWith(
            status: AuthStatus.authenticated,
            errorMessage: null,
            authenticationResult: r,
          ),
        );

        router.replace('/device/C4DEE2879A60');
      },
    );
  }

  Future<void> getAuthenticatedUser() async {
    emit(AuthState.loading());
    final authCreds = _getSavedLoginCredentials();
    log(authCreds.toString());
    if (authCreds != null) {
      emit(
        state.copyWith(
          status: AuthStatus.authenticated,
          errorMessage: null,
          authenticationResult: authCreds,
        ),
      );
      router.replace('/');
    } else {
      emit(
        state.copyWith(
          status: AuthStatus.unauthenticated,
        ),
      );
    }
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

  AuthenticationResultEntity? _getSavedLoginCredentials() {
    try {
      final creds = LocalStorage.instance.getString('AuthenticatedCredential');
      if (creds != null) {
        return AuthenticationResultEntity.fromJson(jsonDecode(creds));
      }
      return null;
    } catch (e) {
      throw Exception('Error getting saved login credentials: $e');
    }
  }
}
