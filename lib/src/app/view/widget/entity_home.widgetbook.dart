import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/entity_home.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';

@UseCase(name: 'Default', type: MenuCustom)
Widget buildMenuCustomUseCase(BuildContext context) {
  const jsonRaw = '''
{
    "id": "flx_users",
    "label": "User Management",
    "description": "Manage system users and their roles",
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
            "column_width": 10
        },
        {
            "label": "Name",
            "reference": "name",
            "type": "text",
            "column_width": 10
        }
    ],
    "layout_table": {
        "id": 10,
        "name": 10,
        "email": 10
    },
    "backend": {
        "read_all": {
            "method": "GET",
            "url": "/users",
            "mock_enabled": true,
            "mock_data": [
                {"id": 1, "name": "Antigravity AI", "email": "ai@google.com"},
                {"id": 2, "name": "Suhal", "email": "suhal@dev.com"}
            ]
        }
    }
}
''';

  final entity = EntityCustom.fromJson(json.decode(jsonRaw));

  return MenuCustom(
    entity: entity,
    parentData: [],
    bypassPermission: true,
    embedded: false,
    firstPage: true,
    breadcrumbList: ['System', 'Security'],
  );
}
