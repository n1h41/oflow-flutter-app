import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/params.freezed.dart';
part 'generated/params.g.dart';

@freezed
class AuthParams with _$AuthParams {
  const factory AuthParams.signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String password,
  }) = SignUpParams;

  const factory AuthParams.signIn({
    required String email,
    required String password,
  }) = SignInParams;

  factory AuthParams.fromJson(Map<String, dynamic> json) =>
      _$AuthParamsFromJson(json);
}
