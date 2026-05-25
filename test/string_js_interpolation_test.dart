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

    test('auth_nik should return JWT user ID', () {
      const template = '{{ auth_nik }}';
      final result = template.interpolateJavascript();
      expect(result, '1801008');
    });

    test('should evaluate ternary expression with comparison correctly', () {
      const template = "{{ form.status == 'APPROVE QA STAFF' ? 'heyy' : 'ouu' }}";
      final variables = {
        'form': {
          'status': 'APPROVE QA STAFF',
        }
      };

      final result = template.interpolateJavascript(variables);

      expect(result, 'heyy');
    });

    test('should evaluate ternary expression with comparison falsy correctly', () {
      const template = "{{ form.status == 'APPROVE QA STAFF' ? 'heyy' : 'ouu' }}";
      final variables = {
        'form': {
          'status': 'REJECT QA STAFF',
        }
      };

      final result = template.interpolateJavascript(variables);

      expect(result, 'ouu');
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

    test('evaluateVisibility should handle basic boolean expressions', () {
      final variables = {
        'is_visible': true,
        'user_role': 'admin',
      };

      expect('{{ is_visible }}'.evaluateVisibility(variables), true);
      expect('{{ user_role === "admin" }}'.evaluateVisibility(variables), true);
      expect('{{ user_role === "user" }}'.evaluateVisibility(variables), false);
    });

    test('evaluateVisibility without braces', () {
      final variables = {
        'status': 'active',
      };

      expect('status === "active"'.evaluateVisibility(variables), true);
    });

    test('should flatten "vars" for direct access', () {
      final variables = {
        'vars': {
          'my_var': 'hello',
          'item': {'id': 123}
        }
      };

      expect('{{ my_var }}'.interpolateJavascript(variables), 'hello');
      expect('{{ item.id }}'.interpolateJavascript(variables), '123');
    });

    test('should handle JSON stringification in JS for JSON wrapper', () {
      final variables = {
        'data': {
          'id': 1,
          'tags': ['a', 'b']
        }
      };

      // [[ expr ]] is the syntax for isJsonWrapper = true in Template.parse
      // But in interpolateJavascript, we can test the processor directly if needed.
      // Actually, interpolateJavascript calls JsInterpolationProcessor.process.
      // Let's verify how [[ ]] is handled.
      
      const template = '[[ data ]]';
      final result = template.interpolateJavascript(variables);
      
      expect(result, contains('"id":1'));
      expect(result, contains('"tags":["a","b"]'));
    });

    group('Date Helper Functions', () {
      test('startOfMonth should handle YYYYMM string', () {
        final variables = {'period': '202503'};
        expect('{{ startOfMonth(period) }}'.interpolateJavascript(variables),
            '2025-03-01');
      });

      test('endOfMonth should handle YYYYMM string', () {
        final variables = {'period': '202503'};
        expect('{{ endOfMonth(period) }}'.interpolateJavascript(variables),
            '2025-03-31');
      });

      test('endOfMonth should handle leap year', () {
        final variables = {'period': '202402'}; // Feb 2024 is leap year
        expect('{{ endOfMonth(period) }}'.interpolateJavascript(variables),
            '2024-02-29');
      });

      test('startOfMonth and endOfMonth with custom format', () {
        final variables = {'period': '202503'};
        expect(
            '{{ startOfMonth(period, "dd/MM/yyyy") }}'
                .interpolateJavascript(variables),
            '01/03/2025');
        expect(
            '{{ endOfMonth(period, "dd/MM/yyyy") }}'
                .interpolateJavascript(variables),
            '31/03/2025');
      });

      test('should handle standard date strings', () {
        final variables = {'my_date': '2025-05-20'};
        expect('{{ startOfMonth(my_date) }}'.interpolateJavascript(variables),
            '2025-05-01');
        expect('{{ endOfMonth(my_date) }}'.interpolateJavascript(variables),
            '2025-05-31');
      });
    });
  });
}
