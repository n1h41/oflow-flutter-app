// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../pow_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PowEntity _$PowEntityFromJson(Map<String, dynamic> json) {
  return _PowEntity.fromJson(json);
}

/// @nodoc
mixin _$PowEntity {
  int get v => throw _privateConstructorUsedError;
  int get a => throw _privateConstructorUsedError;

  /// Serializes this PowEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PowEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PowEntityCopyWith<PowEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PowEntityCopyWith<$Res> {
  factory $PowEntityCopyWith(PowEntity value, $Res Function(PowEntity) then) =
      _$PowEntityCopyWithImpl<$Res, PowEntity>;
  @useResult
  $Res call({int v, int a});
}

/// @nodoc
class _$PowEntityCopyWithImpl<$Res, $Val extends PowEntity>
    implements $PowEntityCopyWith<$Res> {
  _$PowEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PowEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
    Object? a = null,
  }) {
    return _then(_value.copyWith(
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
      a: null == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PowEntityImplCopyWith<$Res>
    implements $PowEntityCopyWith<$Res> {
  factory _$$PowEntityImplCopyWith(
          _$PowEntityImpl value, $Res Function(_$PowEntityImpl) then) =
      __$$PowEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int v, int a});
}

/// @nodoc
class __$$PowEntityImplCopyWithImpl<$Res>
    extends _$PowEntityCopyWithImpl<$Res, _$PowEntityImpl>
    implements _$$PowEntityImplCopyWith<$Res> {
  __$$PowEntityImplCopyWithImpl(
      _$PowEntityImpl _value, $Res Function(_$PowEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PowEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
    Object? a = null,
  }) {
    return _then(_$PowEntityImpl(
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
      a: null == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PowEntityImpl implements _PowEntity {
  const _$PowEntityImpl({required this.v, required this.a});

  factory _$PowEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PowEntityImplFromJson(json);

  @override
  final int v;
  @override
  final int a;

  @override
  String toString() {
    return 'PowEntity(v: $v, a: $a)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PowEntityImpl &&
            (identical(other.v, v) || other.v == v) &&
            (identical(other.a, a) || other.a == a));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, v, a);

  /// Create a copy of PowEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PowEntityImplCopyWith<_$PowEntityImpl> get copyWith =>
      __$$PowEntityImplCopyWithImpl<_$PowEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PowEntityImplToJson(
      this,
    );
  }
}

abstract class _PowEntity implements PowEntity {
  const factory _PowEntity({required final int v, required final int a}) =
      _$PowEntityImpl;

  factory _PowEntity.fromJson(Map<String, dynamic> json) =
      _$PowEntityImpl.fromJson;

  @override
  int get v;
  @override
  int get a;

  /// Create a copy of PowEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PowEntityImplCopyWith<_$PowEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
