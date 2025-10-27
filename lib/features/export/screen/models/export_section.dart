import 'package:flx_nocode_flutter/features/export/screen/models/export_table_section.dart';
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
