import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import 'core/service_locator.dart';
import 'core/utils/local_storage/local_storage.dart';
import 'features/app/presentation/views/app.dart';

import 'amplify_outputs.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await _configureAmplify();
    initialiseDependencies();
    await LocalStorage.instance.init();
    runApp(const MyApp());
  } on Exception catch (e) {
    safePrint(e.toString());
  }
}

Future<void> _configureAmplify() async {
  try {
    await Amplify.addPlugin(AmplifyAuthCognito());
    await Amplify.configure(amplifyConfig);
    safePrint('Amplify configured');
  } on Exception catch (e) {
    safePrint('Failed to configure Amplify: $e');
  }
}
