import 'package:dartz/dartz.dart';
import 'package:oflow/core/constants/exceptions/failure.dart';
import 'package:oflow/core/models/general_response_model.dart';
import 'package:oflow/features/auth/data/models/sign_in_response_model.dart';
import 'package:oflow/features/auth/domain/repository/repository.dart';
import 'package:oflow/features/auth/domain/usecase/params/params.dart';

import '../../domain/entity/authentication_result_entity.dart';
import '../datasource/datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource authDatasource;

  AuthRepositoryImpl(this.authDatasource);

  @override
  Future<Either<Failure, AuthenticationResultEntity>> signIn(
      SignInParams params) async {
    try {
      final GeneralResponseModel<SignInResponseModel> result =
          await authDatasource.signIn(params);
      final SignInResponseModel message = result.message;
      final AuthenticationResultEntity entity =
          AuthenticationResultEntity.fromJson(
        message.authenticationResult!.toJson(),
      );
      return Right(entity);
    } on TypeError catch (e) {
      return Left(
        DataParsingFailure(
          message: e.toString(),
        ),
      );
    } catch (e) {
      return Left(
        UnknownFailure(
          e.toString(),
        ),
      );
    }
  }
}
