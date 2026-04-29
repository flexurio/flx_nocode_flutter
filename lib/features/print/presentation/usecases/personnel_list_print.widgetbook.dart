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
        "layout_type": "canvas",
        "unit": "mm",
        "page_size": "A4",
        "orientation": "portrait",
        "header": [
          {
            "type": "table",
            "x": 10, "y": 10,
            "width": 190,
            "show_header": false,
            "columns": [
              { "header": "", "key": "logo", "flex": 2 },
              { "header": "", "key": "title", "flex": 6 },
              { "header": "", "key": "dates", "flex": 3 }
            ],
            "data": [
              {
                "logo": {
                  "type": "container",
                  "padding": 2,
                  "child": {
                    "type": "image",
                    "url": "https://picsum.photos/100",
                    "width": 30, "height": 30,
                    "fit": "contain"
                  }
                },
                "title": {
                  "type": "column",
                  "cross_axis_alignment": "center",
                  "children": [
                    { "type": "container", "height": 12 },
                    { "type": "text", "value": "DAFTAR INISIAL PERSONEL", "font_size": 18, "is_bold": true },
                    { "type": "container", "height": 8 },
                    { "type": "text", "value": "Quality Assurance", "font_size": 10 }
                  ]
                },
                "dates": {
                  "type": "column",
                  "children": [
                    { "type": "text", "value": "Effective Date :", "font_size": 8 },
                    { "type": "container", "height": 15 },
                    { "type": "text", "value": "Review Date :", "font_size": 8 }
                  ]
                }
              }
            ]
          }
        ],
        "pages": [
          {
            "background_color": "#FFFFFF",
            "components": [
              {
                "type": "table",
                "x": 10, "y": 50,
                "width": 190,
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
                "columns": [
                  { "header": "No.", "value": "{{data.nip}}", "flex": 2 },
                  { "header": "Nama Personel", "value": "{{data.name}}", "flex": 5 },
                  { "header": "Inisial", "value": "{{data.initial}}", "flex": 2 },
                  { "header": "Role", "value": "{{data.role}}", "flex": 3 },
                  { 
                    "header": "Tanda Tangan", 
                    "value": "{{data.nip}}", 
                    "flex": 4,
                    "templates": [
                      { 
                        "type": "container", 
                        "padding": { "left": 0 },
                        "child": { "type": "text", "value": "{{data.nip}}" } 
                      }
                    ]
                  }
                ],
                "data": "{{data}}"
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
