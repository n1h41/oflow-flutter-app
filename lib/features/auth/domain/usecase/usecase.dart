import 'package:dartz/dartz.dart';

import '../../../../core/constants/exceptions/failure.dart';
import '../entity/authentication_result_entity.dart';
import '../repository/repository.dart';
import 'params/params.dart';

class AuthUsecase {
  final AuthRepository _authRepository;

  AuthUsecase(this._authRepository);

  Future<Either<Failure, AuthenticationResultEntity>> signIn(
    SignInParams params,
  ) async =>
      await _authRepository.signIn(params);
}
