import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oflow/features/auth/domain/entity/authentication_result_entity.dart';

part 'generated/auth_state.freezed.dart';

enum AuthStatus { unauthenticated, loading, authenticated, error }

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required AuthStatus status,
    String? errorMessage,
    AuthenticationResultEntity? authenticationResult,
  }) = _AuthState;

  factory AuthState.initial() {
    return const AuthState(
      status: AuthStatus.unauthenticated,
    );
  }

  factory AuthState.loading() {
    return const AuthState(
      status: AuthStatus.loading,
    );
  }

  factory AuthState.error(String? errorMessage) {
    return AuthState(
      status: AuthStatus.error,
      errorMessage: errorMessage ?? 'An error occurred',
    );
  }
}
