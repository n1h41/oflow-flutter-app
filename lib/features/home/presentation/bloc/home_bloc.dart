import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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

  HomeBloc({
    required this.repository,
    required this.router,
  }) : super(HomeState.initial());

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
}
