import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../config/config.dart';

class ApiAgent {
  final Dio dio = Dio(_baseOptions);

  static final BaseOptions _baseOptions = BaseOptions(
    connectTimeout: const Duration(seconds: 3),
    baseUrl: EnvConfig.baseUrl,
    responseType: ResponseType.json,
    receiveDataWhenStatusError: true,
    followRedirects: true,
    headers: {
      'Accept': 'application/json',
    },
    validateStatus: (status) =>
        RegExp(r'^[2-4]\d{2}$').hasMatch(status.toString()),
    contentType: 'application/json',
  );

  ApiAgent() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );
  }
}
