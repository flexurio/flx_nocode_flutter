import 'dart:convert';
import 'package:test/test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_table.dart';

void main() {
  group('ComponentTable.fromMap', () {
    test('parses valid JSON correctly', () {
      const jsonString = '''
      {
        "id": "customer_table",
        "type": "table",
        "http": {
          "method": "GET",
          "url": "https://api.example.com/customers",
          "headers": {
            "Authorization": "Bearer token123"
          },
          "body": {},
          "use_form_data": false
        },
        "columns": [
          { "header": "Name", "body": "name" },
          { "header": "Email", "body": "email" },
          { "header": "Registered On", "body": "registered_date" }
        ]
      }
      ''';

      final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
      final component = ComponentTable.fromMap(decoded);

      expect(component.id, 'customer_table');

      // Column check
      expect(component.columns.length, 3);
      expect(component.columns[0].header, 'Name');
      expect(component.columns[0].body, 'name');

      // HTTP check
      expect(component.http.method, 'GET');
      expect(component.http.url, 'https://api.example.com/customers');
      expect(component.http.headers['Authorization'], 'Bearer token123');
    });

    test('throws FormatException when id missing', () {
      const badJson = '''
      {
        "http": { "method": "GET", "url": "/x" }
      }
      ''';

      final decoded = jsonDecode(badJson);

      expect(
        () => ComponentTable.fromMap(decoded),
        throwsA(isA<FormatException>()),
      );
    });

    test('parses with empty column list', () {
      const jsonString = '''
      {
        "id": "empty_table",
        "type": "table",
        "http": { "method": "GET", "url": "/api/empty" },
        "columns": []
      }
      ''';

      final decoded = jsonDecode(jsonString);
      final component = ComponentTable.fromMap(decoded);

      expect(component.columns.isEmpty, true);
      expect(component.id, "empty_table");
    });
  });
}
