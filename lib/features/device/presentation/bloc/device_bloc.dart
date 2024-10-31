import 'package:flutter_bloc/flutter_bloc.dart';

import 'device_state.dart';

class DeviceBloc extends Cubit<DeviceState> {
  DeviceBloc() : super(DeviceState.initial());
}
