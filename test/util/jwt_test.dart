import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('extractPayloadFromJwt', () {
    test('returns payload as map when called with valid input', () {
      const jwt = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODk'
          'wIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2Q'
          'T4fwpMeJf36POk6yJV_adQssw5c';
      final expectedPayload = {
        'sub': '1234567890',
        'name': 'John Doe',
        'iat': 1516239022,
      };

      final payload = extractPayloadFromJwt(jwt);
      expect(payload, equals(expectedPayload));
    });

    test('throws ArgumentError when called with invalid input', () {
      const jwt = 'invalid-jwt';
      expect(() => extractPayloadFromJwt(jwt), throwsArgumentError);
    });
  });
}
