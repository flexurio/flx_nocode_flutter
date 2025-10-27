import 'package:flx_nocode_flutter/features/export/screen/models/export_section.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ExportTableSection extends ExportSection {
  final String? endpoint;
  final String? method;
  final List<String>? columns;
  final List<String>? fields;
  final List<double>? columnWidths; // ⬅️ tambahan

  ExportTableSection({
    this.endpoint,
    this.method,
    this.columns,
    this.fields,
    this.columnWidths,
  }) : super('table');

  factory ExportTableSection.fromJson(Map<String, dynamic> json) {
    return ExportTableSection(
      endpoint: json['endpoint'],
      method: json['method'],
      columns:
          json['columns'] != null ? List<String>.from(json['columns']) : null,
      fields: json['fields'] != null ? List<String>.from(json['fields']) : null,
      columnWidths: json['column_widths'] != null
          ? (json['column_widths'] as List)
              .map((e) => double.tryParse(e.toString()) ?? 0)
              .toList()
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        if (endpoint != null) 'endpoint': endpoint,
        if (method != null) 'method': method,
        if (columns != null) 'columns': columns,
        if (fields != null) 'fields': fields,
        if (columnWidths != null) 'column_widths': columnWidths,
      };
}

extension ExportTableSectionPdf on ExportTableSection {
  pw.Widget toPdfWidget(List<List<String>> data) {
    final headers = columns ?? [];
    final widths = columnWidths ?? [];

    // Konversi width list jadi Map<int, TableColumnWidth>
    final Map<int, pw.TableColumnWidth> widthMap = {};
    for (int i = 0; i < widths.length; i++) {
      final w = widths[i];
      if (w > 0) widthMap[i] = pw.FixedColumnWidth(w);
    }

    return pw.Padding(
      padding: const pw.EdgeInsets.only(top: 10, bottom: 16),
      child: pw.TableHelper.fromTextArray(
        headers: headers,
        data: data,
        headerStyle: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
        cellStyle: const pw.TextStyle(fontSize: 10),
        headerDecoration:
            const pw.BoxDecoration(color: PdfColor.fromInt(0xFFE0E0E0)),
        border: pw.TableBorder(
          top: pw.BorderSide(width: 0.5),
          bottom: pw.BorderSide(width: 0.5),
          left: pw.BorderSide(width: 0.5),
          right: pw.BorderSide(width: 0.5),
          horizontalInside: pw.BorderSide(width: 0.3),
          verticalInside: pw.BorderSide(width: 0.3),
        ),
        columnWidths: widthMap, // ⬅️ pakai widthMap di sini
        cellAlignments: {
          0: pw.Alignment.centerLeft,
          1: pw.Alignment.center,
          2: pw.Alignment.centerLeft,
          3: pw.Alignment.center,
          4: pw.Alignment.centerRight,
        },
      ),
    );
  }
}
