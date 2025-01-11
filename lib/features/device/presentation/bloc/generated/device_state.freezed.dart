// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../device_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeviceState {
  DeviceStateStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;
  List<int> get deviceHistoryDatalist => throw _privateConstructorUsedError;
  DeviceStatusEntity? get deviceStatus => throw _privateConstructorUsedError;
  PowEntity? get devicePowerDetails => throw _privateConstructorUsedError;
  ValsEntity? get deviceValueDetails => throw _privateConstructorUsedError;
  String? get deviceMac => throw _privateConstructorUsedError;
  List<MqttSubscription> get subscriptions =>
      throw _privateConstructorUsedError;

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceStateCopyWith<DeviceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceStateCopyWith<$Res> {
  factory $DeviceStateCopyWith(
          DeviceState value, $Res Function(DeviceState) then) =
      _$DeviceStateCopyWithImpl<$Res, DeviceState>;
  @useResult
  $Res call(
      {DeviceStateStatus status,
      String? errorMessage,
      Failure? error,
      List<int> deviceHistoryDatalist,
      DeviceStatusEntity? deviceStatus,
      PowEntity? devicePowerDetails,
      ValsEntity? deviceValueDetails,
      String? deviceMac,
      List<MqttSubscription> subscriptions});

  $DeviceStatusEntityCopyWith<$Res>? get deviceStatus;
  $PowEntityCopyWith<$Res>? get devicePowerDetails;
  $ValsEntityCopyWith<$Res>? get deviceValueDetails;
}

/// @nodoc
class _$DeviceStateCopyWithImpl<$Res, $Val extends DeviceState>
    implements $DeviceStateCopyWith<$Res> {
  _$DeviceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? error = freezed,
    Object? deviceHistoryDatalist = null,
    Object? deviceStatus = freezed,
    Object? devicePowerDetails = freezed,
    Object? deviceValueDetails = freezed,
    Object? deviceMac = freezed,
    Object? subscriptions = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeviceStateStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      deviceHistoryDatalist: null == deviceHistoryDatalist
          ? _value.deviceHistoryDatalist
          : deviceHistoryDatalist // ignore: cast_nullable_to_non_nullable
              as List<int>,
      deviceStatus: freezed == deviceStatus
          ? _value.deviceStatus
          : deviceStatus // ignore: cast_nullable_to_non_nullable
              as DeviceStatusEntity?,
      devicePowerDetails: freezed == devicePowerDetails
          ? _value.devicePowerDetails
          : devicePowerDetails // ignore: cast_nullable_to_non_nullable
              as PowEntity?,
      deviceValueDetails: freezed == deviceValueDetails
          ? _value.deviceValueDetails
          : deviceValueDetails // ignore: cast_nullable_to_non_nullable
              as ValsEntity?,
      deviceMac: freezed == deviceMac
          ? _value.deviceMac
          : deviceMac // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptions: null == subscriptions
          ? _value.subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<MqttSubscription>,
    ) as $Val);
  }

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceStatusEntityCopyWith<$Res>? get deviceStatus {
    if (_value.deviceStatus == null) {
      return null;
    }

    return $DeviceStatusEntityCopyWith<$Res>(_value.deviceStatus!, (value) {
      return _then(_value.copyWith(deviceStatus: value) as $Val);
    });
  }

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PowEntityCopyWith<$Res>? get devicePowerDetails {
    if (_value.devicePowerDetails == null) {
      return null;
    }

    return $PowEntityCopyWith<$Res>(_value.devicePowerDetails!, (value) {
      return _then(_value.copyWith(devicePowerDetails: value) as $Val);
    });
  }

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ValsEntityCopyWith<$Res>? get deviceValueDetails {
    if (_value.deviceValueDetails == null) {
      return null;
    }

    return $ValsEntityCopyWith<$Res>(_value.deviceValueDetails!, (value) {
      return _then(_value.copyWith(deviceValueDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeviceStateImplCopyWith<$Res>
    implements $DeviceStateCopyWith<$Res> {
  factory _$$DeviceStateImplCopyWith(
          _$DeviceStateImpl value, $Res Function(_$DeviceStateImpl) then) =
      __$$DeviceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DeviceStateStatus status,
      String? errorMessage,
      Failure? error,
      List<int> deviceHistoryDatalist,
      DeviceStatusEntity? deviceStatus,
      PowEntity? devicePowerDetails,
      ValsEntity? deviceValueDetails,
      String? deviceMac,
      List<MqttSubscription> subscriptions});

  @override
  $DeviceStatusEntityCopyWith<$Res>? get deviceStatus;
  @override
  $PowEntityCopyWith<$Res>? get devicePowerDetails;
  @override
  $ValsEntityCopyWith<$Res>? get deviceValueDetails;
}

/// @nodoc
class __$$DeviceStateImplCopyWithImpl<$Res>
    extends _$DeviceStateCopyWithImpl<$Res, _$DeviceStateImpl>
    implements _$$DeviceStateImplCopyWith<$Res> {
  __$$DeviceStateImplCopyWithImpl(
      _$DeviceStateImpl _value, $Res Function(_$DeviceStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? error = freezed,
    Object? deviceHistoryDatalist = null,
    Object? deviceStatus = freezed,
    Object? devicePowerDetails = freezed,
    Object? deviceValueDetails = freezed,
    Object? deviceMac = freezed,
    Object? subscriptions = null,
  }) {
    return _then(_$DeviceStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeviceStateStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      deviceHistoryDatalist: null == deviceHistoryDatalist
          ? _value._deviceHistoryDatalist
          : deviceHistoryDatalist // ignore: cast_nullable_to_non_nullable
              as List<int>,
      deviceStatus: freezed == deviceStatus
          ? _value.deviceStatus
          : deviceStatus // ignore: cast_nullable_to_non_nullable
              as DeviceStatusEntity?,
      devicePowerDetails: freezed == devicePowerDetails
          ? _value.devicePowerDetails
          : devicePowerDetails // ignore: cast_nullable_to_non_nullable
              as PowEntity?,
      deviceValueDetails: freezed == deviceValueDetails
          ? _value.deviceValueDetails
          : deviceValueDetails // ignore: cast_nullable_to_non_nullable
              as ValsEntity?,
      deviceMac: freezed == deviceMac
          ? _value.deviceMac
          : deviceMac // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptions: null == subscriptions
          ? _value._subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<MqttSubscription>,
    ));
  }
}

/// @nodoc

class _$DeviceStateImpl implements _DeviceState {
  const _$DeviceStateImpl(
      {required this.status,
      this.errorMessage,
      this.error,
      final List<int> deviceHistoryDatalist = const [],
      this.deviceStatus,
      this.devicePowerDetails,
      this.deviceValueDetails,
      this.deviceMac,
      final List<MqttSubscription> subscriptions = const []})
      : _deviceHistoryDatalist = deviceHistoryDatalist,
        _subscriptions = subscriptions;

  @override
  final DeviceStateStatus status;
  @override
  final String? errorMessage;
  @override
  final Failure? error;
  final List<int> _deviceHistoryDatalist;
  @override
  @JsonKey()
  List<int> get deviceHistoryDatalist {
    if (_deviceHistoryDatalist is EqualUnmodifiableListView)
      return _deviceHistoryDatalist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deviceHistoryDatalist);
  }

  @override
  final DeviceStatusEntity? deviceStatus;
  @override
  final PowEntity? devicePowerDetails;
  @override
  final ValsEntity? deviceValueDetails;
  @override
  final String? deviceMac;
  final List<MqttSubscription> _subscriptions;
  @override
  @JsonKey()
  List<MqttSubscription> get subscriptions {
    if (_subscriptions is EqualUnmodifiableListView) return _subscriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subscriptions);
  }

  @override
  String toString() {
    return 'DeviceState(status: $status, errorMessage: $errorMessage, error: $error, deviceHistoryDatalist: $deviceHistoryDatalist, deviceStatus: $deviceStatus, devicePowerDetails: $devicePowerDetails, deviceValueDetails: $deviceValueDetails, deviceMac: $deviceMac, subscriptions: $subscriptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._deviceHistoryDatalist, _deviceHistoryDatalist) &&
            (identical(other.deviceStatus, deviceStatus) ||
                other.deviceStatus == deviceStatus) &&
            (identical(other.devicePowerDetails, devicePowerDetails) ||
                other.devicePowerDetails == devicePowerDetails) &&
            (identical(other.deviceValueDetails, deviceValueDetails) ||
                other.deviceValueDetails == deviceValueDetails) &&
            (identical(other.deviceMac, deviceMac) ||
                other.deviceMac == deviceMac) &&
            const DeepCollectionEquality()
                .equals(other._subscriptions, _subscriptions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      errorMessage,
      error,
      const DeepCollectionEquality().hash(_deviceHistoryDatalist),
      deviceStatus,
      devicePowerDetails,
      deviceValueDetails,
      deviceMac,
      const DeepCollectionEquality().hash(_subscriptions));

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceStateImplCopyWith<_$DeviceStateImpl> get copyWith =>
      __$$DeviceStateImplCopyWithImpl<_$DeviceStateImpl>(this, _$identity);
}

abstract class _DeviceState implements DeviceState {
  const factory _DeviceState(
      {required final DeviceStateStatus status,
      final String? errorMessage,
      final Failure? error,
      final List<int> deviceHistoryDatalist,
      final DeviceStatusEntity? deviceStatus,
      final PowEntity? devicePowerDetails,
      final ValsEntity? deviceValueDetails,
      final String? deviceMac,
      final List<MqttSubscription> subscriptions}) = _$DeviceStateImpl;

  @override
  DeviceStateStatus get status;
  @override
  String? get errorMessage;
  @override
  Failure? get error;
  @override
  List<int> get deviceHistoryDatalist;
  @override
  DeviceStatusEntity? get deviceStatus;
  @override
  PowEntity? get devicePowerDetails;
  @override
  ValsEntity? get deviceValueDetails;
  @override
  String? get deviceMac;
  @override
  List<MqttSubscription> get subscriptions;

  /// Create a copy of DeviceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceStateImplCopyWith<_$DeviceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
