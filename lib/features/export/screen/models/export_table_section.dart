import 'package:flx_nocode_flutter/features/export/screen/models/export_section.dart';
import 'package:flx_nocode_flutter/src/app/util/string.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

/// ===== Model untuk footer dari JSON =====

class ExportTableFooterStyle {
  final bool? bold;
  final double? borderTop;

  const ExportTableFooterStyle({this.bold, this.borderTop});

  factory ExportTableFooterStyle.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const ExportTableFooterStyle();
    return ExportTableFooterStyle(
      bold: json['bold'] == true,
      borderTop: json['border_top'] == null
          ? null
          : (double.tryParse(json['border_top'].toString()) ??
              (json['border_top'] is int
                  ? (json['border_top'] as int).toDouble()
                  : null)),
    );
  }

  Map<String, dynamic> toJson() => {
        if (bold != null) 'bold': bold,
        if (borderTop != null) 'border_top': borderTop,
      };
}

class ExportTableFooter {
  final List<String> cells;
  final ExportTableFooterStyle style;

  const ExportTableFooter({
    required this.cells,
    this.style = const ExportTableFooterStyle(),
  });

  factory ExportTableFooter.fromJson(Map<String, dynamic> json) {
    return ExportTableFooter(
      cells: List<String>.from(json['cells'] ?? const <String>[]),
      style: ExportTableFooterStyle.fromJson(
        json['style'] is Map<String, dynamic>
            ? json['style'] as Map<String, dynamic>
            : null,
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'cells': cells,
        if (style.bold != null || style.borderTop != null)
          'style': style.toJson(),
      };
}

/// ===== Section utama =====

class ExportTableSection extends ExportSection {
  final String? endpoint;
  final String? method;
  final List<String>? columns;
  final List<String>? fields;
  final List<double>? columnWidths;
  final List<ExportTableFooter>? footers;

  ExportTableSection({
    this.endpoint,
    this.method,
    this.columns,
    this.fields,
    this.columnWidths,
    this.footers,
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
      footers: (json['footers'] as List?)
          ?.where((e) => e is Map<String, dynamic>)
          .map((e) => ExportTableFooter.fromJson(e as Map<String, dynamic>))
          .toList(),
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
        if (footers != null)
          'footers': footers!.map((e) => e.toJson()).toList(),
      };
}

extension ExportTableSectionPdf on ExportTableSection {
  /// Enhanced compact table dengan desain modern dan minimalis
  ///
  /// Improvements:
  /// - **Hapus semua background color, gunakan putih/transparan.**
  /// - Border yang lebih tegas dan jelas
  /// - Visual hierarchy yang lebih baik
  /// - Footer dengan styling konsisten
  pw.Widget toPdfWidget({
    required List<List<String>> data,
    required Map<String, dynamic> dataHeader,
    double fontSize = 9,
    double headerFontSize = 9.5,
    double cellHPad = 3,
    double cellVPad = 2,
    double borderW = 0.3,
    bool zebra = true,
    double? scale,
  }) {
    final headers = columns ?? [];
    final widths = columnWidths ?? [];

    final int colCount = headers.isNotEmpty
        ? headers.length
        : (data.isNotEmpty ? data.first.length : 0);

    final Map<int, pw.TableColumnWidth> widthMap = {};
    for (int i = 0; i < colCount; i++) {
      if (i < widths.length) {
        final w = widths[i];
        if (w > 0) {
          widthMap[i] = pw.FixedColumnWidth(w);
        } else {
          widthMap[i] = const pw.FlexColumnWidth();
        }
      } else {
        widthMap[i] = const pw.FlexColumnWidth();
      }
    }

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

    Map<int, pw.Alignment> buildAlignments() {
      final Map<int, pw.Alignment> map = {};
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

    final alignments = buildAlignments();

    // Tabel utama dengan border tegas dan **background putih**
    final mainTable = pw.Padding(
      padding: const pw.EdgeInsets.only(top: 6, bottom: 6),
      child: pw.TableHelper.fromTextArray(
        headers: headers,
        data: data,
        columnWidths: widthMap,
        headerStyle: pw.TextStyle(
          fontSize: headerFontSize,
          fontWeight: pw.FontWeight.bold,
        ),
        cellStyle: pw.TextStyle(fontSize: fontSize),
        cellPadding:
            pw.EdgeInsets.symmetric(horizontal: cellHPad, vertical: cellVPad),
        border: pw.TableBorder(
          top: pw.BorderSide(width: borderW * 2),
          bottom: pw.BorderSide(width: borderW * 2),
          left: pw.BorderSide(width: borderW),
          right: pw.BorderSide(width: borderW),
          horizontalInside: pw.BorderSide(width: borderW),
          verticalInside: pw.BorderSide(width: borderW),
        ),
        // Menghilangkan background color header (dijadikan transparan/putih)
        headerDecoration: const pw.BoxDecoration(
          color: PdfColors.white, // Diubah dari 0xFFE0E0E0 ke putih
        ),
        // Menghilangkan zebra striping (dijadikan null atau putih)
        oddRowDecoration: zebra
            ? const pw.BoxDecoration(
                color: PdfColors.white) // Diubah dari 0xFFF5F5F5 ke putih
            : null,
        cellAlignments: alignments,
      ),
    );

    // Footer row builder dengan styling konsisten
    pw.Widget _buildFooterRow(
        ExportTableFooter footer, Map<String, dynamic> data) {
      final bold = footer.style.bold == true;
      final topW = footer.style.borderTop;

      final List<String> cells = [
        ...footer.cells.take(colCount),
        ...List<String>.filled(colCount - footer.cells.length, ''),
      ];

      final row = pw.Table(
        columnWidths: widthMap,
        border: pw.TableBorder(
          left: pw.BorderSide(width: borderW),
          right: pw.BorderSide(width: borderW),
          horizontalInside: pw.BorderSide(width: borderW),
        ),
        children: [
          pw.TableRow(
            // Menghilangkan background color footer bold (dijadikan transparan/putih)
            decoration: bold
                ? const pw.BoxDecoration(
                    color: PdfColors.white) // Diubah dari 0xFFE0E0E0 ke putih
                : null,
            children: List.generate(colCount, (c) {
              return pw.Container(
                alignment:
                    (c < colCount ? alignments[c] : pw.Alignment.centerLeft) ??
                        pw.Alignment.centerLeft,
                padding: pw.EdgeInsets.symmetric(
                  horizontal: cellHPad,
                  vertical: cellVPad + 1,
                ),
                child: pw.Text(
                  cells[c].renderWithData(data),
                  style: pw.TextStyle(
                    fontSize: fontSize,
                    fontWeight:
                        bold ? pw.FontWeight.bold : pw.FontWeight.normal,
                  ),
                ),
              );
            }),
          ),
        ],
      );

      if (topW != null && topW > 0) {
        return pw.Container(
          decoration: pw.BoxDecoration(
            border: pw.Border(top: pw.BorderSide(width: topW)),
          ),
          child: row,
        );
      }
      return row;
    }

    // Render footers
    final List<pw.Widget> footerWidgets = [];
    if (footers != null && footers!.isNotEmpty) {
      for (final f in footers!) {
        footerWidgets.add(_buildFooterRow(f, dataHeader));
      }
      // Bottom border tegas
      footerWidgets.add(
        pw.Container(
          decoration: pw.BoxDecoration(
            border: pw.Border(
              bottom: pw.BorderSide(width: borderW * 2),
              left: pw.BorderSide(width: borderW),
              right: pw.BorderSide(width: borderW),
            ),
          ),
          height: 0.01,
        ),
      );
    }

    final content = pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: [
        mainTable,
        ...footerWidgets,
        pw.SizedBox(height: 8),
      ],
    );

    if (scale != null && scale > 0 && scale != 1.0) {
      return pw.Transform.scale(scale: scale, child: content);
    }
    return content;
  }
}
