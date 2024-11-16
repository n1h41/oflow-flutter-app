import 'package:oflow/core/constants/exceptions/failure.dart';
import 'package:oflow/core/data/datasource/base_datasource.dart';
import 'package:oflow/core/models/general_response_model.dart';
import 'package:oflow/features/auth/data/models/sign_in_response_model.dart';
import 'package:oflow/features/auth/domain/usecase/params/params.dart';

abstract interface class AuthDatasource {
  Future<dynamic> signUp(SignUpParams params);
  Future<GeneralResponseModel<SignInResponseModel>> signIn(SignInParams params);
}

class AuthDatasourceImpl extends BaseDatasource implements AuthDatasource {
  @override
  Future signUp(SignUpParams params) async {
    throw UnimplementedError();
  }

  @override
  Future<GeneralResponseModel<SignInResponseModel>> signIn(
      SignInParams params) async {
    try {
      final response = await api.post("/auth/sign-in", data: params.toJson());
      final GeneralResponseModel<SignInResponseModel> signInResponse =
          GeneralResponseModel.fromJson(
        response.data,
        (json) => SignInResponseModel.fromJson(json as Map<String, dynamic>),
      );
      return signInResponse;
    } on TypeError catch (e) {
      throw DataParsingFailure(message: e.toString());
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }
}
