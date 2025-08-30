// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  HomeStateStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;
  List<DeviceEntity> get deviceList => throw _privateConstructorUsedError;
  bool get isMqttConnected => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {HomeStateStatus status,
      String? errorMessage,
      Failure? error,
      List<DeviceEntity> deviceList,
      bool isMqttConnected});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? error = freezed,
    Object? deviceList = null,
    Object? isMqttConnected = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomeStateStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      deviceList: null == deviceList
          ? _value.deviceList
          : deviceList // ignore: cast_nullable_to_non_nullable
              as List<DeviceEntity>,
      isMqttConnected: null == isMqttConnected
          ? _value.isMqttConnected
          : isMqttConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HomeStateStatus status,
      String? errorMessage,
      Failure? error,
      List<DeviceEntity> deviceList,
      bool isMqttConnected});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? error = freezed,
    Object? deviceList = null,
    Object? isMqttConnected = null,
  }) {
    return _then(_$HomeStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomeStateStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      deviceList: null == deviceList
          ? _value._deviceList
          : deviceList // ignore: cast_nullable_to_non_nullable
              as List<DeviceEntity>,
      isMqttConnected: null == isMqttConnected
          ? _value.isMqttConnected
          : isMqttConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {required this.status,
      this.errorMessage,
      this.error,
      final List<DeviceEntity> deviceList = const [],
      this.isMqttConnected = false})
      : _deviceList = deviceList;

  @override
  final HomeStateStatus status;
  @override
  final String? errorMessage;
  @override
  final Failure? error;
  final List<DeviceEntity> _deviceList;
  @override
  @JsonKey()
  List<DeviceEntity> get deviceList {
    if (_deviceList is EqualUnmodifiableListView) return _deviceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deviceList);
  }

  @override
  @JsonKey()
  final bool isMqttConnected;

  @override
  String toString() {
    return 'HomeState(status: $status, errorMessage: $errorMessage, error: $error, deviceList: $deviceList, isMqttConnected: $isMqttConnected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._deviceList, _deviceList) &&
            (identical(other.isMqttConnected, isMqttConnected) ||
                other.isMqttConnected == isMqttConnected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage, error,
      const DeepCollectionEquality().hash(_deviceList), isMqttConnected);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final HomeStateStatus status,
      final String? errorMessage,
      final Failure? error,
      final List<DeviceEntity> deviceList,
      final bool isMqttConnected}) = _$HomeStateImpl;

  @override
  HomeStateStatus get status;
  @override
  String? get errorMessage;
  @override
  Failure? get error;
  @override
  List<DeviceEntity> get deviceList;
  @override
  bool get isMqttConnected;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
