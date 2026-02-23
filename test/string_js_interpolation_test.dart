import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flx_nocode_flutter/src/app/model/user.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('StringJsInterpolationExtension Priority Tests', () {
    setUp(() {
      // Initialize Configuration singleton
      Configuration.instance = Configuration.empty();

      // Initialize UserRepositoryApp singleton
      UserRepositoryApp.instance = UserRepositoryApp();
      UserRepositoryApp.instance.userApp = UserApp(
        id: 1801008, // Dynamic User ID from "JWT"
        name: 'Test User',
        role: 'admin',
      );
      UserRepositoryApp.instance.token = 'dummy_token';
    });

    test('user_id from JWT should take precedence over record variable', () {
      const template = '{{ user_id }}';
      final variables = {
        'record': {
          'user_id': 3251043, // ID from database/record
        }
      };

      final result = template.interpolateJavascript(variables);

      // Should be the JWT ID, not the record ID
      expect(result, '1801008');
    });

    test('Accessing record user_id should still be possible via record prefix',
        () {
      const template = '{{ record.user_id }}';
      final variables = {
        'record': {
          'user_id': 3251043,
        }
      };

      final result = template.interpolateJavascript(variables);

      // Should be the record ID because of explicit prefix
      expect(result, '3251043');
    });

    test('auth_token should take precedence over context variables', () {
      const template = '{{ auth_token }}';
      final variables = {
        'auth_token': 'malicious_token_from_data',
      };

      final result = template.interpolateJavascript(variables);

      // Should be the system token
      expect(result, 'dummy_token');
    });

    test('Multiple variables interpolation with mixed priorities', () {
      const template = 'System: {{ user_id }}, Data: {{ record.name }}';
      final variables = {
        'record': {
          'user_id': 999,
          'name': 'John Doe',
        }
      };

      final result = template.interpolateJavascript(variables);

      expect(result, 'System: 1801008, Data: John Doe');
    });
  });
}
