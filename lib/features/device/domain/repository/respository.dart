import 'package:dartz/dartz.dart';
import 'package:oflow/core/constants/exceptions/failure.dart';

abstract interface class DeviceRepository {
  Future<Either<Failure, dynamic>> getIdentityCredentials(String token);
}
