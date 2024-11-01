import '../../../../core/constants/exceptions/failure.dart';
import '../../../../core/data/datasource/base_datasource.dart';
import '../../../../core/models/general_response_model.dart';
import '../models/get_identity_credentials_resp_model.dart';

abstract interface class DeviceDatasource {
  Future<GeneralResponseModel<GetIdentityCredentialsRespModel>>
      getIdentityCredentials(String token);
}

class DeviceDatasourceImpl extends BaseDatasource implements DeviceDatasource {
  @override
  Future<GeneralResponseModel<GetIdentityCredentialsRespModel>>
      getIdentityCredentials(String token) async {
    try {
      final response = await api
          .post("/auth/fetch-identity-credentials", data: {"token": token});
      final GeneralResponseModel<GetIdentityCredentialsRespModel>
          getIdentityCredentialsResponse = GeneralResponseModel.fromJson(
        response.data,
        (json) => GetIdentityCredentialsRespModel.fromJson(
            json as Map<String, dynamic>),
      );
      return getIdentityCredentialsResponse;
    } on TypeError catch (e) {
      throw DataParsingFailure(message: e.toString());
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }
}
