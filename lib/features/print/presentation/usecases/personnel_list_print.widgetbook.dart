import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:printing/printing.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import '../../domain/json_pdf_generator.dart';

import 'package:flx_nocode_flutter/shared/services/http_request_executor.dart';

class MockDio extends Mock implements Dio {}

@widgetbook.UseCase(
  name: 'Daftar Inisial Personel (Complex Table)',
  type: PdfPreview,
  path: '[Print]',
)
Widget buildPersonnelListUseCase(BuildContext context) {
  return const _PersonnelListApiDemo();
}

class _PersonnelListApiDemo extends StatefulWidget {
  const _PersonnelListApiDemo({Key? key}) : super(key: key);

  @override
  State<_PersonnelListApiDemo> createState() => _PersonnelListApiDemoState();
}

class _PersonnelListApiDemoState extends State<_PersonnelListApiDemo> {
  Map<String, dynamic>? _config;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      const jsonString = '''
      {
        "id": "print_personnel_list",
        "name": "Daftar Inisial Personel",
        "layout_type": "document",
        "unit": "mm",
        "page_size": "A4",
        "orientation": "portrait",
        "header_height": 45,
        "footer_height": 20,
        "header": [
          {
            "type": "table",
            "x": 0, "y": 0,
            "width": 190,
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
            "width": 190,
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
              { "content": { "type": "text", "value": "No." }, "flex": 2, "align": "center" },
              { "content": { "type": "text", "value": "Nama Personel" }, "flex": 5 },
              { "content": { "type": "text", "value": "Inisial" }, "flex": 2, "align": "center" },
              { "content": { "type": "text", "value": "Paraf" }, "flex": 3 },
              { "content": { "type": "text", "value": "Tanda Tangan" }, "flex": 4 }
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
      ''';

      final config = jsonDecode(jsonString) as Map<String, dynamic>;

      setState(() {
        _config = config;
      });
    } catch (e) {
      // Handle error gracefully
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_config == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Loading Config...')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Inisial Personel (Full JSON)')),
      body: PdfPreview(
        build: (format) => JsonPdfGenerator.generate(_config!),
        allowPrinting: true,
        allowSharing: true,
        canChangeOrientation: false,
        canChangePageFormat: false,
      ),
    );
  }
}
