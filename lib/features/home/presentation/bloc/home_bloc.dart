import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oflow/features/home/presentation/bloc/home_state.dart';

import '../../../../core/utils/local_storage/local_storage.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState.initial());

  void loadDevices() {
    emit(HomeState.loading());
    final deviceList =
        LocalStorage.instance.getStringList("devices") ?? <String>[];
    emit(
      HomeState(
        status: HomeStateStatus.data,
        deviceList: deviceList,
      ),
    );
  }

  void deleteDevice(String device) {
    emit(HomeState.loading());
    final deviceList =
        LocalStorage.instance.getStringList("devices") ?? <String>[];
    deviceList.remove(device);
    LocalStorage.instance.saveStringList("devices", deviceList);
    emit(
      HomeState(
        status: HomeStateStatus.data,
        deviceList: deviceList,
      ),
    );
  }
}
