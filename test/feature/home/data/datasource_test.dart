import 'package:flutter_test/flutter_test.dart';
import 'package:oflow/features/home/data/datasource/datasource.dart';

void main() {
  late final HomeDatasource homeDatasource;

  setUp(
    () {
      homeDatasource = HomeDatasourceImpl();
    },
  );

  group(
    'Device datasource',
    () {
      test(
        'attachIotPolicyToIdentity',
        () async {
          final response = await homeDatasource.attachIotPolicyToIdentity(
            'us-east-1:a8eee6f0-8311-c329-da94-97d63b3f5f7c',
            'esp_p',
          );
          expect(response, isA<String>());
        },
      );
    },
  );
}
