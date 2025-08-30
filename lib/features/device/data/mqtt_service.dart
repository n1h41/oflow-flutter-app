import 'dart:async';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:mqtt5_client/mqtt5_client.dart';
import 'package:oflow/features/device/data/mqtt_client_factory.dart';
import '../../../../core/utils/helpers/logger.dart';
import '../../../../core/utils/helpers/aws_helpers.dart';

/// Enhanced MQTT Service for AWS IoT using SigV4-signed WebSocket URL.
/// No username/password is used; authentication is via the signed URL.
/// See AWS IoT docs: https://docs.aws.amazon.com/iot/latest/developerguide/protocols.html
class MqttService {
  MqttClient? _client;
  final StreamController<MqttConnectionState> _connectionStateController =
      StreamController.broadcast();
  final StreamController<MqttReceivedMessage> _messageController =
      StreamController.broadcast();
  final Map<String, StreamController<String>> _topicStreams = {};
  final List<MqttSubscription> _subscriptions = [];

  String? _currentDeviceId;
  bool _isInitialized = false;

  Stream<MqttConnectionState> get connectionStateStream =>
      _connectionStateController.stream;
  Stream<MqttReceivedMessage> get messageStream => _messageController.stream;

  String? get currentDeviceId => _currentDeviceId;

  bool get isConnected {
    if (_client == null) return false;
    return _client!.connectionStatus?.state == MqttConnectionState.connected;
  }

  bool get isInitialized => _isInitialized;

  /// Initialize MQTT client with AWS Cognito session
  /// This replaces the old constructor and allows for proper DI
  Future<void> initialize(AuthSession session) async {
    AppLogger.instance.i(
        'MqttService.initialize called - isInitialized: $_isInitialized, client exists: ${_client != null}');

    if (_isInitialized && _client != null) {
      AppLogger.instance
          .w('MQTT Service already initialized and client exists - skipping');
      return;
    }

    // If we have an existing client, disconnect it first
    if (_client != null) {
      AppLogger.instance
          .i('Disconnecting existing MQTT client before re-initialization');
      _cleanupClient();
    }

    AppLogger.instance.i('Creating new MQTT client');
    await _configureClientFromSession(session);
    _isInitialized = true;
    AppLogger.instance.i('MQTT client initialization completed');
  }

  /// Configure MQTT client from AWS session
  Future<void> _configureClientFromSession(AuthSession authSession) async {
    const port = 443;
    const region = 'us-east-1';
    const baseUrl = 'a82k06ko9a2kk-ats.iot.$region.amazonaws.com';
    const scheme = 'wss://';
    const urlPath = '/mqtt';

    // Get the Cognito plugin to access AWS credentials
    final cognitoPlugin = Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
    final cognitoSession = await cognitoPlugin.fetchAuthSession();

    // Extract credentials with proper error handling
    AWSCredentials? credentials;
    String? identityId;

    try {
      credentials = cognitoSession.credentialsResult.value;
    } catch (e) {
      AppLogger.instance.e('Failed to retrieve credentials: $e');
      throw StateError('Failed to retrieve AWS credentials: $e');
    }

    try {
      identityId = cognitoSession.identityIdResult.value;
    } catch (e) {
      AppLogger.instance.e('Failed to retrieve identity ID: $e');
      throw StateError('Failed to retrieve identity ID: $e');
    }

    if (credentials.sessionToken == null) {
      throw StateError('Session token is required for AWS IoT connection');
    }

    final signedUrl = getWebSocketURL(
      accessKey: credentials.accessKeyId,
      secretKey: credentials.secretAccessKey,
      sessionToken: credentials.sessionToken!,
      region: region,
      scheme: scheme,
      endpoint: baseUrl,
      urlPath: urlPath,
    );

    _client = createMqttClient(signedUrl, identityId, port);
    _configureClient(identityId);
  }

  /// Set current device ID for topic management
  void setDeviceId(String deviceId) {
    _currentDeviceId = deviceId;
  }

  void _configureClient(String clientId) {
    if (_client == null) return;

    _client!.logging(on: false);
    _client!.autoReconnect = true;
    _client!.disconnectOnNoResponsePeriod = 90;
    _client!.keepAlivePeriod = 30;

    final connMess =
        MqttConnectMessage().withClientIdentifier(clientId).startClean();

    _client!.connectionMessage = connMess;
    // Removed automatic connect - will be called explicitly via connect() method
  }

  void _setupListeners() {
    if (_client == null) return;

    _client!.updates.listen((List<MqttReceivedMessage> messages) {
      for (var msg in messages) {
        _messageController.add(msg);

        // Route messages to topic-specific streams
        final topic = msg.topic;
        if (topic != null) {
          final topicSuffix = topic.split('/').last;
          if (_topicStreams.containsKey(topicSuffix)) {
            final messageString = convertMsgFromBytesToString(msg);
            _topicStreams[topicSuffix]!.add(messageString);
          }
        }
      }
    });

    _client!.onConnected = () {
      AppLogger.instance.i('MQTT Connected');
      _connectionStateController.add(MqttConnectionState.connected);
    };
    _client!.onDisconnected = () {
      AppLogger.instance.i('MQTT Disconnected');
      _connectionStateController.add(MqttConnectionState.disconnected);
    };
    _client!.onAutoReconnect = () {
      AppLogger.instance.i('MQTT Auto-reconnect');
      _connectionStateController.add(MqttConnectionState.connecting);
    };
    _client!.onAutoReconnected = () {
      AppLogger.instance.i('MQTT Auto-reconnected');
      _connectionStateController.add(MqttConnectionState.connected);
    };
    _client!.onFailedConnectionAttempt = (attempt) {
      AppLogger.instance.i('MQTT Failed connection attempt: $attempt');
      _connectionStateController.add(MqttConnectionState.disconnected);
    };
    _client!.onSubscribeFail = (topic) {
      AppLogger.instance.e('Failed to subscribe to $topic');
    };
  }

  /// Connects to AWS IoT MQTT broker using the signed WebSocket URL.
  /// No username/password is required or used.
  Future<void> connect() async {
    if (!_isInitialized || _client == null) {
      throw StateError(
          'MQTT Service not initialized. Call initialize() first.');
    }

    try {
      final status = await _client!.connect();
      AppLogger.instance.i("MQTT Connection Status: $status");
      _setupListeners();
      _connectionStateController.add(
          _client!.connectionStatus?.state ?? MqttConnectionState.disconnected);
    } on MqttNoConnectionException catch (e) {
      AppLogger.instance.e('MQTT client exception - $e');
      _client?.disconnect();
      _connectionStateController.add(MqttConnectionState.disconnected);
      rethrow;
    } on Exception catch (e) {
      AppLogger.instance.e('MQTT connection error - $e');
      _client?.disconnect();
      _connectionStateController.add(MqttConnectionState.disconnected);
      rethrow;
    }
  }

  void disconnect() {
    _client?.disconnect();
    _connectionStateController.add(MqttConnectionState.disconnected);
  }

  void subscribe(String topic, [MqttQos qosLevel = MqttQos.atLeastOnce]) {
    if (_client == null) {
      AppLogger.instance.w('Cannot subscribe: MQTT client not initialized');
      return;
    }

    final subscription = _client!.subscribe(topic, qosLevel);
    if (subscription != null) {
      AppLogger.instance.i('Subscribed to topic: $topic');
      _subscriptions.add(subscription);
    }
  }

  /// Subscribe to a device-specific topic and get a stream of messages
  Stream<String> subscribeToDeviceTopic(String topicSuffix,
      [MqttQos qosLevel = MqttQos.atLeastOnce]) {
    if (_currentDeviceId == null) {
      throw StateError('Device ID not set. Call setDeviceId() first.');
    }

    final fullTopic = '$_currentDeviceId/$topicSuffix';

    // Create stream controller for this topic if it doesn't exist
    if (!_topicStreams.containsKey(topicSuffix)) {
      _topicStreams[topicSuffix] = StreamController<String>.broadcast();
    }

    subscribe(fullTopic, qosLevel);
    return _topicStreams[topicSuffix]!.stream;
  }

  /// Get stream for a specific topic (must be subscribed first)
  Stream<String>? getTopicStream(String topicSuffix) {
    return _topicStreams[topicSuffix]?.stream;
  }

  Future<void> unsubscribeFromAllTopics() async {
    if (_subscriptions.isEmpty || _client == null) return;
    for (var sub in _subscriptions) {
      AppLogger.instance.i('Unsubscribing from topic: ${sub.topic.rawTopic}');
      _client!.unsubscribeStringTopic(sub.topic.rawTopic!);
      // Small delay to avoid overwhelming the broker
      await MqttUtilities.asyncSleep(2);
    }
    _subscriptions.clear();
  }

  void publish(String topic, String message,
      {MqttQos qosLevel = MqttQos.atMostOnce, bool retain = true}) {
    if (_client == null) {
      AppLogger.instance.w('Cannot publish: MQTT client not initialized');
      return;
    }

    final builder = MqttPayloadBuilder();
    builder.addString(message);

    final msgIdentifier = _client!.publishMessage(
      topic,
      qosLevel,
      builder.payload!,
      retain: retain,
    );
    AppLogger.instance
        .i('Publishing message to $topic: $message with id $msgIdentifier');
  }

  /// Publish to a device-specific topic
  void publishToDeviceTopic(String topicSuffix, String message,
      {MqttQos qosLevel = MqttQos.atMostOnce, bool retain = true}) {
    if (_currentDeviceId == null) {
      throw StateError('Device ID not set. Call setDeviceId() first.');
    }

    final fullTopic = '$_currentDeviceId/$topicSuffix';
    publish(fullTopic, message, qosLevel: qosLevel, retain: retain);
  }

  /// Utility to convert MQTT message bytes to string
  static String convertMsgFromBytesToString(MqttReceivedMessage message) {
    MqttPublishMessage msg = message.payload as MqttPublishMessage;
    final msgString = MqttUtilities.bytesToStringAsString(msg.payload.message!);
    return msgString;
  }

  /// Clean up existing client and connections
  void _cleanupClient() {
    if (_client != null) {
      unsubscribeFromAllTopics();
      _client!.disconnect();
      _client = null;
    }

    // Close all topic streams
    for (var controller in _topicStreams.values) {
      controller.close();
    }
    _topicStreams.clear();

    _connectionStateController.add(MqttConnectionState.disconnected);
    _isInitialized = false;
  }

  void dispose() {
    _cleanupClient();
    _connectionStateController.close();
    _messageController.close();
  }
}
