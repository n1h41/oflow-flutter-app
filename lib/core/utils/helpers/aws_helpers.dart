/*
 * Package : mqtt_client
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 21/04/2022
 * Copyright :  S.Hamblett
 *
 */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mqtt5_client/mqtt5_server_client.dart';
import 'package:mqtt5_client/mqtt5_client.dart';

import 'sigv4.dart';

/// An example of connecting to the AWS IoT Core MQTT broker and publishing to a devices topic.
/// This example uses MQTT over Websockets with AWS IAM Credentials
/// This is a proven working example, but it requires some preparation. You will need to get Cognito credentials from somewhere, and your IAM policies set up properly.
/// The first two functions are helpers, please look at the main() for the client setup
/// More instructions can be found at https://docs.aws.amazon.com/iot/latest/developerguide/mqtt.html and
/// https://docs.aws.amazon.com/iot/latest/developerguide/protocols.html, please read this
/// before setting up and running this example.

/// Note the dependency on the http package has been removed from the client, as such lines below
/// depending on this are commented out. If you wish to run this example please re add package http
/// at version 1.2.1 to the pubspec.yaml and uncomment lines starting with HTTP.

// This function is based on the one from package flutter-aws-iot, but adapted slightly

String getWebSocketURL(
    {required String accessKey,
    required String secretKey,
    required String sessionToken,
    required String region,
    required String scheme,
    required String endpoint,
    required String urlPath}) {
  const serviceName = 'iotdevicegateway';
  const awsS4Request = 'aws4_request';
  const aws4HmacSha256 = 'AWS4-HMAC-SHA256';
  var now = Sigv4.generateDatetime();

  var creds = [
    accessKey,
    now.substring(0, 8),
    region,
    serviceName,
    awsS4Request,
  ];

  var queryParams = {
    'X-Amz-Algorithm': aws4HmacSha256,
    'X-Amz-Credential': creds.join('/'),
    'X-Amz-Date': now,
    'X-Amz-SignedHeaders': 'host',
  };

  var canonicalQueryString = Sigv4.buildCanonicalQueryString(queryParams);

  var request = Sigv4.buildCanonicalRequest(
    'GET',
    urlPath,
    queryParams,
    {'host': endpoint},
    '',
  );

  var hashedCanonicalRequest = Sigv4.hashPayload(request);
  var stringToSign = Sigv4.buildStringToSign(
    now,
    Sigv4.buildCredentialScope(now, region, serviceName),
    hashedCanonicalRequest,
  );

  var signingKey = Sigv4.calculateSigningKey(
    secretKey,
    now,
    region,
    serviceName,
  );

  var signature = Sigv4.calculateSignature(signingKey, stringToSign);

  var finalParams =
      '$canonicalQueryString&X-Amz-Signature=$signature&X-Amz-Security-Token=${Uri.encodeComponent(sessionToken)}';

  return '$scheme$endpoint$urlPath?$finalParams';
}

Future<void> connect({
  required String accessKey,
  required String secretKey,
  required String sessionToken,
  required String identityId,
}) async {
  // Your AWS region
  const region = 'us-east-1';
  // Your AWS IoT Core endpoint url
  const baseUrl = 'a82k06ko9a2kk-ats.iot.$region.amazonaws.com';
  const scheme = 'wss://';
  const urlPath = '/mqtt';
  // AWS IoT MQTT default port for websockets
  const port = 443;

  // The necessary AWS credentials to make a connection.
  // Obtaining them is not part of this example, but you can get the below credentials via any cognito/amplify library like amazon_cognito_identity_dart_2 or amplify_auth_cognito.
  // String accessKey = 'ASIA2R3XG6CBUDEDUS2N';
  // String secretKey = 'Klb/3MFKUjjCQs2xw5/DjfOEQ2Xf5i+Ta7bh6FdV';
  // String sessionToken = 'IQoJb3JpZ2luX2VjEPL//////////wEaCXVzLWVhc3QtMSJGMEQCIHKnVkbCkwGjZis9ur/m2t6tht/sCdxLIbDoC4rGinAHAiBX9JhfTiHihIAUPg/sntRns6lS48hZqkkWDYv9UjIAYCrEBAgqEAMaDDcyNTU2MjYxNzk4NyIM9xBC61diEJZ/pI89KqEEyx+T1HBWwoKqtHwuhMxtjyJdqoPDLNcLAiSGG7g+KiSRcNVcQxYPQdciIUCG3iVFYDTFDpV+ov9yjT9TltcpkosTeWgloYKogd8EqlvwGwegkhYivzV7OMiQiqlbpyafPR7GiCjZRwvtiq8oRUCUoXpXUZrRLjoNqfjdkEMS4L5/IWlNeNP7r2eQ6lyNz7y0v9yC2qRSWcK504RKsjIZd4nhPIPe0t4OUZUXQpFW0I9eoIUJba6+m4Q+4OzNlb98RuAqq76rGoGQBsc0uvjBXdxmklt+zDHMrm00nYdQu0FgncJUwaigWHCp7wY/AArUnoK1eqs/KLDwmiUDTohI8YgIA+F49H4gTorV79VwYpWN8fRKPGLm1yh70Pv/VLAwCdweWDUi66ojSo1aI5vZ8xqCwLubQPJKvB25VezXf6cKO6NuGs4sexA0PN1A2d03cfPzx2Ar6qkV7Zo3yKlFCBhHNCPaxtL6EBwPbB8YHA0/6wgXU6+PmrHQzyt8gDWrZIu8AuJwBZ319d3IE6fW5mXqyeHkWBQntfQO/jsXxuBYGXWn0LTTC5G7uqPyb1uH5wOfGGgMKy6mbIjA+H5zFssPTJNJVcHSSBbdxQJrgzARc5tnReeZzi3CuiYVBfB6EbBpeNXj5oD3WWjWk82JOxlgi862FfLz80oN4QhLnX2EwKfYVrTHs8HoF0yCrBzV+chAaWke5CqknoyACtBjrQwwqJKltwY6hgJjhZXmujxoI3BDnixmvjZrWrWxFfGpQumXRmHScZI010rXmlntjv9FyRKn/Ol+4/ijkaXxBOGvnwNzkm95iQbVWHOQ2+npKBRK9m7CuowQV/s2BMEb9zVlJKRXVuO0+2TiNlmwgIfn3wxGjK/dJy6xkSNSElBQZAxZMitOd+yHTBBWEdxk9O71o+WAz3d+n9KJlGjUrtTvJg+/yKXdZtQzT/Ek/0Rqft/waFOYx9lHO6mZJ23rBnqqJiDgWLlBovU7TDACvDkuoP5mZpBW/JDNNQ3woFKeZvsRha2zaSPx0gEKW7T78gUhAs/jkuxJ7L9u7ZkKdTwiz1BVTRYnnrgl0smTug+S';
  // String identityId = 'us-east-1:a8eee6f0-83d8-c374-882f-82194f70512d';

  // Transform the url into a Websocket url using SigV4 signing
  String signedUrl = getWebSocketURL(
    accessKey: accessKey,
    secretKey: secretKey,
    sessionToken: sessionToken,
    region: region,
    scheme: scheme,
    endpoint: baseUrl,
    urlPath: urlPath,
  );

  // Create the client with the signed url
  MqttServerClient client = MqttServerClient.withPort(
    signedUrl,
    identityId,
    port,
    maxConnectionAttempts: 2,
  );

  // Set the protocol to V3.1.1 for AWS IoT Core, if you fail to do this you will not receive a connect ack with the response code
  // client.setProtocolV311();
  // logging if you wish
  client.logging(on: false);
  client.useWebSocket = true;
  client.secure = false;
  client.autoReconnect = true;
  client.disconnectOnNoResponsePeriod = 90;
  client.keepAlivePeriod = 30;

  final MqttConnectMessage connMess =
      MqttConnectMessage().withClientIdentifier(identityId);

  client.connectionMessage = connMess;

  // Connect the client
  try {
    debugPrint('MQTT client connecting to AWS IoT using cognito....');
    await client.connect();
  } on Exception catch (e) {
    debugPrint('MQTT client exception - $e');
    client.disconnect();
  }

  if (client.connectionStatus!.state == MqttConnectionState.connected) {
    debugPrint('MQTT client connected to AWS IoT');
  } else {
    debugPrint(
        'ERROR MQTT client connection failed - disconnecting, state is ${client.connectionStatus!.state}');
    client.disconnect();
  }

  debugPrint('Sleeping....');
  await MqttUtilities.asyncSleep(10);

  client.updates.listen(
    (event) {
      for (var message in event) {
        debugPrint('Topic event: ${message.toString()}');
      }
    },
  );

  client.subscribe("C4DEE2879A60/status", MqttQos.atLeastOnce);

  // debugPrint('Disconnecting');
  // client.disconnect();
}
