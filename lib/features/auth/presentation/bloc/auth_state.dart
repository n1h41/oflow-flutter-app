import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/auth_state.freezed.dart';

enum AuthStatus { unauthenticated, loading, authenticated, error }

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required AuthStatus status,
    required String? errorMessage,
  }) = _AuthState;

  factory AuthState.initial() {
    return const AuthState(
      status: AuthStatus.unauthenticated,
      errorMessage: null,
    );
  }
}

