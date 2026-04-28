import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

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

    // Pre-load all images to memory because pw.Page build must be synchronous
    final Map<String, pw.ImageProvider> imageCache = {};
    final Set<String> imageUrls = {};
    _extractImageUrls(json, imageUrls);

    for (final url in imageUrls) {
      try {
        imageCache[url] = await networkImage(url);
      } catch (e) {
        // Ignore image load failures in demo
      }
    }

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
                return _buildComponent(comp, json['unit'] as String? ?? 'pt', imageCache);
              }).toList(),
            );
          },
        ),
      );
    }

    return pdf.save();
  }

  static pw.Widget _buildComponent(Map<String, dynamic> comp, String defaultUnit, Map<String, pw.ImageProvider> imageCache) {
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
      case 'image':
        final url = comp['url']?.toString();
        if (url != null && imageCache.containsKey(url)) {
          final fitStr = comp['fit']?.toString();
          pw.BoxFit fit = pw.BoxFit.contain;
          if (fitStr == 'cover') fit = pw.BoxFit.cover;
          if (fitStr == 'fill') fit = pw.BoxFit.fill;

          widget = pw.Image(
            imageCache[url]!,
            width: width,
            height: height,
            fit: fit,
          );
        } else {
          widget = pw.SizedBox(width: width, height: height);
        }
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
        
        final columnWidths = <int, pw.TableColumnWidth>{};
        for (var i = 0; i < columns.length; i++) {
          final flex = columns[i]['flex'];
          if (flex is num) {
            columnWidths[i] = pw.FlexColumnWidth(flex.toDouble());
          }
        }

        final tableRows = <pw.TableRow>[];
        
        // Add header row
        tableRows.add(
          pw.TableRow(
            decoration: const pw.BoxDecoration(color: PdfColors.blueGrey),
            children: headers.map((header) {
              return pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: pw.Text(
                  header,
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10, color: PdfColors.white),
                ),
              );
            }).toList(),
          ),
        );

        // Add data rows
        for (final row in data) {
          if (row is! Map<String, dynamic>) continue;
          tableRows.add(
            pw.TableRow(
              children: keys.map((key) {
                final cellData = row[key];
                pw.Widget cellWidget;
                
                if (cellData is Map<String, dynamic> && cellData.containsKey('type')) {
                  // If the cell data is a component map, build it!
                  // Provide width/height constraints if none provided, or wrap it properly.
                  final parsedWidget = _buildComponent(cellData, defaultUnit, imageCache);
                  // _buildComponent wraps in Positioned if x/y are provided, but in a table cell we don't want absolute positioning usually.
                  // However, _buildComponent always wraps in Positioned. Let's extract the child if x/y are 0.
                  // Actually, let's just make a modified buildComponent or let Positioned exist in a Stack.
                  // Since _buildComponent returns a Positioned, inside a table cell (which is a flex container), Positioned might break.
                  // Let's create a helper that returns raw widget.
                  cellWidget = _buildRawComponent(cellData, defaultUnit, imageCache);
                } else {
                  // It's a plain string/number
                  cellWidget = pw.Text(
                    cellData?.toString() ?? '',
                    style: const pw.TextStyle(fontSize: 10),
                  );
                }

                return pw.Container(
                  padding: const pw.EdgeInsets.all(4),
                  child: cellWidget,
                );
              }).toList(),
            ),
          );
        }

        widget = pw.Table(
          columnWidths: columnWidths,
          border: pw.TableBorder.all(color: PdfColors.grey400, width: 0.5),
          children: tableRows,
        );
        break;
      case 'column':
        final childrenJson = comp['children'] as List<dynamic>? ?? [];
        widget = pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: childrenJson.map((c) {
            if (c is! Map<String, dynamic>) return pw.SizedBox();
            // Important: inner components in a column/row use raw builder to avoid Positioned wrappers
            return _buildRawComponent(c, defaultUnit, imageCache);
          }).toList(),
        );
        break;
      case 'row':
        final childrenJson = comp['children'] as List<dynamic>? ?? [];
        widget = pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: childrenJson.map((c) {
            if (c is! Map<String, dynamic>) return pw.SizedBox();
            // Important: inner components in a column/row use raw builder to avoid Positioned wrappers
            return _buildRawComponent(c, defaultUnit, imageCache);
          }).toList(),
        );
        break;
      default:
        widget = pw.SizedBox();
    }

    if (width != null || height != null) {
      // Force dimensions if specified and not handled by component
      if (type != 'qrcode' && type != 'barcode' && type != 'shape' && type != 'image') {
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

  static pw.Widget _buildRawComponent(Map<String, dynamic> comp, String defaultUnit, Map<String, pw.ImageProvider> imageCache) {
    // This is identical to _buildComponent but without the pw.Positioned wrapper, useful for Table Cells
    final type = comp['type'] as String?;
    final width = comp['width'] != null ? _convertToPt(comp['width'], defaultUnit) : null;
    final height = comp['height'] != null ? _convertToPt(comp['height'], defaultUnit) : null;

    pw.Widget widget;

    switch (type) {
      case 'text':
        widget = pw.Text(
          comp['value']?.toString() ?? '',
          style: pw.TextStyle(
            fontSize: _convertToPt(comp['font_size'] ?? 12, 'pt'),
          ),
        );
        break;
      case 'image':
        final url = comp['url']?.toString();
        if (url != null && imageCache.containsKey(url)) {
          final fitStr = comp['fit']?.toString();
          pw.BoxFit fit = pw.BoxFit.contain;
          if (fitStr == 'cover') fit = pw.BoxFit.cover;
          if (fitStr == 'fill') fit = pw.BoxFit.fill;

          widget = pw.Image(
            imageCache[url]!,
            width: width,
            height: height,
            fit: fit,
          );
        } else {
          widget = pw.SizedBox(width: width, height: height);
        }
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
      case 'column':
        final childrenJson = comp['children'] as List<dynamic>? ?? [];
        widget = pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: childrenJson.map((c) {
            if (c is! Map<String, dynamic>) return pw.SizedBox();
            return _buildRawComponent(c, defaultUnit, imageCache);
          }).toList(),
        );
        break;
      case 'row':
        final childrenJson = comp['children'] as List<dynamic>? ?? [];
        widget = pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: childrenJson.map((c) {
            if (c is! Map<String, dynamic>) return pw.SizedBox();
            return _buildRawComponent(c, defaultUnit, imageCache);
          }).toList(),
        );
        break;
      case 'container':
        final childJson = comp['child'] as Map<String, dynamic>?;
        final padding = _convertToPt(comp['padding'], defaultUnit);
        final margin = _convertToPt(comp['margin'], defaultUnit);
        final borderColorStr = comp['border_color']?.toString();
        final borderWidth = (comp['border_width'] as num?)?.toDouble();
        final bgColorStr = comp['background_color']?.toString();
        
        pw.Widget? childWidget;
        if (childJson != null) {
          childWidget = _buildRawComponent(childJson, defaultUnit, imageCache);
        }

        pw.BoxDecoration? decoration;
        if (borderColorStr != null || borderWidth != null || bgColorStr != null) {
          decoration = pw.BoxDecoration(
            color: bgColorStr != null ? PdfColor.fromHex(bgColorStr) : null,
            border: (borderColorStr != null || borderWidth != null) ? pw.Border.all(
              color: borderColorStr != null ? PdfColor.fromHex(borderColorStr) : PdfColors.black,
              width: borderWidth ?? 1.0,
            ) : null,
          );
        }

        widget = pw.Container(
          width: width,
          height: height,
          padding: padding > 0 ? pw.EdgeInsets.all(padding) : null,
          margin: margin > 0 ? pw.EdgeInsets.all(margin) : null,
          decoration: decoration,
          child: childWidget ?? pw.SizedBox(),
        );
        break;
      default:
        widget = pw.Text(comp.toString()); // Fallback
    }

    if (width != null || height != null) {
      if (type != 'qrcode' && type != 'barcode' && type != 'shape' && type != 'image' && type != 'container') {
         widget = pw.SizedBox(width: width, height: height, child: widget);
      }
    }

    return widget;
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

  static void _extractImageUrls(dynamic json, Set<String> urls) {
    if (json is Map) {
      if (json['type'] == 'image' && json['url'] != null) {
        urls.add(json['url'].toString());
      }
      for (final value in json.values) {
        _extractImageUrls(value, urls);
      }
    } else if (json is List) {
      for (final value in json) {
        _extractImageUrls(value, urls);
      }
    }
  }
}
