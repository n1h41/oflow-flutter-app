import 'package:dio/dio.dart';

import '../../utils/api_agent/api_agent.dart';

class BaseDatasource {
  Dio api;

  BaseDatasource() : api = ApiAgent().dio;
}
