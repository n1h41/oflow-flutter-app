import 'package:get_it/get_it.dart';
import 'package:oflow/core/router/router.dart';
import 'package:oflow/features/auth/data/datasource/datasource.dart';
import 'package:oflow/features/auth/data/repository/repository_impl.dart';
import 'package:oflow/features/auth/domain/repository/repository.dart';
import 'package:oflow/features/auth/domain/usecase/usecase.dart';

import '../features/home/data/datasource/datasource.dart';
import '../features/home/data/repository/repository_impl.dart';
import '../features/home/domain/repository/repository.dart';

final GetIt getIt = GetIt.instance;

initialiseDependencies() {
  // INFO: AppRouter
  getIt.registerSingleton<AppRouter>(AppRouter());

  // INFO: Home Feature
  getIt.registerSingleton<HomeDatasource>(
    HomeDatasourceImpl(),
  );
  getIt.registerSingleton<HomeRepository>(
    HomeRepositoryImpl(getIt<HomeDatasource>()),
  );

  // INFO: Auth Feature
  getIt.registerSingleton<AuthDatasource>(
    AuthDatasourceImpl(),
  );
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(getIt<AuthDatasource>()),
  );
  getIt.registerSingleton<AuthUsecase>(
    AuthUsecase(getIt<AuthRepository>()),
  );
}
