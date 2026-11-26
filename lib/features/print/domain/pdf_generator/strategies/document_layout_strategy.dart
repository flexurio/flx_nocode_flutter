import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import '../components/pdf_watermark_component.dart';
import '../models/pdf_watermark_model.dart';
import '../pdf_component_factory.dart';
import '../utils/pdf_interpolation_utils.dart';
import '../utils/pdf_unit_utils.dart';
import '../utils/pdf_visibility_utils.dart';
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
    Map<String, dynamic> contextData = const {},
    PdfWatermarkModel? watermark,
  }) async {
    final dynamic rawContent = processedJson['content'];
    final List<dynamic> content = rawContent is List ? rawContent : [];

    final rawMargins = processedJson['margins'];
    final hasExplicitMargins =
        (rawMargins is Map && rawMargins.isNotEmpty) ||
        (rawMargins is! Map && rawMargins != null);
    final pageMargin = _parsePageMargins(
      hasExplicitMargins ? rawMargins : processedJson['margin'],
      unit,
    );

    final showWatermark = watermark != null &&
        watermark.hasContent &&
        PdfVisibilityUtils.isVisible(watermark.visibleIf, contextData);

    final pageTheme = pw.PageTheme(
      pageFormat: format,
      margin: pageMargin,
      buildBackground: (showWatermark && !watermark.isForeground)
          ? (_) => PdfWatermarkComponent.build(watermark, imageCache)
          : null,
      buildForeground: (showWatermark && watermark.isForeground)
          ? (_) => PdfWatermarkComponent.build(watermark, imageCache)
          : null,
    );

    pdf.addPage(
      pw.MultiPage(
        pageTheme: pageTheme,
        header: (pw.Context context) {
          if (globalHeader.isEmpty) return pw.SizedBox();
          return _buildBand(
            components: globalHeader,
            explicitHeight: processedJson['header_height'],
            defaultHeight: 40,
            unit: unit,
            imageCache: imageCache,
            contextData: contextData,
            pageNumber: context.pageNumber,
            pagesCount: context.pagesCount,
          );
        },
        footer: (pw.Context context) {
          if (globalFooter.isEmpty) return pw.SizedBox();
          return _buildBand(
            components: globalFooter,
            explicitHeight: processedJson['footer_height'],
            defaultHeight: 40,
            unit: unit,
            imageCache: imageCache,
            contextData: contextData,
            pageNumber: context.pageNumber,
            pagesCount: context.pagesCount,
          );
        },
        build: (pw.Context context) {
          final widgets = <pw.Widget>[];
          for (final comp in content) {
            try {
              if (comp is! Map) continue;
              final compMap = Map<String, dynamic>.from(comp);
              widgets.addAll(
                PdfComponentFactory.buildFlowComponents(
                  compMap,
                  unit,
                  imageCache,
                  contextData: contextData,
                ),
              );
            } catch (e) {
              print('Error building PDF component: $e');
            }
          }
          return widgets;
        },
      ),
    );
  }

  static pw.EdgeInsetsGeometry _parsePageMargins(
    dynamic rawMargin,
    String unit,
  ) {
    if (rawMargin == null) return const pw.EdgeInsets.all(20.0);
    if (rawMargin is Map) {
      if (rawMargin.isEmpty) return const pw.EdgeInsets.all(20.0);
      return PdfUnitUtils.parseEdgeInsets(rawMargin, unit) ??
          const pw.EdgeInsets.all(20.0);
    }
    return pw.EdgeInsets.all(PdfUnitUtils.convertToPt(rawMargin, unit));
  }

  static pw.Widget _buildBand({
    required List<dynamic> components,
    required dynamic explicitHeight,
    required double defaultHeight,
    required String unit,
    required Map<String, pw.ImageProvider> imageCache,
    required Map<String, dynamic> contextData,
    required int pageNumber,
    required int pagesCount,
  }) {
    final resolvedList = PdfInterpolationUtils.interpolatePageContext(
      components,
      pageNumber: pageNumber,
      pagesCount: pagesCount,
    );
    final items = resolvedList is List ? resolvedList : components;

    final usesAbsoluteCoords = items.any(
      (comp) =>
          comp is Map && (comp.containsKey('x') || comp.containsKey('y')),
    );

    if (usesAbsoluteCoords) {
      return pw.SizedBox(
        height: PdfUnitUtils.convertToPt(
          explicitHeight ?? defaultHeight,
          unit,
        ),
        child: pw.Stack(
          children: items.map((comp) {
            if (comp is! Map) return pw.SizedBox();
            return PdfComponentFactory.buildComponent(
              Map<String, dynamic>.from(comp),
              unit,
              imageCache,
              contextData: contextData,
            );
          }).toList(),
        ),
      );
    }

    final flowChildren = <pw.Widget>[];
    for (final comp in items) {
      if (comp is! Map) continue;
      flowChildren.addAll(
        PdfComponentFactory.buildFlowComponents(
          Map<String, dynamic>.from(comp),
          unit,
          imageCache,
          contextData: contextData,
        ),
      );
    }

    final column = pw.Column(
      mainAxisSize: pw.MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: flowChildren,
    );

    if (explicitHeight != null) {
      return pw.SizedBox(
        height: PdfUnitUtils.convertToPt(explicitHeight, unit),
        child: column,
      );
    }

    return column;
  }
}
