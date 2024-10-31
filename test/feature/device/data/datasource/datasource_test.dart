import 'dart:developer';

import 'package:oflow/features/auth/data/datasource/datasource.dart';
import 'package:oflow/features/auth/data/models/sign_in_response_model.dart';
import 'package:oflow/features/auth/domain/usecase/params/params.dart';
import 'package:oflow/features/device/data/datasource/datasource.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final DeviceDatasource deviceDatasource;
  late final AuthDatasource authDatasource;
  late final SignInParams signInParams;

  setUp(
    () {
      deviceDatasource = DeviceDatasourceImpl();
      authDatasource = AuthDatasourceImpl();
      signInParams = const SignInParams(
        email: "nihalninu25@gmail.com",
        password: "nihal@23ktu",
      );
    },
  );

  group(
    'Device datasource',
    () {
      test(
        'Get identity credentials',
        () async {
          // arrange
          // act
          final authResult = await authDatasource.signIn(signInParams);
          final SignInResponseModel authResultEntity =
              authResult.message;
          final result = await deviceDatasource
              .getIdentityCredentials(authResultEntity.authenticationResult!.idToken!);
          log(result);
          // assert
          expect(result, isA<dynamic>());
        },
      );
    },
  );
}
