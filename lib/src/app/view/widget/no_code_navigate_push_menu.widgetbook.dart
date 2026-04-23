import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/entity_home.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';

@UseCase(name: 'Navigate Push Menu (Initial Value Test)', type: MenuCustom)
Widget buildNavigatePushMenuUseCase(BuildContext context) {
  const jsonRaw = '''
{
  "id": "employee",
  "label": "Employee",
  "description": "Manage employees",
  "fields": [
    {"reference": "id", "label": "ID", "type": "text"},
    {"reference": "nik", "label": "NIK", "type": "text"},
    {"reference": "name", "label": "Name", "type": "text"},
    {"reference": "department", "label": "Department", "type": "text"}
  ],
  "actions_home": [
    {
      "id": "add_employee",
      "name": "Add Employee",
      "type": "open_page",
      "layout_form_id": "create",
      "icon": "add",
      "is_multiple": false
    }
  ],
  "layout_list_tile": {
    "title": "name",
    "subtitle": "nik",
    "trailing": "id"
  },
  "layout_form": [
    {
      "id": "create",
      "label": "Create Employee",
      "components": [
        {
          "id": "nik",
          "type": "text_field",
          "label": "NIK",
          "required": true,
          "initialValue": "{{ parent.nik }}"
        },
        {
          "id": "name",
          "type": "text_field",
          "label": "Name",
          "required": true,
          "initialValue": "{{ parent.name }}"
        }
      ]
    }
  ],
  "backend": {
    "read_all": {
      "method": "GET",
      "url": "/employees",
      "mock_enabled": true,
      "mock_data": {
        "total_data": 1,
        "data": [
          {"id": "1", "nik": "12345", "name": "John Doe", "department": "IT"}
        ]
      }
    }
  }
}
''';

  final entity = EntityCustom.fromJson(json.decode(jsonRaw));

  return MenuCustom(
    entity: entity,
    parentData: [
      {'nik': '12345', 'name': 'John Doe'}
    ],
    bypassPermission: true,
    embedded: false,
    firstPage: true,
  );
}
