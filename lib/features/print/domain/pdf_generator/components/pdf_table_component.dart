import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../utils/pdf_unit_utils.dart';
import '../utils/pdf_interpolation_utils.dart';

class PdfTableComponent {
  static pw.Widget build(
    Map<String, dynamic> comp,
    String defaultUnit,
    Map<String, pw.ImageProvider> imageCache,
    Function(Map<String, dynamic>, String, Map<String, pw.ImageProvider>) buildRawChild,
  ) {
    final columns = comp['columns'] as List<dynamic>? ?? [];
    final data = comp['data'] as List<dynamic>? ?? [];

    final headers = columns.map((c) => c['header']?.toString() ?? '').toList();
    final keys = columns.map((c) => c['key']?.toString() ?? '').toList();

    final columnWidths = <int, pw.TableColumnWidth>{};
    for (var i = 0; i < columns.length; i++) {
      var flex = columns[i]['flex'];
      if (flex is String) {
        flex = double.tryParse(flex);
      }
      if (flex is num) {
        columnWidths[i] = pw.FlexColumnWidth(flex.toDouble());
      }
    }

    final bool showHeader = comp['show_header'] as bool? ?? true;
    final bool showBody = comp['show_body'] as bool? ?? true;

    final tableRows = <pw.TableRow>[];
    final headerBgColor = comp['header_background_color'] != null
        ? PdfColor.fromHex(comp['header_background_color'].toString())
        : null;
    final headerTextColor = comp['header_text_color'] != null
        ? PdfColor.fromHex(comp['header_text_color'].toString())
        : (headerBgColor != null ? PdfColors.white : PdfColors.black);

    final cellPadding = PdfUnitUtils.parseEdgeInsets(comp['cell_padding'], defaultUnit) ??
        const pw.EdgeInsets.all(4);

    if (showHeader) {
      tableRows.add(
        pw.TableRow(
          decoration: pw.BoxDecoration(color: headerBgColor),
          children: List.generate(columns.length, (colIndex) {
            final header = headers[colIndex];
            final colConfig = columns[colIndex] as Map;
            final colAlign = colConfig['align']?.toString().toLowerCase();
            
            pw.Alignment alignment = pw.Alignment.centerLeft;
            if (colAlign == 'center' || colAlign == 'middle') {
              alignment = pw.Alignment.center;
            } else if (colAlign == 'right' || colAlign == 'end') {
              alignment = pw.Alignment.centerRight;
            }

            return pw.Container(
              padding: cellPadding,
              alignment: alignment,
              child: pw.Text(
                header,
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 10,
                  color: headerTextColor,
                ),
              ),
            );
          }),
        ),
      );
    }

    if (showBody) {
      int rowIndex = 0;
      for (final rawRow in data) {
        if (rawRow is! Map) continue;
        final row = Map<String, dynamic>.from(rawRow);
        tableRows.add(
          pw.TableRow(
            children: List.generate(keys.length, (colIndex) {
              final key = keys[colIndex];
              final colConfig = columns[colIndex] as Map;
              var cellData = row[key];

              final rowContext = {
                'data': row,
                'index': rowIndex,
                'no': rowIndex + 1,
              };

              if (colConfig.containsKey('value')) {
                cellData = PdfInterpolationUtils.interpolate(
                  colConfig['value'],
                  rowContext,
                );
              }

              if (colConfig.containsKey('templates') || colConfig.containsKey('template')) {
                final templates = colConfig['templates'] as List<dynamic>?;
                final singleTemplate = colConfig['template'] as Map<String, dynamic>?;

                Map<String, dynamic>? selectedTemplate;
                if (templates != null && templates.isNotEmpty) {
                  selectedTemplate = templates[rowIndex % templates.length] as Map<String, dynamic>?;
                } else if (singleTemplate != null) {
                  selectedTemplate = singleTemplate;
                }

                if (selectedTemplate != null) {
                  cellData = PdfInterpolationUtils.interpolate(
                    selectedTemplate,
                    rowContext,
                  );
                }
              }

              pw.Widget cellWidget;
              if (cellData is Map && cellData.containsKey('type')) {
                cellWidget = buildRawChild(Map<String, dynamic>.from(cellData), defaultUnit, imageCache);
              } else {
                cellWidget = pw.Text(
                  cellData?.toString() ?? '',
                  style: const pw.TextStyle(fontSize: 10),
                );
              }

              final colAlign = colConfig['align']?.toString().toLowerCase();
              pw.Alignment alignment = pw.Alignment.centerLeft;
              if (colAlign == 'center' || colAlign == 'middle') {
                alignment = pw.Alignment.center;
              } else if (colAlign == 'right' || colAlign == 'end') {
                alignment = pw.Alignment.centerRight;
              }

              return pw.Container(
                padding: cellPadding,
                alignment: alignment,
                child: cellWidget,
              );
            }),
          ),
        );
        rowIndex++;
      }
    }

    return pw.Table(
      columnWidths: columnWidths,
      border: pw.TableBorder.all(color: PdfColors.grey400, width: 0.5),
      children: tableRows,
    );
  }
}
