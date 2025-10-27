import 'package:flx_nocode_flutter/features/export/screen/models/export_section.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ExportTableSection extends ExportSection {
  final String? endpoint;
  final String? method;
  final List<String>? columns;
  final List<String>? fields;

  ExportTableSection({
    this.endpoint,
    this.method,
    this.columns,
    this.fields,
  }) : super('table');

  factory ExportTableSection.fromJson(Map<String, dynamic> json) {
    return ExportTableSection(
      endpoint: json['endpoint'],
      method: json['method'],
      columns:
          json['columns'] != null ? List<String>.from(json['columns']) : null,
      fields: json['fields'] != null ? List<String>.from(json['fields']) : null,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        if (endpoint != null) 'endpoint': endpoint,
        if (method != null) 'method': method,
        if (columns != null) 'columns': columns,
        if (fields != null) 'fields': fields,
      };
}

extension ExportTableSectionPdf on ExportTableSection {
  pw.Widget toPdfWidget(List<List<String>> data) {
    final headers = columns ?? [];

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
