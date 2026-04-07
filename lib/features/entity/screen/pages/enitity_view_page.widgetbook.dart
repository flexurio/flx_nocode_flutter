import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flx_nocode_flutter/features/entity/screen/pages/enitity_view_page.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';

@UseCase(name: 'Default', type: EntityViewPage)
Widget buildEntityViewPageUseCase(BuildContext context) {
  const jsonRaw = '''
{
    "id": "flx_users",
    "label": "User Details",
    "description": "User profile and settings",
    "fields": [
        {
            "label": "ID",
            "reference": "id",
            "type": "number"
        },
        {
            "label": "Email",
            "reference": "email",
            "type": "text"
        },
        {
            "label": "Name",
            "reference": "name",
            "type": "text"
        },
        {
            "label": "Phone",
            "reference": "phone",
            "type": "text"
        },
        {
            "label": "Biography",
            "reference": "bio",
            "type": "text"
        }
    ],
    "layout_form": [
        {
            "label": "view",
            "groups": [
                {
                    "title": "PERSONAL INFORMATION",
                    "rows": [
                        {
                            "columns": 2,
                            "fields": ["id", "name"]
                        },
                        {
                            "columns": 1,
                            "fields": ["email"]
                        },
                        {
                            "columns": 1,
                            "fields": ["phone"]
                        }
                    ]
                },
                {
                    "title": "ADDITIONAL DETAILS",
                    "rows": [
                        {
                            "columns": 1,
                            "fields": ["bio"]
                        }
                    ]
                }
            ]
        }
    ],
    "backend": {
        "read": {
            "method": "GET",
            "url": "/users/{id}",
            "mock_enabled": true,
            "mock_data": {
                "id": "123",
                "name": "Antigravity AI",
                "email": "ai.assistant@google.com",
                "phone": "+62 812-3456-7890",
                "bio": "I am a powerful agentic AI coding assistant designed by Google Deepmind."
            }
        }
    }
}
''';

  final entity = EntityCustom.fromJson(json.decode(jsonRaw));
  final data = {
    "id": "123",
    "name": "Antigravity AI",
    "email": "ai.assistant@google.com",
    "phone": "+62 812-3456-7890",
    "bio": "I am a powerful agentic AI coding assistant designed by Google Deepmind."
  };

  return EntityViewPage.prepare(
    entity: entity,
    data: data,
    embedded: true,
    dummy: false,
    parentData: [],
  );
}
