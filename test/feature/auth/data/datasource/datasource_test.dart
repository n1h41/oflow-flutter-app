import 'package:oflow/core/models/general_response_model.dart';
import 'package:oflow/features/auth/data/datasource/datasource.dart';
import 'package:oflow/features/auth/data/models/sign_in_response_model.dart';
import 'package:oflow/features/auth/domain/usecase/params/params.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final SignInParams signInParams;
  late final AuthDatasource authDatasource;

  setUp(
    () {
      signInParams = const SignInParams(
        email: "nihalninu25@gmail.com",
        password: "nihal@23ktu",
      );
      authDatasource = AuthDatasourceImpl();
    },
  );

  group(
    'Auth datasource',
    () {
      test(
        'Sign in user',
        () async {
          // arrange
          // act
          final result = await authDatasource.signIn(signInParams);
          // assert
          expect(result, isA<GeneralResponseModel<SignInResponseModel>>());
        },
      );
    },
  );
}
