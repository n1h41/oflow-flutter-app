// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../authentication_result_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthenticationResultEntity _$AuthenticationResultEntityFromJson(
    Map<String, dynamic> json) {
  return _AuthenticationResultEntity.fromJson(json);
}

/// @nodoc
mixin _$AuthenticationResultEntity {
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

  /// Serializes this AuthenticationResultEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthenticationResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthenticationResultEntityCopyWith<AuthenticationResultEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationResultEntityCopyWith<$Res> {
  factory $AuthenticationResultEntityCopyWith(AuthenticationResultEntity value,
          $Res Function(AuthenticationResultEntity) then) =
      _$AuthenticationResultEntityCopyWithImpl<$Res,
          AuthenticationResultEntity>;
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
class _$AuthenticationResultEntityCopyWithImpl<$Res,
        $Val extends AuthenticationResultEntity>
    implements $AuthenticationResultEntityCopyWith<$Res> {
  _$AuthenticationResultEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthenticationResultEntity
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
abstract class _$$AuthenticationResultEntityImplCopyWith<$Res>
    implements $AuthenticationResultEntityCopyWith<$Res> {
  factory _$$AuthenticationResultEntityImplCopyWith(
          _$AuthenticationResultEntityImpl value,
          $Res Function(_$AuthenticationResultEntityImpl) then) =
      __$$AuthenticationResultEntityImplCopyWithImpl<$Res>;
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
class __$$AuthenticationResultEntityImplCopyWithImpl<$Res>
    extends _$AuthenticationResultEntityCopyWithImpl<$Res,
        _$AuthenticationResultEntityImpl>
    implements _$$AuthenticationResultEntityImplCopyWith<$Res> {
  __$$AuthenticationResultEntityImplCopyWithImpl(
      _$AuthenticationResultEntityImpl _value,
      $Res Function(_$AuthenticationResultEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationResultEntity
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
    return _then(_$AuthenticationResultEntityImpl(
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
class _$AuthenticationResultEntityImpl implements _AuthenticationResultEntity {
  const _$AuthenticationResultEntityImpl(
      {@JsonKey(name: "AccessToken") this.accessToken,
      @JsonKey(name: "ExpiresIn") this.expiresIn,
      @JsonKey(name: "IdToken") this.idToken,
      @JsonKey(name: "NewDeviceMetadata") this.newDeviceMetadata,
      @JsonKey(name: "RefreshToken") this.refreshToken,
      @JsonKey(name: "TokenType") this.tokenType});

  factory _$AuthenticationResultEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AuthenticationResultEntityImplFromJson(json);

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
    return 'AuthenticationResultEntity(accessToken: $accessToken, expiresIn: $expiresIn, idToken: $idToken, newDeviceMetadata: $newDeviceMetadata, refreshToken: $refreshToken, tokenType: $tokenType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationResultEntityImpl &&
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

  /// Create a copy of AuthenticationResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationResultEntityImplCopyWith<_$AuthenticationResultEntityImpl>
      get copyWith => __$$AuthenticationResultEntityImplCopyWithImpl<
          _$AuthenticationResultEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenticationResultEntityImplToJson(
      this,
    );
  }
}

abstract class _AuthenticationResultEntity
    implements AuthenticationResultEntity {
  const factory _AuthenticationResultEntity(
          {@JsonKey(name: "AccessToken") final String? accessToken,
          @JsonKey(name: "ExpiresIn") final int? expiresIn,
          @JsonKey(name: "IdToken") final String? idToken,
          @JsonKey(name: "NewDeviceMetadata") final dynamic newDeviceMetadata,
          @JsonKey(name: "RefreshToken") final String? refreshToken,
          @JsonKey(name: "TokenType") final String? tokenType}) =
      _$AuthenticationResultEntityImpl;

  factory _AuthenticationResultEntity.fromJson(Map<String, dynamic> json) =
      _$AuthenticationResultEntityImpl.fromJson;

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

  /// Create a copy of AuthenticationResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticationResultEntityImplCopyWith<_$AuthenticationResultEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
