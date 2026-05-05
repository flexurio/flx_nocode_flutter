import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import '../pdf_component_factory.dart';
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
  }) async {
    final rawPages = processedJson['pages'];
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
      throw Exception(
          'PDF document has no pages. Ensure "pages" is defined in the JSON configuration.');
    }
  }
}
