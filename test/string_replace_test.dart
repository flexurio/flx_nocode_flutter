import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flx_nocode_flutter/src/app/model/user.dart';
import 'package:flx_nocode_flutter/src/app/util/string.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('replaceStringWithValues', () {
    setUp(() {
      UserRepositoryApp.instance = UserRepositoryApp();
      UserRepositoryApp.instance.userApp = UserApp(
        id: 1,
        name: 'Test',
        role: 'admin',
      );
      UserRepositoryApp.instance.token = 'test_token_value';
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

    test('does NOT replace {key} inside {{...}} (the bug fix)', () {
      final result =
          '{{backend_host}}/master_inventory_category/{{id}}'
              .replaceStringWithValues({'id': '2'});
      expect(result, '{{backend_host}}/master_inventory_category/{{id}}');
    });

    test('preserves {{...}} blocks entirely when key is inside', () {
      final result =
          '{{backend_host}}/api/{{resource}}/{{id}}'
              .replaceStringWithValues({'resource': 'users', 'id': '99'});
      expect(result, '{{backend_host}}/api/{{resource}}/{{id}}');
    });

    test('replaces {key} next to double-braced blocks', () {
      final result =
          '{{base}}/path/{id}'
              .replaceStringWithValues({'id': '5'});
      expect(result, '{{base}}/path/5');
    });

    test('replaces {user.token} with token value', () {
      final result = '/api?token={user.token}'.replaceStringWithValues({});
      expect(result, '/api?token=test_token_value');
    });

    test('does NOT replace {user.token} inside {{...}}', () {
      final result =
          'Authorization: Bearer {{user.token}}'.replaceStringWithValues({});
      expect(result, 'Authorization: Bearer {{user.token}}');
    });

    test('handles key names with special regex characters', () {
      final result =
          '/path/{my.key}/{my-key}'.replaceStringWithValues({
        'my.key': 'value1',
        'my-key': 'value2',
      });
      expect(result, '/path/value1/value2');
    });

    test('handles empty data map', () {
      final result =
          '/api/users/{id}'.replaceStringWithValues({});
      expect(result, '/api/users/{id}');
    });

    test('urlEncode parameter encodes value', () {
      final result =
          '/search?q={query}'.replaceStringWithValues(
        {'query': 'hello world'},
        urlEncode: true,
      );
      expect(result, '/search?q=hello%20world');
    });
  });

  group('replaceStringWithValuesMultiple', () {
    setUp(() {
      UserRepositoryApp.instance = UserRepositoryApp();
      UserRepositoryApp.instance.userApp = UserApp(
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

  group('renderWithData (integration with interpolateJavascript)', () {
    test('preserves {{backend_host}} for later JS interpolation', () {
      final result =
          '{{backend_host}}/master_inventory_category/{{id}}'
              .renderWithData({'id': '2'});
      expect(result, '{{backend_host}}/master_inventory_category/{{id}}');
    });
  });
}
