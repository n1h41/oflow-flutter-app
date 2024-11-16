// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../sign_in_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignInResponseModel _$SignInResponseModelFromJson(Map<String, dynamic> json) {
  return _SignInResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SignInResponseModel {
  @JsonKey(name: "AuthenticationResult")
  AuthenticationResult? get authenticationResult =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "ChallengeName")
  String? get challengeName => throw _privateConstructorUsedError;
  @JsonKey(name: "ChallengeParameters")
  ChallengeParameters? get challengeParameters =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "Session")
  dynamic get session => throw _privateConstructorUsedError;
  @JsonKey(name: "ResultMetadata")
  ChallengeParameters? get resultMetadata => throw _privateConstructorUsedError;

  /// Serializes this SignInResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignInResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInResponseModelCopyWith<SignInResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInResponseModelCopyWith<$Res> {
  factory $SignInResponseModelCopyWith(
          SignInResponseModel value, $Res Function(SignInResponseModel) then) =
      _$SignInResponseModelCopyWithImpl<$Res, SignInResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "AuthenticationResult")
      AuthenticationResult? authenticationResult,
      @JsonKey(name: "ChallengeName") String? challengeName,
      @JsonKey(name: "ChallengeParameters")
      ChallengeParameters? challengeParameters,
      @JsonKey(name: "Session") dynamic session,
      @JsonKey(name: "ResultMetadata") ChallengeParameters? resultMetadata});

  $AuthenticationResultCopyWith<$Res>? get authenticationResult;
  $ChallengeParametersCopyWith<$Res>? get challengeParameters;
  $ChallengeParametersCopyWith<$Res>? get resultMetadata;
}

/// @nodoc
class _$SignInResponseModelCopyWithImpl<$Res, $Val extends SignInResponseModel>
    implements $SignInResponseModelCopyWith<$Res> {
  _$SignInResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authenticationResult = freezed,
    Object? challengeName = freezed,
    Object? challengeParameters = freezed,
    Object? session = freezed,
    Object? resultMetadata = freezed,
  }) {
    return _then(_value.copyWith(
      authenticationResult: freezed == authenticationResult
          ? _value.authenticationResult
          : authenticationResult // ignore: cast_nullable_to_non_nullable
              as AuthenticationResult?,
      challengeName: freezed == challengeName
          ? _value.challengeName
          : challengeName // ignore: cast_nullable_to_non_nullable
              as String?,
      challengeParameters: freezed == challengeParameters
          ? _value.challengeParameters
          : challengeParameters // ignore: cast_nullable_to_non_nullable
              as ChallengeParameters?,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as dynamic,
      resultMetadata: freezed == resultMetadata
          ? _value.resultMetadata
          : resultMetadata // ignore: cast_nullable_to_non_nullable
              as ChallengeParameters?,
    ) as $Val);
  }

  /// Create a copy of SignInResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthenticationResultCopyWith<$Res>? get authenticationResult {
    if (_value.authenticationResult == null) {
      return null;
    }

    return $AuthenticationResultCopyWith<$Res>(_value.authenticationResult!,
        (value) {
      return _then(_value.copyWith(authenticationResult: value) as $Val);
    });
  }

  /// Create a copy of SignInResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChallengeParametersCopyWith<$Res>? get challengeParameters {
    if (_value.challengeParameters == null) {
      return null;
    }

    return $ChallengeParametersCopyWith<$Res>(_value.challengeParameters!,
        (value) {
      return _then(_value.copyWith(challengeParameters: value) as $Val);
    });
  }

  /// Create a copy of SignInResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChallengeParametersCopyWith<$Res>? get resultMetadata {
    if (_value.resultMetadata == null) {
      return null;
    }

    return $ChallengeParametersCopyWith<$Res>(_value.resultMetadata!, (value) {
      return _then(_value.copyWith(resultMetadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignInResponseModelImplCopyWith<$Res>
    implements $SignInResponseModelCopyWith<$Res> {
  factory _$$SignInResponseModelImplCopyWith(_$SignInResponseModelImpl value,
          $Res Function(_$SignInResponseModelImpl) then) =
      __$$SignInResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "AuthenticationResult")
      AuthenticationResult? authenticationResult,
      @JsonKey(name: "ChallengeName") String? challengeName,
      @JsonKey(name: "ChallengeParameters")
      ChallengeParameters? challengeParameters,
      @JsonKey(name: "Session") dynamic session,
      @JsonKey(name: "ResultMetadata") ChallengeParameters? resultMetadata});

  @override
  $AuthenticationResultCopyWith<$Res>? get authenticationResult;
  @override
  $ChallengeParametersCopyWith<$Res>? get challengeParameters;
  @override
  $ChallengeParametersCopyWith<$Res>? get resultMetadata;
}

/// @nodoc
class __$$SignInResponseModelImplCopyWithImpl<$Res>
    extends _$SignInResponseModelCopyWithImpl<$Res, _$SignInResponseModelImpl>
    implements _$$SignInResponseModelImplCopyWith<$Res> {
  __$$SignInResponseModelImplCopyWithImpl(_$SignInResponseModelImpl _value,
      $Res Function(_$SignInResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authenticationResult = freezed,
    Object? challengeName = freezed,
    Object? challengeParameters = freezed,
    Object? session = freezed,
    Object? resultMetadata = freezed,
  }) {
    return _then(_$SignInResponseModelImpl(
      authenticationResult: freezed == authenticationResult
          ? _value.authenticationResult
          : authenticationResult // ignore: cast_nullable_to_non_nullable
              as AuthenticationResult?,
      challengeName: freezed == challengeName
          ? _value.challengeName
          : challengeName // ignore: cast_nullable_to_non_nullable
              as String?,
      challengeParameters: freezed == challengeParameters
          ? _value.challengeParameters
          : challengeParameters // ignore: cast_nullable_to_non_nullable
              as ChallengeParameters?,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as dynamic,
      resultMetadata: freezed == resultMetadata
          ? _value.resultMetadata
          : resultMetadata // ignore: cast_nullable_to_non_nullable
              as ChallengeParameters?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInResponseModelImpl implements _SignInResponseModel {
  const _$SignInResponseModelImpl(
      {@JsonKey(name: "AuthenticationResult") this.authenticationResult,
      @JsonKey(name: "ChallengeName") this.challengeName,
      @JsonKey(name: "ChallengeParameters") this.challengeParameters,
      @JsonKey(name: "Session") this.session,
      @JsonKey(name: "ResultMetadata") this.resultMetadata});

  factory _$SignInResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInResponseModelImplFromJson(json);

  @override
  @JsonKey(name: "AuthenticationResult")
  final AuthenticationResult? authenticationResult;
  @override
  @JsonKey(name: "ChallengeName")
  final String? challengeName;
  @override
  @JsonKey(name: "ChallengeParameters")
  final ChallengeParameters? challengeParameters;
  @override
  @JsonKey(name: "Session")
  final dynamic session;
  @override
  @JsonKey(name: "ResultMetadata")
  final ChallengeParameters? resultMetadata;

  @override
  String toString() {
    return 'SignInResponseModel(authenticationResult: $authenticationResult, challengeName: $challengeName, challengeParameters: $challengeParameters, session: $session, resultMetadata: $resultMetadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInResponseModelImpl &&
            (identical(other.authenticationResult, authenticationResult) ||
                other.authenticationResult == authenticationResult) &&
            (identical(other.challengeName, challengeName) ||
                other.challengeName == challengeName) &&
            (identical(other.challengeParameters, challengeParameters) ||
                other.challengeParameters == challengeParameters) &&
            const DeepCollectionEquality().equals(other.session, session) &&
            (identical(other.resultMetadata, resultMetadata) ||
                other.resultMetadata == resultMetadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      authenticationResult,
      challengeName,
      challengeParameters,
      const DeepCollectionEquality().hash(session),
      resultMetadata);

  /// Create a copy of SignInResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInResponseModelImplCopyWith<_$SignInResponseModelImpl> get copyWith =>
      __$$SignInResponseModelImplCopyWithImpl<_$SignInResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInResponseModelImplToJson(
      this,
    );
  }
}

abstract class _SignInResponseModel implements SignInResponseModel {
  const factory _SignInResponseModel(
      {@JsonKey(name: "AuthenticationResult")
      final AuthenticationResult? authenticationResult,
      @JsonKey(name: "ChallengeName") final String? challengeName,
      @JsonKey(name: "ChallengeParameters")
      final ChallengeParameters? challengeParameters,
      @JsonKey(name: "Session") final dynamic session,
      @JsonKey(name: "ResultMetadata")
      final ChallengeParameters? resultMetadata}) = _$SignInResponseModelImpl;

  factory _SignInResponseModel.fromJson(Map<String, dynamic> json) =
      _$SignInResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "AuthenticationResult")
  AuthenticationResult? get authenticationResult;
  @override
  @JsonKey(name: "ChallengeName")
  String? get challengeName;
  @override
  @JsonKey(name: "ChallengeParameters")
  ChallengeParameters? get challengeParameters;
  @override
  @JsonKey(name: "Session")
  dynamic get session;
  @override
  @JsonKey(name: "ResultMetadata")
  ChallengeParameters? get resultMetadata;

  /// Create a copy of SignInResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInResponseModelImplCopyWith<_$SignInResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthenticationResult _$AuthenticationResultFromJson(Map<String, dynamic> json) {
  return _AuthenticationResult.fromJson(json);
}

/// @nodoc
mixin _$AuthenticationResult {
  @JsonKey(name: "AccessToken")
  String? get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: "ExpiresIn")
  int? get expiresIn => throw _privateConstructorUsedError;
  @JsonKey(name: "IdToken")
  String? get idToken => throw _privateConstructorUsedError;
  @JsonKey(name: "NewDeviceMetadata")
  dynamic get newDeviceMetadata => throw _privateConstructorUsedError;
  @JsonKey(name: "RefreshToken")
  String? get refreshToken => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenType")
  String? get tokenType => throw _privateConstructorUsedError;

  /// Serializes this AuthenticationResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthenticationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthenticationResultCopyWith<AuthenticationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationResultCopyWith<$Res> {
  factory $AuthenticationResultCopyWith(AuthenticationResult value,
          $Res Function(AuthenticationResult) then) =
      _$AuthenticationResultCopyWithImpl<$Res, AuthenticationResult>;
  @useResult
  $Res call(
      {@JsonKey(name: "AccessToken") String? accessToken,
      @JsonKey(name: "ExpiresIn") int? expiresIn,
      @JsonKey(name: "IdToken") String? idToken,
      @JsonKey(name: "NewDeviceMetadata") dynamic newDeviceMetadata,
      @JsonKey(name: "RefreshToken") String? refreshToken,
      @JsonKey(name: "TokenType") String? tokenType});
}

/// @nodoc
class _$AuthenticationResultCopyWithImpl<$Res,
        $Val extends AuthenticationResult>
    implements $AuthenticationResultCopyWith<$Res> {
  _$AuthenticationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthenticationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? expiresIn = freezed,
    Object? idToken = freezed,
    Object? newDeviceMetadata = freezed,
    Object? refreshToken = freezed,
    Object? tokenType = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      newDeviceMetadata: freezed == newDeviceMetadata
          ? _value.newDeviceMetadata
          : newDeviceMetadata // ignore: cast_nullable_to_non_nullable
              as dynamic,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthenticationResultImplCopyWith<$Res>
    implements $AuthenticationResultCopyWith<$Res> {
  factory _$$AuthenticationResultImplCopyWith(_$AuthenticationResultImpl value,
          $Res Function(_$AuthenticationResultImpl) then) =
      __$$AuthenticationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "AccessToken") String? accessToken,
      @JsonKey(name: "ExpiresIn") int? expiresIn,
      @JsonKey(name: "IdToken") String? idToken,
      @JsonKey(name: "NewDeviceMetadata") dynamic newDeviceMetadata,
      @JsonKey(name: "RefreshToken") String? refreshToken,
      @JsonKey(name: "TokenType") String? tokenType});
}

/// @nodoc
class __$$AuthenticationResultImplCopyWithImpl<$Res>
    extends _$AuthenticationResultCopyWithImpl<$Res, _$AuthenticationResultImpl>
    implements _$$AuthenticationResultImplCopyWith<$Res> {
  __$$AuthenticationResultImplCopyWithImpl(_$AuthenticationResultImpl _value,
      $Res Function(_$AuthenticationResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? expiresIn = freezed,
    Object? idToken = freezed,
    Object? newDeviceMetadata = freezed,
    Object? refreshToken = freezed,
    Object? tokenType = freezed,
  }) {
    return _then(_$AuthenticationResultImpl(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      newDeviceMetadata: freezed == newDeviceMetadata
          ? _value.newDeviceMetadata
          : newDeviceMetadata // ignore: cast_nullable_to_non_nullable
              as dynamic,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthenticationResultImpl implements _AuthenticationResult {
  const _$AuthenticationResultImpl(
      {@JsonKey(name: "AccessToken") this.accessToken,
      @JsonKey(name: "ExpiresIn") this.expiresIn,
      @JsonKey(name: "IdToken") this.idToken,
      @JsonKey(name: "NewDeviceMetadata") this.newDeviceMetadata,
      @JsonKey(name: "RefreshToken") this.refreshToken,
      @JsonKey(name: "TokenType") this.tokenType});

  factory _$AuthenticationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthenticationResultImplFromJson(json);

  @override
  @JsonKey(name: "AccessToken")
  final String? accessToken;
  @override
  @JsonKey(name: "ExpiresIn")
  final int? expiresIn;
  @override
  @JsonKey(name: "IdToken")
  final String? idToken;
  @override
  @JsonKey(name: "NewDeviceMetadata")
  final dynamic newDeviceMetadata;
  @override
  @JsonKey(name: "RefreshToken")
  final String? refreshToken;
  @override
  @JsonKey(name: "TokenType")
  final String? tokenType;

  @override
  String toString() {
    return 'AuthenticationResult(accessToken: $accessToken, expiresIn: $expiresIn, idToken: $idToken, newDeviceMetadata: $newDeviceMetadata, refreshToken: $refreshToken, tokenType: $tokenType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationResultImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            const DeepCollectionEquality()
                .equals(other.newDeviceMetadata, newDeviceMetadata) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      accessToken,
      expiresIn,
      idToken,
      const DeepCollectionEquality().hash(newDeviceMetadata),
      refreshToken,
      tokenType);

  /// Create a copy of AuthenticationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationResultImplCopyWith<_$AuthenticationResultImpl>
      get copyWith =>
          __$$AuthenticationResultImplCopyWithImpl<_$AuthenticationResultImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenticationResultImplToJson(
      this,
    );
  }
}

abstract class _AuthenticationResult implements AuthenticationResult {
  const factory _AuthenticationResult(
          {@JsonKey(name: "AccessToken") final String? accessToken,
          @JsonKey(name: "ExpiresIn") final int? expiresIn,
          @JsonKey(name: "IdToken") final String? idToken,
          @JsonKey(name: "NewDeviceMetadata") final dynamic newDeviceMetadata,
          @JsonKey(name: "RefreshToken") final String? refreshToken,
          @JsonKey(name: "TokenType") final String? tokenType}) =
      _$AuthenticationResultImpl;

  factory _AuthenticationResult.fromJson(Map<String, dynamic> json) =
      _$AuthenticationResultImpl.fromJson;

  @override
  @JsonKey(name: "AccessToken")
  String? get accessToken;
  @override
  @JsonKey(name: "ExpiresIn")
  int? get expiresIn;
  @override
  @JsonKey(name: "IdToken")
  String? get idToken;
  @override
  @JsonKey(name: "NewDeviceMetadata")
  dynamic get newDeviceMetadata;
  @override
  @JsonKey(name: "RefreshToken")
  String? get refreshToken;
  @override
  @JsonKey(name: "TokenType")
  String? get tokenType;

  /// Create a copy of AuthenticationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticationResultImplCopyWith<_$AuthenticationResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChallengeParameters _$ChallengeParametersFromJson(Map<String, dynamic> json) {
  return _ChallengeParameters.fromJson(json);
}

/// @nodoc
mixin _$ChallengeParameters {
  /// Serializes this ChallengeParameters to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeParametersCopyWith<$Res> {
  factory $ChallengeParametersCopyWith(
          ChallengeParameters value, $Res Function(ChallengeParameters) then) =
      _$ChallengeParametersCopyWithImpl<$Res, ChallengeParameters>;
}

/// @nodoc
class _$ChallengeParametersCopyWithImpl<$Res, $Val extends ChallengeParameters>
    implements $ChallengeParametersCopyWith<$Res> {
  _$ChallengeParametersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChallengeParameters
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ChallengeParametersImplCopyWith<$Res> {
  factory _$$ChallengeParametersImplCopyWith(_$ChallengeParametersImpl value,
          $Res Function(_$ChallengeParametersImpl) then) =
      __$$ChallengeParametersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChallengeParametersImplCopyWithImpl<$Res>
    extends _$ChallengeParametersCopyWithImpl<$Res, _$ChallengeParametersImpl>
    implements _$$ChallengeParametersImplCopyWith<$Res> {
  __$$ChallengeParametersImplCopyWithImpl(_$ChallengeParametersImpl _value,
      $Res Function(_$ChallengeParametersImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChallengeParameters
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ChallengeParametersImpl implements _ChallengeParameters {
  const _$ChallengeParametersImpl();

  factory _$ChallengeParametersImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeParametersImplFromJson(json);

  @override
  String toString() {
    return 'ChallengeParameters()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeParametersImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeParametersImplToJson(
      this,
    );
  }
}

abstract class _ChallengeParameters implements ChallengeParameters {
  const factory _ChallengeParameters() = _$ChallengeParametersImpl;

  factory _ChallengeParameters.fromJson(Map<String, dynamic> json) =
      _$ChallengeParametersImpl.fromJson;
}
