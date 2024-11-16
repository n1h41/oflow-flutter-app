// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../vals_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ValsEntity _$ValsEntityFromJson(Map<String, dynamic> json) {
  return _ValsEntity.fromJson(json);
}

/// @nodoc
mixin _$ValsEntity {
  @JsonKey(name: 'off_time')
  String get offTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_volt')
  String get minVolt => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_current')
  String get minCurrent => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_current')
  String get maxCurrent => throw _privateConstructorUsedError;

  /// Serializes this ValsEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ValsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValsEntityCopyWith<ValsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValsEntityCopyWith<$Res> {
  factory $ValsEntityCopyWith(
          ValsEntity value, $Res Function(ValsEntity) then) =
      _$ValsEntityCopyWithImpl<$Res, ValsEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'off_time') String offTime,
      @JsonKey(name: 'min_volt') String minVolt,
      @JsonKey(name: 'min_current') String minCurrent,
      @JsonKey(name: 'max_current') String maxCurrent});
}

/// @nodoc
class _$ValsEntityCopyWithImpl<$Res, $Val extends ValsEntity>
    implements $ValsEntityCopyWith<$Res> {
  _$ValsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ValsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offTime = null,
    Object? minVolt = null,
    Object? minCurrent = null,
    Object? maxCurrent = null,
  }) {
    return _then(_value.copyWith(
      offTime: null == offTime
          ? _value.offTime
          : offTime // ignore: cast_nullable_to_non_nullable
              as String,
      minVolt: null == minVolt
          ? _value.minVolt
          : minVolt // ignore: cast_nullable_to_non_nullable
              as String,
      minCurrent: null == minCurrent
          ? _value.minCurrent
          : minCurrent // ignore: cast_nullable_to_non_nullable
              as String,
      maxCurrent: null == maxCurrent
          ? _value.maxCurrent
          : maxCurrent // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValsEntityImplCopyWith<$Res>
    implements $ValsEntityCopyWith<$Res> {
  factory _$$ValsEntityImplCopyWith(
          _$ValsEntityImpl value, $Res Function(_$ValsEntityImpl) then) =
      __$$ValsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'off_time') String offTime,
      @JsonKey(name: 'min_volt') String minVolt,
      @JsonKey(name: 'min_current') String minCurrent,
      @JsonKey(name: 'max_current') String maxCurrent});
}

/// @nodoc
class __$$ValsEntityImplCopyWithImpl<$Res>
    extends _$ValsEntityCopyWithImpl<$Res, _$ValsEntityImpl>
    implements _$$ValsEntityImplCopyWith<$Res> {
  __$$ValsEntityImplCopyWithImpl(
      _$ValsEntityImpl _value, $Res Function(_$ValsEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ValsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offTime = null,
    Object? minVolt = null,
    Object? minCurrent = null,
    Object? maxCurrent = null,
  }) {
    return _then(_$ValsEntityImpl(
      offTime: null == offTime
          ? _value.offTime
          : offTime // ignore: cast_nullable_to_non_nullable
              as String,
      minVolt: null == minVolt
          ? _value.minVolt
          : minVolt // ignore: cast_nullable_to_non_nullable
              as String,
      minCurrent: null == minCurrent
          ? _value.minCurrent
          : minCurrent // ignore: cast_nullable_to_non_nullable
              as String,
      maxCurrent: null == maxCurrent
          ? _value.maxCurrent
          : maxCurrent // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValsEntityImpl implements _ValsEntity {
  const _$ValsEntityImpl(
      {@JsonKey(name: 'off_time') required this.offTime,
      @JsonKey(name: 'min_volt') required this.minVolt,
      @JsonKey(name: 'min_current') required this.minCurrent,
      @JsonKey(name: 'max_current') required this.maxCurrent});

  factory _$ValsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValsEntityImplFromJson(json);

  @override
  @JsonKey(name: 'off_time')
  final String offTime;
  @override
  @JsonKey(name: 'min_volt')
  final String minVolt;
  @override
  @JsonKey(name: 'min_current')
  final String minCurrent;
  @override
  @JsonKey(name: 'max_current')
  final String maxCurrent;

  @override
  String toString() {
    return 'ValsEntity(offTime: $offTime, minVolt: $minVolt, minCurrent: $minCurrent, maxCurrent: $maxCurrent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValsEntityImpl &&
            (identical(other.offTime, offTime) || other.offTime == offTime) &&
            (identical(other.minVolt, minVolt) || other.minVolt == minVolt) &&
            (identical(other.minCurrent, minCurrent) ||
                other.minCurrent == minCurrent) &&
            (identical(other.maxCurrent, maxCurrent) ||
                other.maxCurrent == maxCurrent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, offTime, minVolt, minCurrent, maxCurrent);

  /// Create a copy of ValsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValsEntityImplCopyWith<_$ValsEntityImpl> get copyWith =>
      __$$ValsEntityImplCopyWithImpl<_$ValsEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValsEntityImplToJson(
      this,
    );
  }
}

abstract class _ValsEntity implements ValsEntity {
  const factory _ValsEntity(
          {@JsonKey(name: 'off_time') required final String offTime,
          @JsonKey(name: 'min_volt') required final String minVolt,
          @JsonKey(name: 'min_current') required final String minCurrent,
          @JsonKey(name: 'max_current') required final String maxCurrent}) =
      _$ValsEntityImpl;

  factory _ValsEntity.fromJson(Map<String, dynamic> json) =
      _$ValsEntityImpl.fromJson;

  @override
  @JsonKey(name: 'off_time')
  String get offTime;
  @override
  @JsonKey(name: 'min_volt')
  String get minVolt;
  @override
  @JsonKey(name: 'min_current')
  String get minCurrent;
  @override
  @JsonKey(name: 'max_current')
  String get maxCurrent;

  /// Create a copy of ValsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValsEntityImplCopyWith<_$ValsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
