import 'package:flx_nocode_flutter/features/export/screen/models/export_section.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ExportTableSection extends ExportSection {
  final String? endpoint;
  final String? method;
  final List<String>? columns;
  final List<String>? fields;
  final List<double>? columnWidths;

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
  /// Versi compact dengan opsi kustomisasi:
  /// - [fontSize]: ukuran font sel (default 9)
  /// - [headerFontSize]: ukuran font header (default 9.5)
  /// - [cellHPad]/[cellVPad]: padding horizontal/vertikal sel
  /// - [borderW]: ketebalan garis tabel
  /// - [zebra]: aktifkan striping baris ganjil
  /// - [scale]: skala keseluruhan tabel (mis. 0.92 untuk kompres)
  pw.Widget toPdfWidget(
    List<List<String>> data, {
    double fontSize = 9,
    double headerFontSize = 9.5,
    double cellHPad = 3,
    double cellVPad = 2,
    double borderW = 0.3,
    bool zebra = true,
    double? scale, // kalau mau kompres tambahan, mis. 0.92
  }) {
    final headers = columns ?? [];
    final widths = columnWidths ?? [];

    // build columnWidths map (0/negatif = auto/flex)
    final Map<int, pw.TableColumnWidth> widthMap = {};
    for (int i = 0;
        i <
            (headers.isNotEmpty
                ? headers.length
                : (data.isNotEmpty ? data.first.length : 0));
        i++) {
      if (i < widths.length) {
        final w = widths[i];
        if (w > 0) {
          widthMap[i] = pw.FixedColumnWidth(w);
        } else {
          widthMap[i] = const pw.FlexColumnWidth(); // auto
        }
      } else {
        widthMap[i] = const pw.FlexColumnWidth(); // default auto
      }
    }

    // auto-detect kolom numerik → align right
    Map<int, pw.Alignment> buildAlignments() {
      final Map<int, pw.Alignment> map = {};
      final int colCount = headers.isNotEmpty
          ? headers.length
          : (data.isNotEmpty ? data.first.length : 0);

      bool _isNumeric(String s) {
        final str = s.trim();
        if (str.isEmpty) return false;

        if (double.tryParse(str) != null) return true;

        final cleaned = str.replaceAll(' ', '');

        try {
          final en = NumberFormat('#,##0.###', 'en_US');
          en.parse(cleaned);
          return true;
        } catch (_) {}

        try {
          final eu = NumberFormat('#.##0,###', 'id_ID');
          eu.parse(cleaned);
          return true;
        } catch (_) {}

        return double.tryParse(cleaned.replaceAll(RegExp(r'[^\d\.-]'), '')) !=
            null;
      }

      for (int c = 0; c < colCount; c++) {
        final samples =
            data.take(10).map((r) => c < r.length ? r[c] : '').cast<String>();
        final numericRatio = samples.isEmpty
            ? 0.0
            : samples.where((s) => _isNumeric(s)).length / samples.length;
        map[c] = numericRatio >= 0.6
            ? pw.Alignment.centerRight
            : pw.Alignment.centerLeft;
      }
      return map;
    }

    final table = pw.Padding(
      padding: const pw.EdgeInsets.only(top: 6, bottom: 10),
      child: pw.TableHelper.fromTextArray(
        headers: headers,
        data: data,
        columnWidths: widthMap,
        // compact styles
        headerStyle: pw.TextStyle(
          fontSize: headerFontSize,
          fontWeight: pw.FontWeight.bold,
        ),
        cellStyle: pw.TextStyle(fontSize: fontSize),
        // compact paddings
        cellPadding:
            pw.EdgeInsets.symmetric(horizontal: cellHPad, vertical: cellVPad),
        // hairline borders
        border: pw.TableBorder(
          top: pw.BorderSide(width: borderW),
          bottom: pw.BorderSide(width: borderW),
          left: pw.BorderSide(width: borderW),
          right: pw.BorderSide(width: borderW),
          horizontalInside: pw.BorderSide(width: borderW * 0.8),
          verticalInside: pw.BorderSide(width: borderW * 0.8),
        ),
        // header shading ringan
        headerDecoration: const pw.BoxDecoration(
          color: PdfColor.fromInt(0xFFEAEAEA),
        ),
        // zebra row agar tetap terbaca walau padat
        oddRowDecoration: zebra
            ? const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF7F7F7))
            : null,
        // auto alignment (angka → kanan)
        cellAlignments: buildAlignments(),
      ),
    );

    // opsi kompres tabel ekstra
    if (scale != null && scale > 0 && scale != 1.0) {
      return pw.Transform.scale(scale: scale, child: table);
    }
    return table;
  }
}
