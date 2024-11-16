// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthParams _$AuthParamsFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'signUp':
      return SignUpParams.fromJson(json);
    case 'signIn':
      return SignInParams.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AuthParams',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AuthParams {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String firstName, String lastName,
            String phoneNumber, String password)
        signUp,
    required TResult Function(String email, String password) signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String firstName, String lastName,
            String phoneNumber, String password)?
        signUp,
    TResult? Function(String email, String password)? signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String firstName, String lastName,
            String phoneNumber, String password)?
        signUp,
    TResult Function(String email, String password)? signIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpParams value) signUp,
    required TResult Function(SignInParams value) signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpParams value)? signUp,
    TResult? Function(SignInParams value)? signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpParams value)? signUp,
    TResult Function(SignInParams value)? signIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this AuthParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthParamsCopyWith<AuthParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthParamsCopyWith<$Res> {
  factory $AuthParamsCopyWith(
          AuthParams value, $Res Function(AuthParams) then) =
      _$AuthParamsCopyWithImpl<$Res, AuthParams>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$AuthParamsCopyWithImpl<$Res, $Val extends AuthParams>
    implements $AuthParamsCopyWith<$Res> {
  _$AuthParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpParamsImplCopyWith<$Res>
    implements $AuthParamsCopyWith<$Res> {
  factory _$$SignUpParamsImplCopyWith(
          _$SignUpParamsImpl value, $Res Function(_$SignUpParamsImpl) then) =
      __$$SignUpParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String firstName,
      String lastName,
      String phoneNumber,
      String password});
}

/// @nodoc
class __$$SignUpParamsImplCopyWithImpl<$Res>
    extends _$AuthParamsCopyWithImpl<$Res, _$SignUpParamsImpl>
    implements _$$SignUpParamsImplCopyWith<$Res> {
  __$$SignUpParamsImplCopyWithImpl(
      _$SignUpParamsImpl _value, $Res Function(_$SignUpParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phoneNumber = null,
    Object? password = null,
  }) {
    return _then(_$SignUpParamsImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpParamsImpl implements SignUpParams {
  const _$SignUpParamsImpl(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.password,
      final String? $type})
      : $type = $type ?? 'signUp';

  factory _$SignUpParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpParamsImplFromJson(json);

  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String phoneNumber;
  @override
  final String password;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthParams.signUp(email: $email, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpParamsImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, email, firstName, lastName, phoneNumber, password);

  /// Create a copy of AuthParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpParamsImplCopyWith<_$SignUpParamsImpl> get copyWith =>
      __$$SignUpParamsImplCopyWithImpl<_$SignUpParamsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String firstName, String lastName,
            String phoneNumber, String password)
        signUp,
    required TResult Function(String email, String password) signIn,
  }) {
    return signUp(email, firstName, lastName, phoneNumber, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String firstName, String lastName,
            String phoneNumber, String password)?
        signUp,
    TResult? Function(String email, String password)? signIn,
  }) {
    return signUp?.call(email, firstName, lastName, phoneNumber, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String firstName, String lastName,
            String phoneNumber, String password)?
        signUp,
    TResult Function(String email, String password)? signIn,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(email, firstName, lastName, phoneNumber, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpParams value) signUp,
    required TResult Function(SignInParams value) signIn,
  }) {
    return signUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpParams value)? signUp,
    TResult? Function(SignInParams value)? signIn,
  }) {
    return signUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpParams value)? signUp,
    TResult Function(SignInParams value)? signIn,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpParamsImplToJson(
      this,
    );
  }
}

abstract class SignUpParams implements AuthParams {
  const factory SignUpParams(
      {required final String email,
      required final String firstName,
      required final String lastName,
      required final String phoneNumber,
      required final String password}) = _$SignUpParamsImpl;

  factory SignUpParams.fromJson(Map<String, dynamic> json) =
      _$SignUpParamsImpl.fromJson;

  @override
  String get email;
  String get firstName;
  String get lastName;
  String get phoneNumber;
  @override
  String get password;

  /// Create a copy of AuthParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpParamsImplCopyWith<_$SignUpParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInParamsImplCopyWith<$Res>
    implements $AuthParamsCopyWith<$Res> {
  factory _$$SignInParamsImplCopyWith(
          _$SignInParamsImpl value, $Res Function(_$SignInParamsImpl) then) =
      __$$SignInParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignInParamsImplCopyWithImpl<$Res>
    extends _$AuthParamsCopyWithImpl<$Res, _$SignInParamsImpl>
    implements _$$SignInParamsImplCopyWith<$Res> {
  __$$SignInParamsImplCopyWithImpl(
      _$SignInParamsImpl _value, $Res Function(_$SignInParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignInParamsImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInParamsImpl implements SignInParams {
  const _$SignInParamsImpl(
      {required this.email, required this.password, final String? $type})
      : $type = $type ?? 'signIn';

  factory _$SignInParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInParamsImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthParams.signIn(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInParamsImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of AuthParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInParamsImplCopyWith<_$SignInParamsImpl> get copyWith =>
      __$$SignInParamsImplCopyWithImpl<_$SignInParamsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String firstName, String lastName,
            String phoneNumber, String password)
        signUp,
    required TResult Function(String email, String password) signIn,
  }) {
    return signIn(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String firstName, String lastName,
            String phoneNumber, String password)?
        signUp,
    TResult? Function(String email, String password)? signIn,
  }) {
    return signIn?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String firstName, String lastName,
            String phoneNumber, String password)?
        signUp,
    TResult Function(String email, String password)? signIn,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpParams value) signUp,
    required TResult Function(SignInParams value) signIn,
  }) {
    return signIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpParams value)? signUp,
    TResult? Function(SignInParams value)? signIn,
  }) {
    return signIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpParams value)? signUp,
    TResult Function(SignInParams value)? signIn,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInParamsImplToJson(
      this,
    );
  }
}

abstract class SignInParams implements AuthParams {
  const factory SignInParams(
      {required final String email,
      required final String password}) = _$SignInParamsImpl;

  factory SignInParams.fromJson(Map<String, dynamic> json) =
      _$SignInParamsImpl.fromJson;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of AuthParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInParamsImplCopyWith<_$SignInParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
