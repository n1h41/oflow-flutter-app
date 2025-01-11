import 'package:dartz/dartz.dart';
import 'package:oflow/features/home/data/datasource/datasource.dart';

import '../../../../core/constants/exceptions/failure.dart';
import '../../domain/repository/repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource _homeDataSource;

  HomeRepositoryImpl(this._homeDataSource);

  @override
  Future<Either<Failure, String>> attachIotPolicyToIdentity(
      String identityId, String iotPolicyName) async {
    try {
      final result = await _homeDataSource.attachIotPolicyToIdentity(
          identityId, iotPolicyName);
      return Right(result);
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
