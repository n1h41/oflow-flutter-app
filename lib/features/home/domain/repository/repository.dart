import 'package:dartz/dartz.dart';

import '../../../../core/constants/exceptions/failure.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, String>> attachIotPolicyToIdentity(
    String identityId,
    String iotPolicyName,
  );
}
