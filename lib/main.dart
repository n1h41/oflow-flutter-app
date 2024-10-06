import 'package:flutter/material.dart';
import 'package:oflow/core/service_locator.dart';

import 'features/app/presentation/views/app.dart';

void main() {
  initialiseDependencies();
  runApp(const MyApp());
}
