import 'dart:convert';
import 'dart:io';
import 'package:flx_nocode_flutter/features/export/screen/models/export.dart';
import 'package:flx_nocode_flutter/features/export/screen/models/export_section.dart';
import 'package:flx_nocode_flutter/features/export/screen/models/export_table_section.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/util/picker_file.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

typedef HeaderProvider = Future<Map<String, String>> Function();

/// Fungsi utama untuk generate dan buka PDF
Future<void> exportToPdf(
  Export export, {
  required Map<String, dynamic> data,
  HeaderProvider? headerProvider,
}) async {
  print('==============================');
  print('[ExportPDF] 🚀 Starting exportToPdf()');
  print('[ExportPDF] → Export name: ${export.name}');
  print('[ExportPDF] → Type: ${export.type}');
  print('[ExportPDF] → Type mode: ${export.typeMode}');
  print('[ExportPDF] → Backend: ${export.backend}');
  print('==============================');

  final template = export.template;
  if (template == null) {
    print('[ExportPDF] ❌ No template found for export: ${export.name}');
    return;
  }

  print('[ExportPDF] ✅ Template title: ${template.title}');
  print('[ExportPDF] 📄 Section count: ${template.sections.length}');

  final pdf = pw.Document();
  final tableDataCache = <ExportSection, List<List<String>>>{};

  // 🔹 Prefetch semua data table dari endpoint-nya
  for (final section in template.sections) {
    print('[ExportPDF] ───────────────────────────────');
    print('[ExportPDF] ⬇️ Processing section type: ${section.type}');

    if (section is ExportTableSection) {
      print('[ExportPDF] 🔍 Found table section:');
      print('[ExportPDF] → Endpoint: ${section.endpoint}');
      print('[ExportPDF] → Method: ${section.method}');
      print('[ExportPDF] → Fields: ${section.fields}');
      print('[ExportPDF] → Columns: ${section.columns}');
      try {
        final rows = await _fetchTableData(section,
            data: data, headerProvider: headerProvider);
        tableDataCache[section] = rows;
        print('[ExportPDF] ✅ Table data fetched: ${rows.length} rows');
      } catch (e) {
        print('[ExportPDF] ❌ Error fetching table data: $e');
      }
    }
  }

  print('[ExportPDF] 🏗 Building PDF layout...');

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (context) => [
        pw.Center(
          child: pw.Text(
            template.title,
            style: pw.TextStyle(
              fontSize: 18,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.SizedBox(height: 20),
        ...template.sections.map((section) {
          print('[ExportPDF] 🧩 Rendering section: ${section.type}');
          if (section is ExportFieldSection) {
            print('[ExportPDF] → Field: ${section.label} = ${section.value}');
            return section.toPdfWidget(data);
          } else if (section is ExportTableSection) {
            final rows = tableDataCache[section] ?? [];
            print('[ExportPDF] → Table rows: ${rows.length}');
            return section.toPdfWidget(rows);
          } else if (section is ExportSignersSection) {
            print('[ExportPDF] → Signers: ${section.signers.length}');
            return section.toPdfWidget();
          }
          print('[ExportPDF] ⚠️ Unknown section type: ${section.runtimeType}');
          return pw.Container();
        }),
      ],
    ),
  );

  print('[ExportPDF] 💾 Saving PDF file...');

  // 🔹 Simpan dan buka file
  try {
    final filename = '${export.name}.pdf';
    print('[ExportPDF] 🖨 Opening file...');
    saveFile(await pdf.save(), filename);
    print('[ExportPDF] 🎉 Export complete!');
  } catch (e) {
    print('[ExportPDF] ❌ Failed to save or open file: $e');
  }

  print('==============================');
}

Future<List<List<String>>> _fetchTableData(
  ExportTableSection section, {
  required Map<String, dynamic> data,
  HeaderProvider? headerProvider,
}) async {
  final fields = section.fields ?? [];
  if (section.endpoint == null) {
    print('[ExportPDF] ❌ Endpoint not found in section: ${section}');
    return [];
  }

  final headers = <String, String>{
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    if (headerProvider != null) ...(await headerProvider()),
  };

  final uri = Uri.parse(
      section.endpoint!.replaceStringWithValues(data, urlEncode: true));
  final method = (section.method ?? 'GET').toUpperCase();

  print('[ExportPDF] 🚀 Fetching data...');
  print('[ExportPDF] → URL: ${uri.toString()}');
  print('[ExportPDF] → Method: $method');
  print('[ExportPDF] → Headers: $headers');

  http.Response resp;
  try {
    switch (method) {
      case 'POST':
        resp = await http.post(uri, headers: headers);
        break;
      default:
        resp = await http.get(uri, headers: headers);
        break;
    }
  } catch (e) {
    print('[ExportPDF] ❌ Request error: $e');
    return [];
  }

  print('[ExportPDF] ✅ Response status: ${resp.statusCode}');
  print('[ExportPDF] 📦 Response body length: ${resp.body.length} chars');

  if (resp.statusCode < 200 || resp.statusCode >= 300) {
    print('[ExportPDF] ❌ Invalid status code (${resp.statusCode})');
    return [];
  }

  dynamic jsonBody;
  try {
    jsonBody = json.decode(resp.body);
  } catch (e) {
    print('[ExportPDF] ❌ JSON decode error: $e');
    return [];
  }

  final List<dynamic> list =
      (jsonBody is Map && jsonBody['data'] is List) ? jsonBody['data'] : [];

  print('[ExportPDF] 📊 Data count: ${list.length}');
  print('[ExportPDF] 🧩 Fields to extract: $fields');

  final rows = list.map<List<String>>((item) {
    if (item is Map<String, dynamic>) {
      return fields.map((f) => '${item[f] ?? ''}').toList();
    }
    return List.generate(fields.length, (_) => '');
  }).toList();

  if (rows.isNotEmpty) {
    print('[ExportPDF] 🔍 Sample row: ${rows.first}');
  } else {
    print('[ExportPDF] ⚠️ No rows parsed.');
  }

  return rows;
}
