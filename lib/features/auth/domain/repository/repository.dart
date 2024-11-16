import 'package:dartz/dartz.dart';
import 'package:oflow/core/constants/exceptions/failure.dart';

import '../entity/authentication_result_entity.dart';
import '../usecase/params/params.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, AuthenticationResultEntity >> signIn(SignInParams params);
}
