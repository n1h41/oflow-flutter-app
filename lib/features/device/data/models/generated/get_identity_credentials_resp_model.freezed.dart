// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../get_identity_credentials_resp_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetIdentityCredentialsRespModel _$GetIdentityCredentialsRespModelFromJson(
    Map<String, dynamic> json) {
  return _GetIdentityCredentialsRespModel.fromJson(json);
}

/// @nodoc
mixin _$GetIdentityCredentialsRespModel {
  @JsonKey(name: "Credentials")
  Credentials? get credentials => throw _privateConstructorUsedError;
  @JsonKey(name: "IdentityId")
  String? get identityId => throw _privateConstructorUsedError;
  @JsonKey(name: "ResultMetadata")
  ResultMetadata? get resultMetadata => throw _privateConstructorUsedError;

  /// Serializes this GetIdentityCredentialsRespModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetIdentityCredentialsRespModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetIdentityCredentialsRespModelCopyWith<GetIdentityCredentialsRespModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetIdentityCredentialsRespModelCopyWith<$Res> {
  factory $GetIdentityCredentialsRespModelCopyWith(
          GetIdentityCredentialsRespModel value,
          $Res Function(GetIdentityCredentialsRespModel) then) =
      _$GetIdentityCredentialsRespModelCopyWithImpl<$Res,
          GetIdentityCredentialsRespModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "Credentials") Credentials? credentials,
      @JsonKey(name: "IdentityId") String? identityId,
      @JsonKey(name: "ResultMetadata") ResultMetadata? resultMetadata});

  $CredentialsCopyWith<$Res>? get credentials;
  $ResultMetadataCopyWith<$Res>? get resultMetadata;
}

/// @nodoc
class _$GetIdentityCredentialsRespModelCopyWithImpl<$Res,
        $Val extends GetIdentityCredentialsRespModel>
    implements $GetIdentityCredentialsRespModelCopyWith<$Res> {
  _$GetIdentityCredentialsRespModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetIdentityCredentialsRespModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credentials = freezed,
    Object? identityId = freezed,
    Object? resultMetadata = freezed,
  }) {
    return _then(_value.copyWith(
      credentials: freezed == credentials
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as Credentials?,
      identityId: freezed == identityId
          ? _value.identityId
          : identityId // ignore: cast_nullable_to_non_nullable
              as String?,
      resultMetadata: freezed == resultMetadata
          ? _value.resultMetadata
          : resultMetadata // ignore: cast_nullable_to_non_nullable
              as ResultMetadata?,
    ) as $Val);
  }

  /// Create a copy of GetIdentityCredentialsRespModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CredentialsCopyWith<$Res>? get credentials {
    if (_value.credentials == null) {
      return null;
    }

    return $CredentialsCopyWith<$Res>(_value.credentials!, (value) {
      return _then(_value.copyWith(credentials: value) as $Val);
    });
  }

  /// Create a copy of GetIdentityCredentialsRespModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultMetadataCopyWith<$Res>? get resultMetadata {
    if (_value.resultMetadata == null) {
      return null;
    }

    return $ResultMetadataCopyWith<$Res>(_value.resultMetadata!, (value) {
      return _then(_value.copyWith(resultMetadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetIdentityCredentialsRespModelImplCopyWith<$Res>
    implements $GetIdentityCredentialsRespModelCopyWith<$Res> {
  factory _$$GetIdentityCredentialsRespModelImplCopyWith(
          _$GetIdentityCredentialsRespModelImpl value,
          $Res Function(_$GetIdentityCredentialsRespModelImpl) then) =
      __$$GetIdentityCredentialsRespModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Credentials") Credentials? credentials,
      @JsonKey(name: "IdentityId") String? identityId,
      @JsonKey(name: "ResultMetadata") ResultMetadata? resultMetadata});

  @override
  $CredentialsCopyWith<$Res>? get credentials;
  @override
  $ResultMetadataCopyWith<$Res>? get resultMetadata;
}

/// @nodoc
class __$$GetIdentityCredentialsRespModelImplCopyWithImpl<$Res>
    extends _$GetIdentityCredentialsRespModelCopyWithImpl<$Res,
        _$GetIdentityCredentialsRespModelImpl>
    implements _$$GetIdentityCredentialsRespModelImplCopyWith<$Res> {
  __$$GetIdentityCredentialsRespModelImplCopyWithImpl(
      _$GetIdentityCredentialsRespModelImpl _value,
      $Res Function(_$GetIdentityCredentialsRespModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetIdentityCredentialsRespModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credentials = freezed,
    Object? identityId = freezed,
    Object? resultMetadata = freezed,
  }) {
    return _then(_$GetIdentityCredentialsRespModelImpl(
      credentials: freezed == credentials
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as Credentials?,
      identityId: freezed == identityId
          ? _value.identityId
          : identityId // ignore: cast_nullable_to_non_nullable
              as String?,
      resultMetadata: freezed == resultMetadata
          ? _value.resultMetadata
          : resultMetadata // ignore: cast_nullable_to_non_nullable
              as ResultMetadata?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetIdentityCredentialsRespModelImpl
    implements _GetIdentityCredentialsRespModel {
  const _$GetIdentityCredentialsRespModelImpl(
      {@JsonKey(name: "Credentials") this.credentials,
      @JsonKey(name: "IdentityId") this.identityId,
      @JsonKey(name: "ResultMetadata") this.resultMetadata});

  factory _$GetIdentityCredentialsRespModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetIdentityCredentialsRespModelImplFromJson(json);

  @override
  @JsonKey(name: "Credentials")
  final Credentials? credentials;
  @override
  @JsonKey(name: "IdentityId")
  final String? identityId;
  @override
  @JsonKey(name: "ResultMetadata")
  final ResultMetadata? resultMetadata;

  @override
  String toString() {
    return 'GetIdentityCredentialsRespModel(credentials: $credentials, identityId: $identityId, resultMetadata: $resultMetadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetIdentityCredentialsRespModelImpl &&
            (identical(other.credentials, credentials) ||
                other.credentials == credentials) &&
            (identical(other.identityId, identityId) ||
                other.identityId == identityId) &&
            (identical(other.resultMetadata, resultMetadata) ||
                other.resultMetadata == resultMetadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, credentials, identityId, resultMetadata);

  /// Create a copy of GetIdentityCredentialsRespModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetIdentityCredentialsRespModelImplCopyWith<
          _$GetIdentityCredentialsRespModelImpl>
      get copyWith => __$$GetIdentityCredentialsRespModelImplCopyWithImpl<
          _$GetIdentityCredentialsRespModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetIdentityCredentialsRespModelImplToJson(
      this,
    );
  }
}

abstract class _GetIdentityCredentialsRespModel
    implements GetIdentityCredentialsRespModel {
  const factory _GetIdentityCredentialsRespModel(
          {@JsonKey(name: "Credentials") final Credentials? credentials,
          @JsonKey(name: "IdentityId") final String? identityId,
          @JsonKey(name: "ResultMetadata")
          final ResultMetadata? resultMetadata}) =
      _$GetIdentityCredentialsRespModelImpl;

  factory _GetIdentityCredentialsRespModel.fromJson(Map<String, dynamic> json) =
      _$GetIdentityCredentialsRespModelImpl.fromJson;

  @override
  @JsonKey(name: "Credentials")
  Credentials? get credentials;
  @override
  @JsonKey(name: "IdentityId")
  String? get identityId;
  @override
  @JsonKey(name: "ResultMetadata")
  ResultMetadata? get resultMetadata;

  /// Create a copy of GetIdentityCredentialsRespModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetIdentityCredentialsRespModelImplCopyWith<
          _$GetIdentityCredentialsRespModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Credentials _$CredentialsFromJson(Map<String, dynamic> json) {
  return _Credentials.fromJson(json);
}

/// @nodoc
mixin _$Credentials {
  @JsonKey(name: "AccessKeyId")
  String? get accessKeyId => throw _privateConstructorUsedError;
  @JsonKey(name: "Expiration")
  String? get expiration => throw _privateConstructorUsedError;
  @JsonKey(name: "SecretKey")
  String? get secretKey => throw _privateConstructorUsedError;
  @JsonKey(name: "SessionToken")
  String? get sessionToken => throw _privateConstructorUsedError;

  /// Serializes this Credentials to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Credentials
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CredentialsCopyWith<Credentials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CredentialsCopyWith<$Res> {
  factory $CredentialsCopyWith(
          Credentials value, $Res Function(Credentials) then) =
      _$CredentialsCopyWithImpl<$Res, Credentials>;
  @useResult
  $Res call(
      {@JsonKey(name: "AccessKeyId") String? accessKeyId,
      @JsonKey(name: "Expiration") String? expiration,
      @JsonKey(name: "SecretKey") String? secretKey,
      @JsonKey(name: "SessionToken") String? sessionToken});
}

/// @nodoc
class _$CredentialsCopyWithImpl<$Res, $Val extends Credentials>
    implements $CredentialsCopyWith<$Res> {
  _$CredentialsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Credentials
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessKeyId = freezed,
    Object? expiration = freezed,
    Object? secretKey = freezed,
    Object? sessionToken = freezed,
  }) {
    return _then(_value.copyWith(
      accessKeyId: freezed == accessKeyId
          ? _value.accessKeyId
          : accessKeyId // ignore: cast_nullable_to_non_nullable
              as String?,
      expiration: freezed == expiration
          ? _value.expiration
          : expiration // ignore: cast_nullable_to_non_nullable
              as String?,
      secretKey: freezed == secretKey
          ? _value.secretKey
          : secretKey // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionToken: freezed == sessionToken
          ? _value.sessionToken
          : sessionToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CredentialsImplCopyWith<$Res>
    implements $CredentialsCopyWith<$Res> {
  factory _$$CredentialsImplCopyWith(
          _$CredentialsImpl value, $Res Function(_$CredentialsImpl) then) =
      __$$CredentialsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "AccessKeyId") String? accessKeyId,
      @JsonKey(name: "Expiration") String? expiration,
      @JsonKey(name: "SecretKey") String? secretKey,
      @JsonKey(name: "SessionToken") String? sessionToken});
}

/// @nodoc
class __$$CredentialsImplCopyWithImpl<$Res>
    extends _$CredentialsCopyWithImpl<$Res, _$CredentialsImpl>
    implements _$$CredentialsImplCopyWith<$Res> {
  __$$CredentialsImplCopyWithImpl(
      _$CredentialsImpl _value, $Res Function(_$CredentialsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Credentials
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessKeyId = freezed,
    Object? expiration = freezed,
    Object? secretKey = freezed,
    Object? sessionToken = freezed,
  }) {
    return _then(_$CredentialsImpl(
      accessKeyId: freezed == accessKeyId
          ? _value.accessKeyId
          : accessKeyId // ignore: cast_nullable_to_non_nullable
              as String?,
      expiration: freezed == expiration
          ? _value.expiration
          : expiration // ignore: cast_nullable_to_non_nullable
              as String?,
      secretKey: freezed == secretKey
          ? _value.secretKey
          : secretKey // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionToken: freezed == sessionToken
          ? _value.sessionToken
          : sessionToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CredentialsImpl implements _Credentials {
  const _$CredentialsImpl(
      {@JsonKey(name: "AccessKeyId") this.accessKeyId,
      @JsonKey(name: "Expiration") this.expiration,
      @JsonKey(name: "SecretKey") this.secretKey,
      @JsonKey(name: "SessionToken") this.sessionToken});

  factory _$CredentialsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CredentialsImplFromJson(json);

  @override
  @JsonKey(name: "AccessKeyId")
  final String? accessKeyId;
  @override
  @JsonKey(name: "Expiration")
  final String? expiration;
  @override
  @JsonKey(name: "SecretKey")
  final String? secretKey;
  @override
  @JsonKey(name: "SessionToken")
  final String? sessionToken;

  @override
  String toString() {
    return 'Credentials(accessKeyId: $accessKeyId, expiration: $expiration, secretKey: $secretKey, sessionToken: $sessionToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CredentialsImpl &&
            (identical(other.accessKeyId, accessKeyId) ||
                other.accessKeyId == accessKeyId) &&
            (identical(other.expiration, expiration) ||
                other.expiration == expiration) &&
            (identical(other.secretKey, secretKey) ||
                other.secretKey == secretKey) &&
            (identical(other.sessionToken, sessionToken) ||
                other.sessionToken == sessionToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, accessKeyId, expiration, secretKey, sessionToken);

  /// Create a copy of Credentials
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CredentialsImplCopyWith<_$CredentialsImpl> get copyWith =>
      __$$CredentialsImplCopyWithImpl<_$CredentialsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CredentialsImplToJson(
      this,
    );
  }
}

abstract class _Credentials implements Credentials {
  const factory _Credentials(
          {@JsonKey(name: "AccessKeyId") final String? accessKeyId,
          @JsonKey(name: "Expiration") final String? expiration,
          @JsonKey(name: "SecretKey") final String? secretKey,
          @JsonKey(name: "SessionToken") final String? sessionToken}) =
      _$CredentialsImpl;

  factory _Credentials.fromJson(Map<String, dynamic> json) =
      _$CredentialsImpl.fromJson;

  @override
  @JsonKey(name: "AccessKeyId")
  String? get accessKeyId;
  @override
  @JsonKey(name: "Expiration")
  String? get expiration;
  @override
  @JsonKey(name: "SecretKey")
  String? get secretKey;
  @override
  @JsonKey(name: "SessionToken")
  String? get sessionToken;

  /// Create a copy of Credentials
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CredentialsImplCopyWith<_$CredentialsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResultMetadata _$ResultMetadataFromJson(Map<String, dynamic> json) {
  return _ResultMetadata.fromJson(json);
}

/// @nodoc
mixin _$ResultMetadata {
  /// Serializes this ResultMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultMetadataCopyWith<$Res> {
  factory $ResultMetadataCopyWith(
          ResultMetadata value, $Res Function(ResultMetadata) then) =
      _$ResultMetadataCopyWithImpl<$Res, ResultMetadata>;
}

/// @nodoc
class _$ResultMetadataCopyWithImpl<$Res, $Val extends ResultMetadata>
    implements $ResultMetadataCopyWith<$Res> {
  _$ResultMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultMetadata
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ResultMetadataImplCopyWith<$Res> {
  factory _$$ResultMetadataImplCopyWith(_$ResultMetadataImpl value,
          $Res Function(_$ResultMetadataImpl) then) =
      __$$ResultMetadataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResultMetadataImplCopyWithImpl<$Res>
    extends _$ResultMetadataCopyWithImpl<$Res, _$ResultMetadataImpl>
    implements _$$ResultMetadataImplCopyWith<$Res> {
  __$$ResultMetadataImplCopyWithImpl(
      _$ResultMetadataImpl _value, $Res Function(_$ResultMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResultMetadata
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ResultMetadataImpl implements _ResultMetadata {
  const _$ResultMetadataImpl();

  factory _$ResultMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultMetadataImplFromJson(json);

  @override
  String toString() {
    return 'ResultMetadata()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResultMetadataImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultMetadataImplToJson(
      this,
    );
  }
}

abstract class _ResultMetadata implements ResultMetadata {
  const factory _ResultMetadata() = _$ResultMetadataImpl;

  factory _ResultMetadata.fromJson(Map<String, dynamic> json) =
      _$ResultMetadataImpl.fromJson;
}
