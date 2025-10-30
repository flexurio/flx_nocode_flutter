import 'package:flx_nocode_flutter/features/export/screen/models/export_table_section.dart';
import 'package:flx_nocode_flutter/src/app/util/string.dart';
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

/// ====== PDF EXTENSIONS (Compact-friendly) ======

extension ExportSignersSectionPdf on ExportSignersSection {
  /// [fontSize] default 9 untuk A5 compact
  /// [roleWeight] berat font untuk jabatan/role
  /// [topPadding] jarak atas blok tanda tangan
  /// [signGap] jarak antara role dan nama (area tanda tangan)
  pw.Widget toPdfWidget({
    double fontSize = 9,
    pw.FontWeight roleWeight = pw.FontWeight.bold,
    double topPadding = 14, // sebelumnya 30
    double signGap = 26, // sebelumnya 40
    bool drawLine = false, // opsional garis tanda tangan
    double lineWidth = 80,
    double lineThickness = 0.6,
  }) {
    return pw.Padding(
      padding: pw.EdgeInsets.only(top: topPadding),
      child: pw.DefaultTextStyle.merge(
        style: pw.TextStyle(fontSize: fontSize),
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: signers.map((s) {
            return pw.Column(
              mainAxisSize: pw.MainAxisSize.min,
              children: [
                pw.Text(
                  s.role,
                  style: pw.TextStyle(fontWeight: roleWeight),
                  textAlign: pw.TextAlign.center,
                ),
                pw.SizedBox(height: signGap),
                if (drawLine)
                  pw.Container(
                    width: lineWidth,
                    height: lineThickness,
                    color: PdfColors.black,
                  ),
                if (drawLine) pw.SizedBox(height: 4),
                pw.Text(
                  s.name,
                  textAlign: pw.TextAlign.center,
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

extension ExportFieldSectionPdf on ExportFieldSection {
  /// [fontSize] default 9 agar padat di A5
  /// [labelWidth] lebar kolom label (diperkecil dari 120)
  /// [vPadding] padding vertikal antar baris
  /// [labelWeight] ketebalan font label
  pw.Widget toPdfWidget(
    Map<String, dynamic> data, {
    double fontSize = 9,
    double labelWidth = 90, // sebelumnya 120
    double vPadding = 2, // sebelumnya 3
    pw.FontWeight labelWeight = pw.FontWeight.bold,
    pw.CrossAxisAlignment crossAxis = pw.CrossAxisAlignment.start,
  }) {
    return pw.Padding(
      padding: pw.EdgeInsets.symmetric(vertical: vPadding),
      child: pw.DefaultTextStyle.merge(
        style: pw.TextStyle(fontSize: fontSize),
        child: pw.Row(
          crossAxisAlignment: crossAxis,
          children: [
            pw.Container(
              width: labelWidth,
              child: pw.Text(
                label ?? '',
                style: pw.TextStyle(fontWeight: labelWeight),
              ),
            ),
            pw.Expanded(child: pw.Text((value ?? '').renderWithData(data))),
          ],
        ),
      ),
    );
  }
}
