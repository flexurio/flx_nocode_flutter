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
    final Map<String, dynamic> processedJson = Map<String, dynamic>.from(
        PdfInterpolationUtils.interpolateJson(json, contextData) as Map);

    try {
      final pdf = pw.Document();

    final layoutType = processedJson['layout_type'] as String? ?? 'canvas';
    if (layoutType != 'canvas') {
      throw UnimplementedError('Only canvas layout is supported for now');
    }

    final unit = processedJson['unit'] as String? ?? 'pt';

    // Parse Page Size & Orientation
    PdfPageFormat format =
        PdfUnitUtils.parsePageSize(processedJson['page_size'], unit);

    final orientation = processedJson['orientation'] as String?;
    if (orientation == 'landscape') {
      format = format.landscape;
    }

    // Pre-load all images to memory because pw.Page build must be synchronous
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

    final globalHeader = processedJson['header'] as List<dynamic>? ?? [];
    final globalFooter = processedJson['footer'] as List<dynamic>? ?? [];
    final pages = processedJson['pages'] as List<dynamic>? ?? [];

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

    return pdf.save();
    } catch (e, stack) {
      print('PDF Generation Error: $e');
      print(stack);
      rethrow;
    }
  }
}
