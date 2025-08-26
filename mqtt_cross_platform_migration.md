# MQTT Cross-Platform Migration: Detailed Explanation

This document explains all code changes made to enable cross-platform (web, mobile, desktop) MQTT support in your Flutter project, including the rationale and code snippets.

---

## 1. Removed Web-Only Imports

**File:** `lib/features/device/presentation/bloc/device_bloc.dart`
- **Removed:**
  ```dart
  import 'package:mqtt5_client/mqtt5_browser_client.dart';
  ```
- **Reason:** This import causes build failures on non-web platforms because `dart:js_interop` is not available outside web.

---

## 2. Refactored MQTT Client Instantiation

**File:** `device_bloc.dart`
- **Old:**
  ```dart
  if (kIsWeb) {
    _mqttClient2 = MqttBrowserClient.withPort(...);
  } else {
    _mqttClient2 = MqttServerClient.withPort(...);
    (_mqttClient2! as MqttServerClient).useWebSocket = true;
    (_mqttClient2! as MqttServerClient).secure = false;
  }
  ```
- **New:**
  ```dart
  _mqttClient2 = createMqttClient(signedUrl, identityId, port);
  // No platform-specific config here
  ```
- **Reason:** Conditional imports are required for platform-specific code; runtime checks are not sufficient.

---

## 3. Added Platform-Specific MQTT Client Factory

**New Files:**
- `lib/features/device/data/mqtt_client_factory.dart`
- `lib/features/device/data/mqtt_client_factory_mobile.dart`
- `lib/features/device/data/mqtt_client_factory_web.dart`

**Purpose:** Use conditional imports to select the correct MQTT client implementation for each platform.

**Code:**
- `mqtt_client_factory.dart`
  ```dart
  export 'mqtt_client_factory_mobile.dart'
      if (dart.library.html) 'mqtt_client_factory_web.dart';
  ```
- `mqtt_client_factory_mobile.dart`
  ```dart
  import 'package:mqtt5_client/mqtt5_server_client.dart';

  MqttServerClient createMqttClient(String url, String clientId, int port) {
    final client = MqttServerClient.withPort(url, clientId, port);
    client.useWebSocket = true;
    client.secure = false;
    return client;
  }
  ```
- `mqtt_client_factory_web.dart`
  ```dart
  import 'package:mqtt5_client/mqtt5_browser_client.dart';

  MqttBrowserClient createMqttClient(String url, String clientId, int port) {
    return MqttBrowserClient.withPort(url, clientId, port);
  }
  ```

---

## 4. Moved Platform-Specific Configuration to Factory

- All platform-specific settings (`useWebSocket`, `secure`) are now set inside the factory files, not in shared code.
- **Reason:** Shared code cannot safely reference platform-specific properties/types.

---

## 5. Updated BLoC to Use Factory

**File:** `device_bloc.dart`
- **Old:** Direct instantiation and configuration of MQTT clients.
- **New:**
  ```dart
  import 'package:oflow/features/device/data/mqtt_client_factory.dart';
  import 'package:mqtt5_client/mqtt5_client.dart'; // For shared types

  // ...
  _mqttClient2 = createMqttClient(signedUrl, identityId, port);
  // No platform-specific config here
  ```
- **Reason:** Keeps shared code platform-agnostic and clean.

---

## 6. Restored Type Imports

- Restored `import 'package:mqtt5_client/mqtt5_client.dart';` in your BLoC for shared MQTT types (e.g., `MqttClient`, `MqttQos`).
- **Reason:** Conditional imports do not provide type definitions for shared code.

---

## 7. Verified Builds

- Successfully built for both mobile/desktop (`flutter build apk`) and web (`flutter build web`).
- **Result:** No build errors; correct MQTT client used for each platform.
