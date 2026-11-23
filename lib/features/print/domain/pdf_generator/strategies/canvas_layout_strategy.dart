import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import '../components/pdf_watermark_component.dart';
import '../models/pdf_watermark_model.dart';
import '../pdf_component_factory.dart';
import '../utils/pdf_interpolation_utils.dart';
import '../utils/pdf_visibility_utils.dart';
import 'pdf_layout_strategy.dart';

class CanvasLayoutStrategy implements PdfLayoutStrategy {
  @override
  Future<void> build({
    required pw.Document pdf,
    required Map<String, dynamic> processedJson,
    required PdfPageFormat format,
    required String unit,
    required Map<String, pw.ImageProvider> imageCache,
    required List<dynamic> globalHeader,
    required List<dynamic> globalFooter,
    Map<String, dynamic> contextData = const {},
    PdfWatermarkModel? watermark,
  }) async {
    final rawPages = processedJson['pages'];
    final List<dynamic> pages = rawPages is List ? rawPages : [];

    final showWatermark = watermark != null &&
        watermark.hasContent &&
        PdfVisibilityUtils.isVisible(watermark.visibleIf, contextData);

    final totalPages = pages.whereType<Map>().length;
    int pageCount = 0;

    for (final pageJson in pages) {
      if (pageJson is! Map) continue;
      final pageNumber = pageCount + 1;
      final Map<String, dynamic> pageMap = Map<String, dynamic>.from(pageJson);
      final components = pageMap['components'] as List<dynamic>? ?? [];

      pdf.addPage(
        pw.Page(
          pageFormat: format,
          margin: pw.EdgeInsets.zero,
          build: (pw.Context context) {
            final allComponents = PdfInterpolationUtils.interpolatePageContext(
              [
                ...globalHeader,
                ...components,
                ...globalFooter,
              ],
              pageNumber: pageNumber,
              pagesCount: totalPages,
            ) as List<dynamic>;

            final stackChildren = <pw.Widget>[
              if (showWatermark && !watermark.isForeground)
                PdfWatermarkComponent.build(watermark, imageCache),
              ...allComponents.map((comp) {
                if (comp is! Map) return pw.SizedBox();
                return PdfComponentFactory.buildComponent(
                  Map<String, dynamic>.from(comp),
                  unit,
                  imageCache,
                  contextData: contextData,
                );
              }),
              if (showWatermark && watermark.isForeground)
                PdfWatermarkComponent.build(watermark, imageCache),
            ];

            return pw.SizedBox.expand(
              child: pw.Stack(children: stackChildren),
            );
          },
        ),
      );
      pageCount++;
    }

    if (pageCount == 0) {
      throw Exception(
          'PDF document has no pages. Ensure "pages" is defined in the JSON configuration.');
    }
  }
}
