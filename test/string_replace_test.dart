import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flx_nocode_flutter/src/app/model/user.dart';
import 'package:flx_nocode_flutter/src/app/util/string.dart';

import 'package:flx_nocode_flutter/src/app/model/configuration.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('replaceStringWithValues — single-brace {x}', () {
    setUp(() {
      Configuration.instance = Configuration.empty().copyWith(
        backendHost: 'http://127.0.0.1:8000',
      );
      UserRepositoryApp.instance = UserRepositoryApp();
      UserRepositoryApp.instance.userApp = UserAppNocode(
        id: 1,
        name: 'Test',
        role: 'admin',
      );
      UserRepositoryApp.instance.token = 'test_token_value';
    });

    test('replaces {backend_host} and {auth_token} placeholders', () {
      final result = '{backend_host}/projects/{id}'.replaceStringWithValues({'id': '42'});
      expect(result, 'http://127.0.0.1:8000/projects/42');

      final authResult = 'Bearer {auth_token}'.replaceStringWithValues({});
      expect(authResult, 'Bearer test_token_value');
    });

    test('replaces {key} with value', () {
      final result = '/api/users/{id}'.replaceStringWithValues({'id': '42'});
      expect(result, '/api/users/42');
    });

    test('replaces multiple {key} placeholders', () {
      final result = '/api/{resource}/{id}'.replaceStringWithValues({
        'resource': 'users',
        'id': '7',
      });
      expect(result, '/api/users/7');
    });

    test('replaces {user.token} with token value', () {
      final result = '/api?token={user.token}'.replaceStringWithValues({});
      expect(result, '/api?token=test_token_value');
    });

    test('does NOT replace {key} inside {{...}} (double-braces)', () {
      final result =
          '/path/{{id}}'.replaceStringWithValues({'id': '2'});
      expect(result, '/path/{{id}}');
    });

    test('replaces {key} next to double-braced blocks', () {
      final result = '{{base}}/path/{id}'.replaceStringWithValues({'id': '5'});
      expect(result, '{{base}}/path/5');
    });

    test('handles key names with special regex characters', () {
      final result = '/path/{my.key}/{my-key}'.replaceStringWithValues({
        'my.key': 'value1',
        'my-key': 'value2',
      });
      expect(result, '/path/value1/value2');
    });

    test('handles empty data map', () {
      final result = '/api/users/{id}'.replaceStringWithValues({});
      expect(result, '/api/users/{id}');
    });

    test('urlEncode parameter encodes value', () {
      final result = '/search?q={query}'.replaceStringWithValues(
        {'query': 'hello world'},
        urlEncode: true,
      );
      expect(result, '/search?q=hello%20world');
    });
  });

  group('replaceStringWithValues — double-brace {{x}} (new behaviour)', () {
    setUp(() {
      Configuration.instance = Configuration.empty().copyWith(
        backendHost: 'http://127.0.0.1:8000',
      );
      UserRepositoryApp.instance = UserRepositoryApp();
      UserRepositoryApp.instance.userApp = UserAppNocode(
        id: 1,
        name: 'Test',
        role: 'admin',
      );
      UserRepositoryApp.instance.token = 'test_token_value';
    });

    test('replaces {{backend_host}} with backendHost', () {
      final result =
          '{{backend_host}}/master_inventory_category'.replaceStringWithValues({});
      expect(result, 'http://127.0.0.1:8000/master_inventory_category');
    });

    test('replaces {{auth_token}} with token', () {
      final result = 'Bearer {{auth_token}}'.replaceStringWithValues({});
      expect(result, 'Bearer test_token_value');
    });

    test('replaces {{user.token}} with token', () {
      final result = 'Bearer {{user.token}}'.replaceStringWithValues({});
      expect(result, 'Bearer test_token_value');
    });

    test('replaces both {{backend_host}} and {{auth_token}} in same string', () {
      final result =
          '{{backend_host}}/api?token={{auth_token}}'.replaceStringWithValues({});
      expect(result, 'http://127.0.0.1:8000/api?token=test_token_value');
    });

    test('httpData dropdown url pattern — {{backend_host}} replaced correctly', () {
      // Simulates the exact pattern used in dropdown httpData JSON config
      final url = '{{backend_host}}/master_inventory_category';
      final header = 'Bearer {{auth_token}}';
      expect(url.replaceStringWithValues({}), 'http://127.0.0.1:8000/master_inventory_category');
      expect(header.replaceStringWithValues({}), 'Bearer test_token_value');
    });

    test('double-brace does NOT prevent {key} from being replaced in same string', () {
      // Non-special keys in single-brace still get replaced alongside double-brace globals
      final result =
          '{{backend_host}}/items/{id}'.replaceStringWithValues({'id': '99'});
      expect(result, 'http://127.0.0.1:8000/items/99');
    });

    test('null token replaced with empty string for {{auth_token}}', () {
      UserRepositoryApp.instance.token = null;
      final result = 'Bearer {{auth_token}}'.replaceStringWithValues({});
      expect(result, 'Bearer ');
    });

    test('null token replaced with empty string for {{user.token}}', () {
      UserRepositoryApp.instance.token = null;
      final result = 'Bearer {{user.token}}'.replaceStringWithValues({});
      expect(result, 'Bearer ');
    });
  });

  group('replaceStringWithValuesMultiple', () {
    setUp(() {
      UserRepositoryApp.instance = UserRepositoryApp();
      UserRepositoryApp.instance.userApp = UserAppNocode(
        id: 1,
        name: 'Test',
        role: 'admin',
      );
      UserRepositoryApp.instance.token = 'multi_token';
    });

    test('replaces {user.token} outside {{...}}', () {
      final result =
          'token={user.token}'.replaceStringWithValuesMultiple([]);
      expect(result, 'token=multi_token');
    });

    test('does NOT replace {user.token} inside {{...}}', () {
      final result =
          '{{user.token}}'.replaceStringWithValuesMultiple([]);
      expect(result, '{{user.token}}');
    });

    test('replaces {selected.field} with joined values', () {
      final data = [
        {'name': 'alpha'},
        {'name': 'beta'},
      ];
      final result = '/api?names={selected.name}'.replaceStringWithValuesMultiple(data);
      expect(result, '/api?names=alpha,beta');
    });

    test('does NOT replace {selected.field} inside {{...}}', () {
      final data = [
        {'id': '1'},
        {'id': '2'},
      ];
      final result =
          '{{selected.id}}'.replaceStringWithValuesMultiple(data);
      expect(result, '{{selected.id}}');
    });
  });

  group('renderWithData (integration)', () {
    setUp(() {
      Configuration.instance = Configuration.empty().copyWith(
        backendHost: 'http://127.0.0.1:8000',
      );
      UserRepositoryApp.instance = UserRepositoryApp();
      UserRepositoryApp.instance.userApp = UserAppNocode(
        id: 1,
        name: 'Test',
        role: 'admin',
      );
      UserRepositoryApp.instance.token = 'test_token_value';
    });

    test('{{backend_host}} is now resolved by renderWithData', () {
      final result =
          '{{backend_host}}/master_inventory_category'.renderWithData({});
      expect(result, 'http://127.0.0.1:8000/master_inventory_category');
    });

    test('plain {id} is replaced while {{backend_host}} is also resolved', () {
      final result =
          '{{backend_host}}/items/{id}'.renderWithData({'id': '7'});
      expect(result, 'http://127.0.0.1:8000/items/7');
    });
  });
}

