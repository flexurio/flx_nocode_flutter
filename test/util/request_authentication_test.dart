import 'package:appointment/src/app/util/request_authentication.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('getBasicAuthHeader returns correct header', () {
    expect(
      getBasicAuthHeader('username', 'password'),
      'Basic dXNlcm5hbWU6cGFzc3dvcmQ=',
    );
  });

  test('getBasicAuthHeader handles special characters in username and password',
      () {
    expect(
      getBasicAuthHeader('u:s:e:r:n:a:m:e', 'p:a:s:s:w:o:r:d'),
      'Basic dTpzOmU6cjpuOmE6bTplOnA6YTpzOnM6dzpvOnI6ZA==',
    );
  });
}
