import 'package:dio/dio.dart';

import '../../../../core/constants/exceptions/failure.dart';
import '../../../../core/data/datasource/base_datasource.dart';

abstract interface class HomeDatasource {
  Future<String> attachIotPolicyToIdentity(
      String identityId, String iotPolicyName);
}

class HomeDatasourceImpl extends BaseDatasource implements HomeDatasource {
  @override
  Future<String> attachIotPolicyToIdentity(
      String identityId, String iotPolicyName) async {
    try {
      final httpClient = Dio();
      final response = await httpClient.post<String>(
        "https://ex6nd6w4qc6d36zs2zjvrlfo3a0dzzme.lambda-url.us-east-1.on.aws/",
        data: {
          "cognitoIdentityId": identityId,
          "iotPolicyName": "esp_p",
        },
      );
      if (response.statusCode != 200) {
        throw ServerFailure(
          message: response.data ?? "Unknown server error",
        );
      }
      if (response.data == null) {
        throw DataParsingFailure(
          message: "Response data is null",
        );
      }
      return response.data!;
    } on TypeError catch (e) {
      throw DataParsingFailure(message: e.toString());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw NoNetworkFailure();
      }
      throw ServerFailure(
        message: e.response?.data ?? "Unknown server error",
      );
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }
}
