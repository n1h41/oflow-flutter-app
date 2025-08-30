import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mqtt5_client/mqtt5_client.dart';
import 'package:oflow/core/constants/exceptions/failure.dart';
import 'package:oflow/core/utils/helpers/logger.dart';
import 'package:oflow/features/device/data/mqtt_service.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/utils/local_storage/local_storage.dart';
import '../../../../core/utils/popup/loaders.dart';
import '../../../device/domain/entity/device_entity.dart';
import '../../domain/repository/repository.dart';
import 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  final HomeRepository repository;
  final GoRouter router;
  final MqttService _mqttService;

  HomeBloc({
    required this.repository,
    required this.router,
    required MqttService mqttService,
  })  : _mqttService = mqttService,
        super(HomeState.initial());

  StreamSubscription<MqttConnectionState>? _connectionSubscription;

  Future<void> initMqttClient(AuthSession session) async {
    AppLogger.instance.i(
        'Initializing MQTT client - isConnected: ${_mqttService.isConnected}, isInitialized: ${_mqttService.isInitialized}');
    // emit(state.copyWith(status: DeviceStateStatus.loading));

    // Only initialize if not already connected
    if (_mqttService.isConnected) {
      AppLogger.instance
          .i('MQTT client already connected, skipping initialization');
      emit(state.copyWith(
        isMqttConnected: true,
        status: HomeStateStatus.data,
      ));
      return;
    }

    await configMqttClient(session);
  }

  Future<void> configMqttClient(AuthSession authSession) async {
    try {
      // Initialize MQTT service
      await _mqttService.initialize(authSession);

      // Set up connection state listener
      _connectionSubscription = _mqttService.connectionStateStream.listen(
        (connectionState) {
          final isConnected = connectionState == MqttConnectionState.connected;
          AppLogger.instance
              .i('MQTT connection state changed: $connectionState');
          emit(state.copyWith(
            isMqttConnected: isConnected,
            status:
                isConnected ? HomeStateStatus.data : HomeStateStatus.loading,
          ));
        },
      );

      // Connect to MQTT broker
      await _mqttService.connect();
    } catch (e) {
      AppLogger.instance.e('Failed to initialize MQTT client: $e');

      Failure failure;
      if (e is SocketException) {
        failure = NoNetworkFailure();
      } else {
        failure = ServerFailure(message: "MQTT initialization error: $e");
      }

      emit(state.copyWith(
        status: HomeStateStatus.error,
        errorMessage: 'Failed to initialize MQTT client: $e',
        error: failure,
      ));
    }
  }

  Future<void> addDevice(String macAddress, String deviceName) async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    var uuid = const Uuid();
    macAddress = macAddress.trim();
    macAddress = macAddress.toUpperCase();
    final DeviceEntity newDevice = DeviceEntity(
      id: uuid.v4(),
      name: deviceName,
      macAddress: macAddress,
      type: DeviceType.pump,
    );
    final deviceList =
        LocalStorage.instance.getStringList("devices") ?? <String>[];
    deviceList.add(jsonEncode(newDevice.toJson()));
    await LocalStorage.instance.saveStringList("devices", deviceList);
    emit(
      state.copyWith(
        status: HomeStateStatus.data,
        deviceList: deviceList
            .map<DeviceEntity>(
                (item) => DeviceEntity.fromJson(jsonDecode(item)))
            .toList(),
      ),
    );
  }

  void loadDevices() {
    emit(state.copyWith(status: HomeStateStatus.loading));
    final deviceList =
        LocalStorage.instance.getStringList("devices") ?? <String>[];
    emit(
      state.copyWith(
        status: HomeStateStatus.data,
        deviceList: deviceList
            .map<DeviceEntity>(
                (item) => DeviceEntity.fromJson(jsonDecode(item)))
            .toList(),
      ),
    );
  }

  void deleteDevice(String macAddress) {
    emit(state.copyWith(status: HomeStateStatus.loading));
    List<DeviceEntity> deviceList = LocalStorage.instance
            .getStringList("devices")
            ?.map<DeviceEntity>(
                (item) => DeviceEntity.fromJson(jsonDecode(item)))
            .toList() ??
        <DeviceEntity>[];
    deviceList.removeWhere((element) => element.macAddress == macAddress);
    LocalStorage.instance.saveStringList(
      "devices",
      deviceList.map((e) => jsonEncode(e.toJson())).toList(),
    );
    emit(
      state.copyWith(
        status: HomeStateStatus.data,
        deviceList: deviceList,
      ),
    );
  }

  void deleteAllDevices() {
    emit(state.copyWith(status: HomeStateStatus.loading));
    LocalStorage.instance.saveStringList("devices", <String>[]);
    emit(state
        .copyWith(status: HomeStateStatus.data, deviceList: <DeviceEntity>[]));
  }

  Future<void> attachIotPolicyToIdentity({
    required String identityId,
    required String policyName,
  }) async {
    final policyAttachStatus = LocalStorage.instance.getBool("policyAttached");
    if (policyAttachStatus != null && policyAttachStatus) {
      return;
    }
    emit(state.copyWith(status: HomeStateStatus.loading));
    final result =
        await repository.attachIotPolicyToIdentity(identityId, policyName);
    result.fold(
      (error) => emit(HomeState.error(error)),
      (data) {
        LocalStorage.instance.saveBool("policyAttached", true);
        final context = router.routerDelegate.navigatorKey.currentContext;
        if (context != null) {
          KLoaders.customToast(
            router.routerDelegate.navigatorKey.currentContext!,
            message: "Policy attached successfully",
          );
        }
        emit(
          state.copyWith(
            status: HomeStateStatus.data,
          ),
        );
      },
    );
  }

  Future<void> clearPolicyAttachedFlag() async {
    await LocalStorage.instance.saveBool("policyAttached", false);
  }

  @override
  Future<void> close() {
    _connectionSubscription?.cancel();
    _mqttService.disconnect();
    return super.close();
  }
}
