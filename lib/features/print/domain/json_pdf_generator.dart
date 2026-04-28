import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class JsonPdfGenerator {
  /// Generates a PDF document from the provided LayoutPrint JSON specification.
  static Future<Uint8List> generate(Map<String, dynamic> json) async {
    final pdf = pw.Document();

    final layoutType = json['layout_type'] as String? ?? 'canvas';
    if (layoutType != 'canvas') {
      throw UnimplementedError('Only canvas layout is supported for now');
    }

    // Parse Page Size
    PdfPageFormat format = PdfPageFormat.a4;
    final pageSize = json['page_size'];
    if (pageSize is List && pageSize.length == 2) {
      // Need to convert to pt based on unit
      final unit = json['unit'] as String? ?? 'pt';
      final width = _convertToPt(pageSize[0], unit);
      final height = _convertToPt(pageSize[1], unit);
      format = PdfPageFormat(width, height);
    } else if (pageSize is String) {
      if (pageSize.toUpperCase() == 'A4') format = PdfPageFormat.a4;
      if (pageSize.toUpperCase() == 'LETTER') format = PdfPageFormat.letter;
    }

    final orientation = json['orientation'] as String?;
    if (orientation == 'landscape') {
      format = format.landscape;
    }

    final pages = json['pages'] as List<dynamic>? ?? [];

    for (final pageJson in pages) {
      if (pageJson is! Map<String, dynamic>) continue;

      final components = pageJson['components'] as List<dynamic>? ?? [];

      pdf.addPage(
        pw.Page(
          pageFormat: format,
          margin: pw.EdgeInsets.zero, // Canvas mode typically uses 0 margins, everything is absolute
          build: (pw.Context context) {
            return pw.Stack(
              children: components.map((comp) {
                if (comp is! Map<String, dynamic>) return pw.SizedBox();
                return _buildComponent(comp, json['unit'] as String? ?? 'pt');
              }).toList(),
            );
          },
        ),
      );
    }

    return pdf.save();
  }

  static pw.Widget _buildComponent(Map<String, dynamic> comp, String defaultUnit) {
    final type = comp['type'] as String?;
    final x = _convertToPt(comp['x'], defaultUnit);
    final y = _convertToPt(comp['y'], defaultUnit);
    final width = comp['width'] != null ? _convertToPt(comp['width'], defaultUnit) : null;
    final height = comp['height'] != null ? _convertToPt(comp['height'], defaultUnit) : null;

    pw.Widget widget;

    switch (type) {
      case 'text':
        widget = pw.Text(
          comp['value']?.toString() ?? '',
          style: pw.TextStyle(
            fontSize: _convertToPt(comp['font_size'] ?? 12, 'pt'), // default pt
            // Note: Add full style parsing later
          ),
        );
        break;
      case 'qrcode':
        widget = pw.BarcodeWidget(
          barcode: pw.Barcode.qrCode(),
          data: comp['value']?.toString() ?? '',
          width: comp['size'] != null ? _convertToPt(comp['size'], defaultUnit) : 50,
          height: comp['size'] != null ? _convertToPt(comp['size'], defaultUnit) : 50,
        );
        break;
      case 'barcode':
        pw.Barcode barcode;
        final format = comp['format']?.toString().toUpperCase();
        if (format == 'CODE_128' || format == 'CODE128') {
          barcode = pw.Barcode.code128();
        } else {
          barcode = pw.Barcode.code39();
        }

        widget = pw.BarcodeWidget(
          barcode: barcode,
          data: comp['value']?.toString() ?? '',
          drawText: comp['show_text'] as bool? ?? true,
          width: width ?? 100,
          height: height ?? 30,
        );
        break;
      case 'shape':
        final shapeType = comp['shape_type'] as String?;
        if (shapeType == 'line') {
          // Simple line simulation using a container with border
          widget = pw.Container(
            width: width ?? 1,
            height: height ?? 1,
            decoration: pw.BoxDecoration(
              border: pw.Border(
                left: pw.BorderSide(
                  color: PdfColors.black,
                  width: (comp['border_width'] as num?)?.toDouble() ?? 1.0,
                ),
              ),
            ),
          );
        } else if (shapeType == 'rect') {
          widget = pw.Container(
            width: width,
            height: height,
            decoration: pw.BoxDecoration(
              border: pw.Border.all(
                color: PdfColors.black,
                width: (comp['border_width'] as num?)?.toDouble() ?? 1.0,
              ),
            ),
          );
        } else {
          widget = pw.SizedBox(width: width, height: height);
        }
        break;
      case 'table':
        final columns = comp['columns'] as List<dynamic>? ?? [];
        final data = comp['data'] as List<dynamic>? ?? [];
        
        final headers = columns.map((c) => c['header']?.toString() ?? '').toList();
        final keys = columns.map((c) => c['key']?.toString() ?? '').toList();
        
        final tableData = data.map((row) {
          if (row is! Map<String, dynamic>) return keys.map((_) => '').toList();
          return keys.map((key) => row[key]?.toString() ?? '').toList();
        }).toList();

        final columnWidths = <int, pw.TableColumnWidth>{};
        for (var i = 0; i < columns.length; i++) {
          final flex = columns[i]['flex'];
          if (flex is num) {
            columnWidths[i] = pw.FlexColumnWidth(flex.toDouble());
          }
        }

        widget = pw.TableHelper.fromTextArray(
          headers: headers,
          data: tableData,
          columnWidths: columnWidths,
          border: pw.TableBorder.all(color: PdfColors.grey400, width: 0.5),
          headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10, color: PdfColors.white),
          headerDecoration: const pw.BoxDecoration(color: PdfColors.blueGrey),
          cellStyle: const pw.TextStyle(fontSize: 10),
          cellPadding: const pw.EdgeInsets.all(4),
        );
        break;
      default:
        widget = pw.SizedBox();
    }

    if (width != null || height != null) {
      // Force dimensions if specified and not handled by component
      if (type != 'qrcode' && type != 'barcode' && type != 'shape') {
         widget = pw.SizedBox(width: width, height: height, child: widget);
      }
    }

    final rotation = comp['rotation'] as num?;
    if (rotation != null) {
      widget = pw.Transform.rotateBox(
        angle: rotation * (3.1415926535897932 / 180),
        child: widget,
      );
    }

    return pw.Positioned(
      left: x,
      top: y,
      child: widget,
    );
  }

  static double _convertToPt(dynamic value, String unit) {
    if (value == null) return 0.0;
    double val = (value as num).toDouble();
    switch (unit) {
      case 'mm':
        return val * 2.83465;
      case 'cm':
        return val * 28.3465;
      case 'in':
        return val * 72.0;
      case 'px':
        return val * 0.75; // Approx
      case 'pt':
      default:
        return val;
    }
  }
}
