import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'signer.dart';

abstract class ExportSection {
  final String type;

  ExportSection(this.type);

  factory ExportSection.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'field':
        return ExportFieldSection.fromJson(json);
      case 'table':
        return ExportTableSection.fromJson(json);
      case 'signers':
        return ExportSignersSection.fromJson(json);
      default:
        throw Exception('Unknown ExportSection type: ${json['type']}');
    }
  }

  Map<String, dynamic> toJson();
}

/// FIELD SECTION
class ExportFieldSection extends ExportSection {
  final String? label;
  final String? value;

  ExportFieldSection({this.label, this.value}) : super('field');

  factory ExportFieldSection.fromJson(Map<String, dynamic> json) {
    return ExportFieldSection(
      label: json['label'],
      value: json['value'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        if (label != null) 'label': label,
        if (value != null) 'value': value,
      };
}

/// TABLE SECTION
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

/// SIGNERS SECTION
class ExportSignersSection extends ExportSection {
  final List<Signer> signers;

  ExportSignersSection({this.signers = const []}) : super('signers');

  factory ExportSignersSection.fromJson(Map<String, dynamic> json) {
    final List<dynamic> data = json['data'] ?? [];
    return ExportSignersSection(
      signers: data.map((e) => Signer.fromJson(e)).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'data': signers.map((e) => e.toJson()).toList(),
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

extension ExportSignersSectionPdf on ExportSignersSection {
  pw.Widget toPdfWidget() {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(top: 30),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
        children: signers.map((s) {
          return pw.Column(
            children: [
              pw.Text(
                s.role,
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 40),
              pw.Text(s.name),
            ],
          );
        }).toList(),
      ),
    );
  }
}

extension ExportFieldSectionPdf on ExportFieldSection {
  pw.Widget toPdfWidget() {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 3),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Container(
            width: 120,
            child: pw.Text(
              label ?? '',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.Expanded(child: pw.Text(value ?? '')),
        ],
      ),
    );
  }
}
