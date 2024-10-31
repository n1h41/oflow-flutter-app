import 'package:oflow/core/data/datasource/base_datasource.dart';

import '../../../../core/constants/exceptions/failure.dart';

abstract interface class DeviceDatasource {
  Future<dynamic> getIdentityCredentials(String token);
}

class DeviceDatasourceImpl extends BaseDatasource implements DeviceDatasource {
  @override
  Future getIdentityCredentials(String token) async {
    try {
      final response =
          await api.post("/auth/fetch-identity-credentials", data: {"token": token});
      return response.data;
    } on TypeError catch (e) {
      throw DataParsingFailure(message: e.toString());
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }
}
