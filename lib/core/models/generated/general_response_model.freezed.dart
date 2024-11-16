// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../general_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeneralResponseModel<T> _$GeneralResponseModelFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _GeneralResponseModel<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$GeneralResponseModel<T> {
  T get message => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;

  /// Serializes this GeneralResponseModel to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of GeneralResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeneralResponseModelCopyWith<T, GeneralResponseModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralResponseModelCopyWith<T, $Res> {
  factory $GeneralResponseModelCopyWith(GeneralResponseModel<T> value,
          $Res Function(GeneralResponseModel<T>) then) =
      _$GeneralResponseModelCopyWithImpl<T, $Res, GeneralResponseModel<T>>;
  @useResult
  $Res call({T message, bool status});
}

/// @nodoc
class _$GeneralResponseModelCopyWithImpl<T, $Res,
        $Val extends GeneralResponseModel<T>>
    implements $GeneralResponseModelCopyWith<T, $Res> {
  _$GeneralResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeneralResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as T,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeneralResponseModelImplCopyWith<T, $Res>
    implements $GeneralResponseModelCopyWith<T, $Res> {
  factory _$$GeneralResponseModelImplCopyWith(
          _$GeneralResponseModelImpl<T> value,
          $Res Function(_$GeneralResponseModelImpl<T>) then) =
      __$$GeneralResponseModelImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T message, bool status});
}

/// @nodoc
class __$$GeneralResponseModelImplCopyWithImpl<T, $Res>
    extends _$GeneralResponseModelCopyWithImpl<T, $Res,
        _$GeneralResponseModelImpl<T>>
    implements _$$GeneralResponseModelImplCopyWith<T, $Res> {
  __$$GeneralResponseModelImplCopyWithImpl(_$GeneralResponseModelImpl<T> _value,
      $Res Function(_$GeneralResponseModelImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of GeneralResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? status = null,
  }) {
    return _then(_$GeneralResponseModelImpl<T>(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as T,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$GeneralResponseModelImpl<T> implements _GeneralResponseModel<T> {
  const _$GeneralResponseModelImpl(
      {required this.message, required this.status});

  factory _$GeneralResponseModelImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$GeneralResponseModelImplFromJson(json, fromJsonT);

  @override
  final T message;
  @override
  final bool status;

  @override
  String toString() {
    return 'GeneralResponseModel<$T>(message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralResponseModelImpl<T> &&
            const DeepCollectionEquality().equals(other.message, message) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(message), status);

  /// Create a copy of GeneralResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralResponseModelImplCopyWith<T, _$GeneralResponseModelImpl<T>>
      get copyWith => __$$GeneralResponseModelImplCopyWithImpl<T,
          _$GeneralResponseModelImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$GeneralResponseModelImplToJson<T>(this, toJsonT);
  }
}

abstract class _GeneralResponseModel<T> implements GeneralResponseModel<T> {
  const factory _GeneralResponseModel(
      {required final T message,
      required final bool status}) = _$GeneralResponseModelImpl<T>;

  factory _GeneralResponseModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$GeneralResponseModelImpl<T>.fromJson;

  @override
  T get message;
  @override
  bool get status;

  /// Create a copy of GeneralResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneralResponseModelImplCopyWith<T, _$GeneralResponseModelImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
