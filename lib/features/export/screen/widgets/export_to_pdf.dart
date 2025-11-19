import 'dart:convert';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/export/screen/models/export_section.dart';
import 'package:flx_nocode_flutter/features/export/screen/models/export_table_section.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/util/picker_file.dart';
import 'package:flx_nocode_flutter/src/app/util/string.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:http/http.dart' as http;

typedef HeaderProvider = Future<Map<String, String>> Function();

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

  // Prefetch data untuk semua table
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
        final rows = await fetchTableData(
          section,
          data: data,
          headerProvider: headerProvider,
        );
        tableDataCache[section] = rows;
        print('[ExportPDF] ✅ Table data fetched: ${rows.length} rows');
      } catch (e) {
        print('[ExportPDF] ❌ Error fetching table data: $e');
      }
    }
  }

  print(
      '[ExportPDF] 🏗 Building PDF layout (${export.paperSize}, ${export.orientation})...');

  final pageFormat = _getPageFormat(export.paperSize, export.orientation);

  final pageTheme = pw.PageTheme(
    pageFormat: pageFormat.copyWith(
      marginLeft: 10,
      marginRight: 10,
      marginTop: 18,
      marginBottom: 12,
    ),
  );

  // 🔹 Skala kecil untuk tabel agar lebih padat
  pw.Widget _compactTable(pw.Widget child) => pw.Transform.scale(
        scale: 0.92, // kompres ~8%
        child: child,
      );

  // 🔹 Tambahkan tanggal print
  final now = DateTime.now();
  final formattedDate =
      '${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

  pdf.addPage(
    pw.MultiPage(
      pageTheme: pageTheme,
      // ============= HEADER (dengan tanggal print dan penomoran halaman) =============
      header: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.stretch,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                'Dicetak: $formattedDate',
                style: const pw.TextStyle(fontSize: 8),
              ),
              pw.Text(
                'Hal. ${context.pageNumber}/${context.pagesCount}',
                style: const pw.TextStyle(fontSize: 8),
              ),
            ],
          ),
          pw.SizedBox(height: 4),
        ],
      ),
      // ============================ FOOTER ============================
      footer: (context) => pw.SizedBox(height: 0),

      build: (context) => [
        pw.Center(
          child: pw.Text(
            template.title,
            textAlign: pw.TextAlign.center,
            style: pw.TextStyle(
              fontSize: 14,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.SizedBox(height: 8),
        pw.DefaultTextStyle.merge(
          style: const pw.TextStyle(fontSize: 9),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              ...template.sections.map((section) {
                print('[ExportPDF] 🧩 Rendering section: ${section.type}');
                final sectionGap = pw.SizedBox(height: 6);

                if (section is ExportFieldSection) {
                  print(
                      '[ExportPDF] → Field: ${section.label} = ${section.value}');
                  return pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                    children: [
                      pw.DefaultTextStyle.merge(
                        style: const pw.TextStyle(fontSize: 9),
                        child: section.toPdfWidget(data),
                      ),
                      sectionGap,
                    ],
                  );
                } else if (section is ExportTableSection) {
                  final rows = tableDataCache[section] ?? [];
                  print('[ExportPDF] → Table rows: ${rows.length}');
                  return pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                    children: [
                      _compactTable(
                        section.toPdfWidget(
                          data: rows,
                          dataHeader: data,
                        ),
                      ),
                      sectionGap,
                    ],
                  );
                } else if (section is ExportSignersSection) {
                  print('[ExportPDF] → Signers: ${section.signers.length}');
                  return pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                    children: [
                      pw.DefaultTextStyle.merge(
                        style: const pw.TextStyle(fontSize: 9),
                        child: section.toPdfWidget(),
                      ),
                      sectionGap,
                    ],
                  );
                }

                print(
                    '[ExportPDF] ⚠️ Unknown section type: ${section.runtimeType}');
                return sectionGap;
              }),
            ],
          ),
        ),
      ],
    ),
  );

  print('[ExportPDF] 💾 Saving PDF file...');
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

Future<List<List<String>>> fetchTableData(
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
      return fields.map((f) {
        final value = item[f];
        if (value is num) {
          return value.format(2);
        }
        return '${value ?? ''}';
      }).toList();
    }
    return List.generate(fields.length, (index) => '');
  }).toList();

  if (rows.isNotEmpty) {
    print('[ExportPDF] 🔍 Sample row: ${rows.first}');
  } else {
    print('[ExportPDF] ⚠️ No rows parsed.');
  }

  return rows;
}

PdfPageFormat _getPageFormat(String paperSize, String orientation) {
  final bool isLandscape = orientation.toLowerCase() == 'landscape';

  final Map<String, PdfPageFormat> paperFormats = {
    'a3': PdfPageFormat.a3,
    'a4': PdfPageFormat.a4,
    'a5': PdfPageFormat.a5,
    'a6': PdfPageFormat.a6,
    'letter': PdfPageFormat.letter,
    'legal': PdfPageFormat.legal,
  };

  final format = paperFormats[paperSize.toLowerCase()] ?? PdfPageFormat.a4;

  return isLandscape ? format.landscape : format;
}
