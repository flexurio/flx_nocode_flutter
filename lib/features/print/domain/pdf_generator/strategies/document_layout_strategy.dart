import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import '../pdf_component_factory.dart';
import '../utils/pdf_unit_utils.dart';
import 'pdf_layout_strategy.dart';

class DocumentLayoutStrategy implements PdfLayoutStrategy {
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
            height: PdfUnitUtils.convertToPt(
                processedJson['header_height'] ?? 40, unit),
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
            height: PdfUnitUtils.convertToPt(
                processedJson['footer_height'] ?? 40, unit),
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
              
              // Note: contextData is not directly available here in the strategy yet, 
              // but we can pass it if needed. However, interpolation already happened.
              
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
  }
}
