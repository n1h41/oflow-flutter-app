import 'package:dartz/dartz.dart';

import 'package:oflow/core/constants/exceptions/failure.dart';

import '../../domain/repository/respository.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  @override
  Future<Either<Failure, dynamic>> getIdentityCredentials(String token) async {
    throw UnimplementedError();
  }
}
