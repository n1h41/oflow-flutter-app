import 'package:mqtt5_client/mqtt5_server_client.dart';

MqttServerClient createMqttClient(String url, String clientId, int port) {
  final client = MqttServerClient.withPort(url, clientId, port);
  client.useWebSocket = true;
  client.secure = false;
  return client;
}
