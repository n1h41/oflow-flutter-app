import 'package:oflow/features/auth/domain/usecase/params/params.dart';

abstract interface class AuthDatasource {
  Future<dynamic> signUp(SignUpParams params);
}

class AuthDatasourceImpl implements AuthDatasource {
  @override
  Future signUp(SignUpParams params) async {
    throw UnimplementedError();
  }
}
