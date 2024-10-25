import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mqtt5_client/mqtt5_server_client.dart';

import 'device_state.dart';

class DeviceBloc extends Cubit<DeviceState> {
  late final MqttServerClient client;

  DeviceBloc() : super(const DeviceState());

  void configureClient() {
    client.logging(on: false);
    client.useWebSocket = true;
    client.secure = false;
    client.autoReconnect = true;
    client.disconnectOnNoResponsePeriod = 90;
    client.keepAlivePeriod = 30;
  }
}
