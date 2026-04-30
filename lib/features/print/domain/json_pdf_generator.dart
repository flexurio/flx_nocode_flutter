import 'dart:typed_data';
import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/pdf_component_factory.dart';
import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/utils/pdf_data_utils.dart';
import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/utils/pdf_interpolation_utils.dart';
import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/utils/pdf_unit_utils.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'package:flx_nocode_flutter/shared/services/http_request_executor.dart';

class JsonPdfGenerator {
  /// Generates a PDF document from the provided LayoutPrint JSON specification.
  /// An optional [data] context can be provided for dynamic interpolation.
  /// An optional [executor] can be provided for handling http_data requests.
  static Future<Uint8List> generate(
    Map<String, dynamic> json, {
    Map<String, dynamic>? data,
    HttpRequestExecutor? executor,
  }) async {
    // 1. Initialize data context
    Map<String, dynamic> contextData =
        data != null ? Map<String, dynamic>.from(data) : {};

    // 2. Recursively fetch all http_data from the config
    await PdfDataUtils.fetchAllHttpData(json, contextData, executor: executor);

    // 3. Interpolate the JSON with the final data context
    final processed = PdfInterpolationUtils.interpolateJson(json, contextData);
    final Map<String, dynamic> processedJson = processed is Map
        ? Map<String, dynamic>.from(processed)
        : Map<String, dynamic>.from(json);

    try {
      final pdf = pw.Document();

      final layoutType = processedJson['layout_type']?.toString() ?? 'canvas';
    final unit = processedJson['unit'] as String? ?? 'pt';

    // Parse Page Size & Orientation
    PdfPageFormat format =
        PdfUnitUtils.parsePageSize(processedJson['page_size'], unit);

    final orientation = processedJson['orientation'] as String?;
    if (orientation == 'landscape') {
      format = format.landscape;
    }

    // Pre-load all images...
    final Map<String, pw.ImageProvider> imageCache = {};
    final Set<String> imageUrls = {};
    PdfDataUtils.extractImageUrls(processedJson, imageUrls);

    for (final url in imageUrls) {
      try {
        imageCache[url] = await networkImage(url);
      } catch (e) {
        // Ignore image load failures
      }
    }

    final dynamic rawHeader = processedJson['header'];
    final List<dynamic> globalHeader = rawHeader is List ? rawHeader : [];
    final dynamic rawFooter = processedJson['footer'];
    final List<dynamic> globalFooter = rawFooter is List ? rawFooter : [];

    if (layoutType == 'document') {
      final dynamic rawContent = processedJson['content'];
      final List<dynamic> content = rawContent is List ? rawContent : [];
      final margin = processedJson['margin'] != null 
          ? PdfUnitUtils.convertToPt(processedJson['margin'], unit) 
          : 20.0;

      pdf.addPage(
        pw.MultiPage(
          pageFormat: format,
          margin: pw.EdgeInsets.all(margin),
          header: (pw.Context context) {
            if (globalHeader.isEmpty) return pw.SizedBox();
            return pw.SizedBox(
              height: PdfUnitUtils.convertToPt(processedJson['header_height'] ?? 40, unit),
              child: pw.Stack(
                children: globalHeader.map((comp) {
                  if (comp is! Map) return pw.SizedBox();
                  return PdfComponentFactory.buildComponent(
                    Map<String, dynamic>.from(comp),
                    unit,
                    imageCache,
                  );
                }).toList(),
              ),
            );
          },
          footer: (pw.Context context) {
            if (globalFooter.isEmpty) return pw.SizedBox();
            return pw.SizedBox(
              height: PdfUnitUtils.convertToPt(processedJson['footer_height'] ?? 40, unit),
              child: pw.Stack(
                children: globalFooter.map((comp) {
                  if (comp is! Map) return pw.SizedBox();
                  return PdfComponentFactory.buildComponent(
                    Map<String, dynamic>.from(comp),
                    unit,
                    imageCache,
                  );
                }).toList(),
              ),
            );
          },
          build: (pw.Context context) {
            return content.map((comp) {
              try {
                if (comp is! Map) return pw.SizedBox();
                final Map<String, dynamic> compMap =
                    Map<String, dynamic>.from(comp);

                // If component has a margin, wrap it
                final marginVal = compMap['margin'];
                final type = compMap['type']?.toString();
                if (type == 'table' && compMap['data'] == null) {
                  compMap['data'] = contextData['data'];
                }

                pw.Widget widget = PdfComponentFactory.buildRawComponent(
                  compMap,
                  unit,
                  imageCache,
                );

                if (marginVal != null) {
                  final padding = PdfUnitUtils.parseEdgeInsets(marginVal, unit);
                  if (padding != null) {
                    widget = pw.Padding(padding: padding, child: widget);
                  }
                }

                return widget;
              } catch (e) {
                print('Error building PDF component: $e');
                return pw.SizedBox();
              }
            }).toList();
          },
        ),
      );
    } else {
      // CANVAS Layout
      final dynamic rawPages = processedJson['pages'];
      final List<dynamic> pages = rawPages is List ? rawPages : [];
      int pageCount = 0;
      for (final pageJson in pages) {
        if (pageJson is! Map) continue;
        final Map<String, dynamic> pageMap = Map<String, dynamic>.from(pageJson);
        final components = pageMap['components'] as List<dynamic>? ?? [];

        pdf.addPage(
          pw.Page(
            pageFormat: format,
            margin: pw.EdgeInsets.zero,
            build: (pw.Context context) {
              final allComponents = [
                ...globalHeader,
                ...components,
                ...globalFooter,
              ];

              return pw.SizedBox.expand(
                child: pw.Stack(
                  children: allComponents.map((comp) {
                    if (comp is! Map) return pw.SizedBox();
                    return PdfComponentFactory.buildComponent(
                      Map<String, dynamic>.from(comp),
                      unit,
                      imageCache,
                    );
                  }).toList(),
                ),
              );
            },
          ),
        );
        pageCount++;
      }

      if (pageCount == 0) {
        throw Exception('PDF document has no pages. Ensure "pages" is defined in the JSON configuration.');
      }
    }

    return pdf.save();
    } catch (e, stack) {
      print('PDF Generation Error: $e');
      print(stack);
      rethrow;
    }
  }
}
