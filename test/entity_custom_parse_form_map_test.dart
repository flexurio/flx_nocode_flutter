import 'dart:convert';

import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:test/test.dart';

void main() {
  group('EntityCustom.fromJson', () {
    test('parses valid JSON correctly', () {
      final Map<String, dynamic> jsonMap = <String, dynamic>{
        "id": "lbb_account_banks",
        "label": "Account Bank",
        "description": "master marketing account number",
        "fields": [
          {
            "label": "Account No",
            "reference": "id",
            "type": "text",
            "column_width": 4,
            "required": true,
            "max_length": 100,
            "allow_create": true,
            "allow_update": true
          },
          {
            "label": "Account Name",
            "reference": "account_name",
            "type": "text",
            "column_width": 4,
            "required": true,
            "max_length": 500,
            "allow_create": true,
            "allow_update": true
          },
          {
            "label": "Structure Code",
            "reference": "structure_code",
            "type": "text",
            "column_width": 6,
            "required": true,
            "max_length": 500,
            "options_source":
                "backend.marketings({code}:{marketing_position_id})",
            "allow_create": true,
            "allow_update": true
          },
          {
            "label": "Nip",
            "reference": "nip",
            "type": "text",
            "column_width": 6,
            "required": true,
            "max_length": 100,
            "allow_create": true,
            "allow_update": true
          },
          {
            "label": "Area",
            "reference": "area",
            "type": "text",
            "column_width": 6,
            "required": true,
            "max_length": 500,
            "allow_create": true,
            "allow_update": true
          },
          {
            "label": "Position",
            "reference": "position",
            "type": "text",
            "column_width": 50,
            "required": true,
            "auto_generated": true,
            "allow_create": true,
            "allow_update": true
          }
        ],
        "layout_table": {
          "id": 6,
          "account_name": 8,
          "structure_code": 5,
          "position": 5,
          "nip": 5,
          "area": 5
        },
        "layout_list_tile": {
          "title": "id",
          "subtitle": "id",
          "trailing": "structure_code"
        },
        "layout_form": [
          {
            "type": "view",
            "label": "General",
            "groups": [],
            "components": [
              {
                "id": "customer_name",
                "type": "field_display",
                "label": "Customer Name",
                "value": "PT Maju Jaya"
              },
              {
                "id": "payments_table",
                "type": "table",
                "http": {
                  "method": "GET",
                  "url":
                      "https://erp-metiska-farma-api-dev.flexurio.com/transaction-journal-accountings/BKA/01/25101008/payments?page=1&search=&sort=transaction_journal_accountings.transaction_no,transaction_journal_accountings.count,transaction_journal_accountings.chart_of_account_id&ascending=true&limit=90000",
                  "headers": {"Authorization": "Bearer {user.token}"},
                  "body": {},
                  "use_form_data": false
                },
                "columns": [
                  {"header": "Department", "body": "{department_name}"},
                  {"header": "Value", "body": "{value}"},
                  {
                    "header": "Chart of Account",
                    "body": "{chart_of_account_name}"
                  }
                ]
              }
            ]
          },
          {
            "type": "create",
            "label": "General",
            "groups": [
              {
                "id": "9f3b7a11-6d42-4b7e-9f21-2a7c9d123456",
                "title": "General Info",
                "rows": [
                  {
                    "columns": 2,
                    "fields": ["structure_code", "id"]
                  }
                ]
              }
            ]
          },
          {
            "type": "update",
            "label": "General",
            "groups": [
              {
                "id": "6e1a8f22-8c9d-4a8e-91e2-7f4c9b987654",
                "title": "Update Info",
                "rows": [
                  {
                    "columns": 2,
                    "fields": ["structure_code", "id"]
                  }
                ]
              }
            ]
          }
        ],
        "backend": {
          "read_all": {
            "method": "GET",
            "url": "{backend_host}/lbb_account_banks"
          },
          "read": {
            "method": "GET",
            "url":
                "{backend_host}/lbb_account_banks?id.eq={id}&sort=id&ascending=false"
          },
          "create": {
            "method": "POST",
            "url": "{backend_host}/lbb_account_banks"
          },
          "update": {
            "method": "PUT",
            "url": "{backend_host}/lbb_account_banks/{id}"
          },
          "delete": {
            "method": "DELETE",
            "url": "{backend_host}/lbb_account_banks/{id}"
          }
        }
      };

      final jsonString = jsonEncode(jsonMap);
      final decoded = jsonDecode(jsonString) as Map<String, dynamic>;

      final entity = EntityCustom.fromJson(decoded);
      expect(entity, isNotNull);
    });
  });
}
