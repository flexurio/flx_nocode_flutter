import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flx_nocode_flutter/features/data_table/screen/widgets/entity_data_table.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';

@UseCase(name: 'From JSON (Users)', type: MenuDataTableCustom)
Widget buildMenuDataTableCustomFromJsonUseCase(BuildContext context) {
  const jsonRaw = '''
{
    "id": "flx_users",
    "label": "User",
    "description": "System Users Management",
    "fields": [
        {
            "label": "ID",
            "reference": "id",
            "type": "number",
            "column_width": 3,
            "auto_generated": true
        },
        {
            "label": "Email",
            "reference": "email",
            "type": "text",
            "column_width": 10,
            "allow_create": true,
            "allow_update": true
        },
        {
            "label": "Name",
            "reference": "name",
            "type": "text",
            "required": true,
            "column_width": 10,
            "allow_create": true,
            "allow_update": true
        },
        {
            "label": "Phone",
            "reference": "phone",
            "type": "text",
            "column_width": 10,
            "allow_create": true,
            "allow_update": true
        }
    ],
    "actions": [
        {
            "id": "edit",
            "name": "Edit",
            "type": "open_page",
            "layout_form_id": "view",
            "icon": "edit",
            "is_multiple": false
        },
        {
            "id": "delete",
            "name": "Delete",
            "type": "http",
            "icon": "delete",
            "is_multiple": false,
            "confirm_title": "Confirm Delete",
            "confirm_message": "Are you sure you want to delete this user?"
        }
    ],
    "layout_table": {
        "id": 10,
        "name": 10,
        "email": 10,
        "phone": 10
    },
    "layout_list_tile": {
        "title": "name",
        "subtitle": "email",
        "trailing": "id"
    },
    "backend": {
        "read_all": {
            "method": "GET",
            "url": "/flx_users",
            "mock_enabled": true,
            "mock_data": {
                "total_data": 3,
                "data": [
                    {"id": 1, "name": "Antigravity AI", "email": "ai@google.com", "phone": "08123456789"},
                    {"id": 2, "name": "Suhal", "email": "suhal@dev.com", "phone": "081122334455"},
                    {"id": 3, "name": "Flutter Developer", "email": "flutter@dart.dev", "phone": "089988776655"}
                ]
            }
        }
    }
}
''';

  final entity = EntityCustom.fromJson(json.decode(jsonRaw));

  return MenuDataTableCustom.prepare(
    entity: entity,
    embedded: false,
    bypassPermission: true,
    parentData: [],
  );
}
