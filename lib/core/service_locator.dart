import 'package:get_it/get_it.dart';
import 'package:oflow/core/router/router.dart';

final GetIt getIt = GetIt.instance;

initialiseDependencies() {

  // INFO: AppRouter
  getIt.registerSingleton<AppRouter>(AppRouter());
}
