import 'dart:developer';

import 'package:oflow/core/models/general_response_model.dart';
import 'package:oflow/features/device/data/datasource/datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oflow/features/device/data/models/get_identity_credentials_resp_model.dart';

void main() {
  late final DeviceDatasource deviceDatasource;

  setUp(
    () {
      deviceDatasource = DeviceDatasourceImpl();
    },
  );

  group(
    'Device datasource',
    () {
      test(
        'Get identity credentials',
        () async {
          // arrange
          // act
          final result = await deviceDatasource.getIdentityCredentials(
              "eyJraWQiOiJDKzJVRlN0andSYUl0XC8rUEl6SEFvQjljcHp1MmRhdzYzNWo5RWVPT2hoUT0iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIxNGI4OTQ0OC1kMDExLTcwMDEtN2Q4MS03ZmUzMDg1ZTJhOTciLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLnVzLWVhc3QtMS5hbWF6b25hd3MuY29tXC91cy1lYXN0LTFfTThiOTdOd084IiwicGhvbmVfbnVtYmVyX3ZlcmlmaWVkIjpmYWxzZSwiY29nbml0bzp1c2VybmFtZSI6IjE0Yjg5NDQ4LWQwMTEtNzAwMS03ZDgxLTdmZTMwODVlMmE5NyIsIm9yaWdpbl9qdGkiOiI1ZTRhNzJhNC1hNzA5LTRkZDktYWMxZS04MzgzZGNiMDlkYTgiLCJhdWQiOiI1dnJoOTN1NzBzdjhxZ2g5bjZmZzRyaDdsZSIsImN1c3RvbTpsYXN0X25hbWUiOiJBYmR1bGxhIiwiZXZlbnRfaWQiOiJiOTgxZDI5ZC1kMjNkLTQyYWUtYTg1Zi02ZTUwNzcwYjIzMTUiLCJjdXN0b206Zmlyc3RfbmFtZSI6Ik5paGFsIiwidG9rZW5fdXNlIjoiaWQiLCJhdXRoX3RpbWUiOjE3MzA0NTc4ODQsInBob25lX251bWJlciI6Iis5MTc1NTk4NjUzODYiLCJleHAiOjE3MzA0NjE0ODQsImlhdCI6MTczMDQ1Nzg4NCwianRpIjoiOWI1MTcwN2QtYWE3MC00Y2VjLTlkMDQtOTE5ZjNhNmU1NjU1IiwiZW1haWwiOiJuaWhhbG5pbnUyNUBnbWFpbC5jb20ifQ.iNNSL2F84VBFMVYH0RzKGAwPTH46336MBGBiUFa92SvXs7YV2WpsIzKzeX6Aic6qPPJ3srbXvZZehUEgvLzcYLbdYvqjNkATYB-n-JjNtMBQ0DhMrNgcaatjGNaUZ6mRqysoPm__xhzhuNU8WxuMyOrIg3s_A9QOdcrmtb8II2xVBoSMBGubSp4P-VqAXeYM8BC4jjvel0PGpZvAd8sVrWmEVWDs2iEVB0pVZ-WFP42decbrB3LwolzOOCdPZo6JmlZsYcuHbdf8f9FH2jFJGHugO-yKjWxfIi19aFVLw1Q-CMZc-pIysYAZLTO4tSbTavXRgiG9fUQEHfggRIEt3Q");
          log(result.toString());
          // assert
          expect(result, isA<GeneralResponseModel<GetIdentityCredentialsRespModel>>());
        },
      );
    },
  );
}
