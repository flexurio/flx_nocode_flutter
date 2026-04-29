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
        "email": 10
    },
    "layout_list_tile": {
        "title": "name",
        "subtitle": "email",
        "trailing": "id"
    },
    "backend": {
        "read_all": {
            "method": "GET",
            "url": "/users",
            "mock_enabled": true,
            "mock_data": {
                "total_data": 5,
                "data": [
                    {"id": 1, "name": "Antigravity AI", "email": "ai@google.com"},
                    {"id": 2, "name": "Suhal", "email": "suhal@dev.com"},
                    {"id": 3, "name": "Flutter Dev", "email": "dev@flutter.io"},
                    {"id": 4, "name": "Jane Doe", "email": "jane@example.com"},
                    {"id": 5, "name": "John Smith", "email": "john@smith.net"}
                ]
            }
        }
    },
    "layout_print": [
      {
        "id": "print_personnel_list",
        "name": "Daftar Inisial Personel",
        "layout_type": "document",
        "unit": "mm",
        "page_size": "A4",
        "orientation": "portrait",
        "margin": 20,
        "header_height": 45,
        "footer_height": 20,
        "header": [
          {
            "type": "table",
            "x": 0, "y": 0,
            "width": 170,
            "body": [
              [
                { 
                  "content": {
                    "type": "container",
                    "padding": 2,
                    "child": {
                      "type": "image",
                      "url": "https://picsum.photos/100",
                      "width": 30, "height": 30,
                      "fit": "contain"
                    }
                  }, 
                  "flex": 2, 
                  "align": "center" 
                },
                { 
                  "content": {
                    "type": "column",
                    "align": "center",
                    "children": [
                      { "type": "container", "height": 12 },
                      { "type": "text", "value": "DAFTAR INISIAL PERSONEL", "font_size": 18, "is_bold": true },
                      { "type": "container", "height": 8 },
                      { "type": "text", "value": "Quality Assurance", "font_size": 10 }
                    ]
                  }, 
                  "flex": 6, 
                  "align": "center" 
                },
                { 
                  "content": {
                    "type": "column",
                    "align": "left",
                    "children": [
                      { "type": "text", "value": "Effective Date :", "font_size": 8 },
                      { "type": "container", "height": 15 },
                      { "type": "text", "value": "Review Date :", "font_size": 8 }
                    ]
                  }, 
                  "flex": 3, 
                  "align": "left" 
                }
              ]
            ]
          }
        ],
        "content": [
          {
            "type": "table",
            "width": 170,
            "margin": { "top": 5 },
            "cell_padding": { "top": 3, "bottom": 3, "left": 3, "right": 3 },
            "http_data": {
              "method": "GET",
              "url": "https://erp-metiska-farma-api-dev.flexurio.com/users?page=1&search=&sort=created_at&ascending=true",
              "headers": {
                "Accept": "application/json",
                "Content-Type": "application/json",
                "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3NfdXVpZCI6IjBmNzk4ZmJhLTRjNWMtNDYxMy1hODg5LTBjMWQzMTNjOTZiMiIsImF1dGhvcml6ZWQiOnRydWUsImV4cCI6MTc3ODA0MjMyMywiaWQiOjE4MDEwMDgsIm5hbWUiOiJNdWFsaXAgU3VoYWwiLCJuaXAiOiIxODAxMDA4Iiwicm9sZSI6IkFkbWluaXN0cmF0b3IifQ.8UaBcBG4ClzC42jbiGtKU1fcwJE291gGD2TU0DD42BE"
              },
              "mock_enabled": false
            },
            "header": [
              { "content": { "type": "text", "value": "No.", "is_bold": true }, "flex": 2, "align": "center" },
              { "content": { "type": "text", "value": "Nama Personel", "is_bold": true }, "flex": 5 },
              { "content": { "type": "text", "value": "Inisial", "is_bold": true }, "flex": 2, "align": "center" },
              { "content": { "type": "text", "value": "Paraf", "is_bold": true }, "flex": 3 },
              { "content": { "type": "text", "value": "Tanda Tangan", "is_bold": true }, "flex": 4 }
            ],
            "body": [
              { "content": { "type": "text", "value": "{{no}}." }, "align": "center" },
              { "content": { "type": "text", "value": "{{data.name}}" } },
              { "content": { "type": "text", "value": "{{data.initial}}" }, "align": "center" },
              { "content": { "type": "text", "value": "" } },
              { 
                "templates": [
                  { 
                    "type": "row", 
                    "align": "left",
                    "children": [ { "type": "text", "value": "{{no}}.", "font_size": 10 } ]
                  },
                  { 
                    "type": "row", 
                    "align": "center",
                    "children": [ { "type": "text", "value": "{{no}}.", "font_size": 10 } ]
                  }
                ]
              }
            ]
          }
        ]
      }
    ],
    "actions_home": [
      {
        "id": "print_personnel",
        "name": "Print PDF",
        "type": "print",
        "layout_print_id": "print_personnel_list",
        "icon": "print",
        "is_multiple": false
      }
    ]
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
