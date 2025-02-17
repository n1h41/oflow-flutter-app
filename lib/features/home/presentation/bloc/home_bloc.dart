import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oflow/core/utils/popup/loaders.dart';
import 'package:oflow/features/home/domain/repository/repository.dart';
import 'package:oflow/features/home/presentation/bloc/home_state.dart';

import '../../../../core/utils/local_storage/local_storage.dart';

class HomeBloc extends Cubit<HomeState> {
  final HomeRepository repository;
  final GoRouter router;

  HomeBloc({
    required this.repository,
    required this.router,
  }) : super(HomeState.initial());

  void loadDevices() {
    emit(state.copyWith(status: HomeStateStatus.loading));
    final deviceList =
        LocalStorage.instance.getStringList("devices") ?? <String>[];
    emit(
      state.copyWith(
        status: HomeStateStatus.data,
        deviceList: deviceList,
      ),
    );
  }

  void deleteDevice(String device) {
    emit(state.copyWith(status: HomeStateStatus.loading));
    final deviceList =
        LocalStorage.instance.getStringList("devices") ?? <String>[];
    deviceList.remove(device);
    LocalStorage.instance.saveStringList("devices", deviceList);
    emit(
      state.copyWith(status: HomeStateStatus.data, deviceList: deviceList),
    );
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
}
