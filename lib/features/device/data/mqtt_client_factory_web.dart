import 'package:mqtt5_client/mqtt5_browser_client.dart';

MqttBrowserClient createMqttClient(String url, String clientId, int port) {
  return MqttBrowserClient.withPort(url, clientId, port);
}
