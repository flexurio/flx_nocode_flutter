import 'dart:convert';
import 'dart:io';
import 'package:flx_nocode_flutter/features/export/screen/models/export.dart';
import 'package:flx_nocode_flutter/features/export/screen/models/export_section.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

typedef HeaderProvider = Future<Map<String, String>> Function();

/// Fungsi utama untuk generate dan buka PDF
Future<void> exportToPdf(
  Export export, {
  HeaderProvider? headerProvider,
}) async {
  final template = export.template;
  if (template == null) return;

  final pdf = pw.Document();
  final tableDataCache = <ExportSection, List<List<String>>>{};

  // 🔹 Prefetch semua data table dari endpoint-nya
  for (final section in template.sections) {
    if (section is ExportTableSection) {
      tableDataCache[section] = await _fetchTableData(
        section,
        headerProvider: headerProvider,
      );
    }
  }

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
          if (section is ExportFieldSection) {
            return section.toPdfWidget();
          } else if (section is ExportTableSection) {
            final rows = tableDataCache[section] ?? [];
            return section.toPdfWidget(rows);
          } else if (section is ExportSignersSection) {
            return section.toPdfWidget();
          }
          return pw.Container();
        }),
      ],
    ),
  );

  // 🔹 Simpan dan buka file
  final dir = await getTemporaryDirectory();
  final file = File('${dir.path}/${export.name}.pdf');
  await file.writeAsBytes(await pdf.save());
  // await OpenFilex.open(file.path);
}

/// 🔸 Fetch data untuk section tabel
Future<List<List<String>>> _fetchTableData(
  ExportTableSection section, {
  HeaderProvider? headerProvider,
}) async {
  final fields = section.fields ?? [];
  if (section.endpoint == null) return [];

  final headers = <String, String>{
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    if (headerProvider != null) ...(await headerProvider()),
  };

  final uri = Uri.parse(section.endpoint!);
  final method = (section.method ?? 'GET').toUpperCase();

  http.Response resp;
  switch (method) {
    case 'POST':
      resp = await http.post(uri, headers: headers);
      break;
    default:
      resp = await http.get(uri, headers: headers);
      break;
  }

  if (resp.statusCode < 200 || resp.statusCode >= 300) {
    return [];
  }

  final jsonBody = json.decode(resp.body);
  final List<dynamic> list =
      (jsonBody is Map && jsonBody['data'] is List) ? jsonBody['data'] : [];

  return list.map<List<String>>((item) {
    if (item is Map<String, dynamic>) {
      return fields.map((f) => '${item[f] ?? ''}').toList();
    }
    return List.generate(fields.length, (_) => '');
  }).toList();
}
