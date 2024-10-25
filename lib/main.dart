import 'package:flutter/material.dart';

import 'core/service_locator.dart';
import 'core/utils/local_storage/local_storage.dart';
import 'features/app/presentation/views/app.dart';

void main() {
  initialiseDependencies();
  LocalStorage.instance.init();
  runApp(const MyApp());
}
