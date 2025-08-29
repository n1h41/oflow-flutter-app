import 'package:get_it/get_it.dart';
import 'package:oflow/core/router/router.dart';
import 'package:oflow/features/device/data/mqtt_service.dart';

import '../features/home/data/datasource/datasource.dart';
import '../features/home/data/repository/repository_impl.dart';
import '../features/home/domain/repository/repository.dart';

final GetIt getIt = GetIt.instance;

initialiseDependencies() {
  // INFO: AppRouter
  getIt.registerSingleton<AppRouter>(AppRouter());

  // INFO: MQTT Service - Register as singleton
  getIt.registerSingleton<MqttService>(MqttService());

  // INFO: Home Feature
  getIt.registerSingleton<HomeDatasource>(
    HomeDatasourceImpl(),
  );
  getIt.registerSingleton<HomeRepository>(
    HomeRepositoryImpl(getIt<HomeDatasource>()),
  );
}
