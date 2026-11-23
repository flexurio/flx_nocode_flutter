import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/components/pdf_grid_component.dart';
import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/components/pdf_signature_block_component.dart';
import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/components/pdf_table_component.dart';
import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/utils/pdf_unit_utils.dart';
import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/utils/pdf_visibility_utils.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfComponentFactory {
  static pw.Widget buildComponent(
    Map<String, dynamic> comp,
    String defaultUnit,
    Map<String, pw.ImageProvider> imageCache, {
    Map<String, dynamic> contextData = const {},
  }) {
    if (!PdfVisibilityUtils.isVisible(comp['visible_if'], contextData)) {
      return pw.SizedBox();
    }

    final x = PdfUnitUtils.convertToPt(comp['x'], defaultUnit);
    final y = PdfUnitUtils.convertToPt(comp['y'], defaultUnit);

    pw.Widget widget = buildRawComponent(
      comp,
      defaultUnit,
      imageCache,
      contextData: contextData,
    );

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

  /// Builds a top-level flow component in Document mode.
  ///
  /// Returns a list of widgets so multi-row spanning components (`grid`,
  /// `signature_block` with `keep_together: false`) can paginate cleanly
  /// between rows inside `pw.MultiPage`.
  static List<pw.Widget> buildFlowComponents(
    Map<String, dynamic> comp,
    String defaultUnit,
    Map<String, pw.ImageProvider> imageCache, {
    Map<String, dynamic> contextData = const {},
  }) {
    if (!PdfVisibilityUtils.isVisible(comp['visible_if'], contextData)) {
      return const [];
    }

    final type = comp['type'] as String?;
    final marginVal = comp['margin'];
    final marginPadding = marginVal != null
        ? PdfUnitUtils.parseEdgeInsets(marginVal, defaultUnit)
        : null;

    if (type == 'grid') {
      final widgets = PdfGridComponent.buildWidgets(
        comp,
        defaultUnit,
        imageCache,
        (c, u, cache, {Map<String, dynamic>? contextData}) => buildRawComponent(
          c,
          u,
          cache,
          contextData: contextData ?? const {},
        ),
        rootContext: contextData,
      );
      return _applyFlowMargin(widgets, marginPadding);
    }

    if (type == 'signature_block') {
      final widgets = PdfSignatureBlockComponent.buildWidgets(
        comp,
        defaultUnit,
        imageCache,
      );
      return _applyFlowMargin(widgets, marginPadding);
    }

    pw.Widget widget = buildRawComponent(
      comp,
      defaultUnit,
      imageCache,
      contextData: contextData,
    );

    if (marginPadding != null && type != 'container') {
      widget = pw.Padding(padding: marginPadding, child: widget);
    }

    return [widget];
  }

  static List<pw.Widget> _applyFlowMargin(
    List<pw.Widget> widgets,
    pw.EdgeInsetsGeometry? margin,
  ) {
    if (widgets.isEmpty || margin == null) return widgets;
    if (widgets.length == 1) {
      return [pw.Padding(padding: margin, child: widgets.first)];
    }
    final resolved = margin.resolve(pw.TextDirection.ltr);
    return [
      if (resolved.top > 0) pw.SizedBox(height: resolved.top),
      ...widgets.map(
        (w) => (resolved.left > 0 || resolved.right > 0)
            ? pw.Padding(
                padding: pw.EdgeInsets.only(
                  left: resolved.left,
                  right: resolved.right,
                ),
                child: w,
              )
            : w,
      ),
      if (resolved.bottom > 0) pw.SizedBox(height: resolved.bottom),
    ];
  }

  static pw.Widget buildRawComponent(
    Map<String, dynamic> comp,
    String defaultUnit,
    Map<String, pw.ImageProvider> imageCache, {
    Map<String, dynamic> contextData = const {},
  }) {
    if (!PdfVisibilityUtils.isVisible(comp['visible_if'], contextData)) {
      return pw.SizedBox();
    }

    final type = comp['type'] as String?;
    final width = comp['width'] != null
        ? PdfUnitUtils.convertToPt(comp['width'], defaultUnit)
        : null;
    final height = comp['height'] != null
        ? PdfUnitUtils.convertToPt(comp['height'], defaultUnit)
        : null;

    pw.Widget widget;

    switch (type) {
      case 'text':
        final isBold = comp['is_bold'] as bool? ?? false;
        PdfColor? textColor;
        final colorStr = comp['color']?.toString();
        if (colorStr != null && colorStr.trim().isNotEmpty) {
          try {
            textColor = PdfColor.fromHex(colorStr.trim());
          } catch (_) {}
        }
        widget = pw.Text(
          comp['value']?.toString() ?? '',
          textAlign: _parseTextAlign(comp['align']?.toString()),
          softWrap: comp['soft_wrap'] is bool ? comp['soft_wrap'] as bool : null,
          maxLines: comp['max_lines'] is int ? comp['max_lines'] as int : null,
          style: pw.TextStyle(
            fontSize: PdfUnitUtils.convertToPt(comp['font_size'] ?? 12, 'pt'),
            fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
            color: textColor,
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
          width: comp['size'] != null
              ? PdfUnitUtils.convertToPt(comp['size'], defaultUnit)
              : 50,
          height: comp['size'] != null
              ? PdfUnitUtils.convertToPt(comp['size'], defaultUnit)
              : 50,
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
        widget = PdfTableComponent.build(
          comp,
          defaultUnit,
          imageCache,
          (c, u, cache) => buildRawComponent(
            c,
            u,
            cache,
            contextData: contextData,
          ),
        );
        break;
      case 'grid':
        widget = PdfGridComponent.build(
          comp,
          defaultUnit,
          imageCache,
          (c, u, cache, {Map<String, dynamic>? contextData}) =>
              buildRawComponent(
            c,
            u,
            cache,
            contextData: contextData ?? const {},
          ),
          rootContext: contextData,
        );
        break;
      case 'signature_block':
        widget = PdfSignatureBlockComponent.build(
          comp,
          defaultUnit,
          imageCache,
        );
        break;
      case 'column':
        final childrenJson = comp['children'] as List<dynamic>? ?? [];
        widget = pw.Column(
          crossAxisAlignment: _parseCrossAxisAlignment(
              (comp['align'] ?? comp['cross_axis_alignment'])?.toString()),
          mainAxisAlignment: _parseMainAxisAlignment(
              (comp['valign'] ?? comp['main_axis_alignment'])?.toString()),
          children: childrenJson.whereType<Map>().map((c) {
            final childMap = Map<String, dynamic>.from(c);
            if (!PdfVisibilityUtils.isVisible(
                childMap['visible_if'], contextData)) {
              return pw.SizedBox();
            }
            var childWidget = buildRawComponent(
              childMap,
              defaultUnit,
              imageCache,
              contextData: contextData,
            );
            final childMargin = childMap['margin'];
            if (childMargin != null && childMap['type'] != 'container') {
              final padding =
                  PdfUnitUtils.parseEdgeInsets(childMargin, defaultUnit);
              if (padding != null) {
                childWidget = pw.Padding(padding: padding, child: childWidget);
              }
            }
            return childWidget;
          }).toList(),
        );
        break;
      case 'row':
        final childrenJson = comp['children'] as List<dynamic>? ?? [];
        widget = pw.Row(
          mainAxisAlignment: _parseMainAxisAlignment(
              (comp['align'] ?? comp['main_axis_alignment'])?.toString()),
          crossAxisAlignment: _parseCrossAxisAlignment(
              (comp['valign'] ?? comp['cross_axis_alignment'])?.toString()),
          children: childrenJson.whereType<Map>().map((c) {
            final childMap = Map<String, dynamic>.from(c);
            if (!PdfVisibilityUtils.isVisible(
                childMap['visible_if'], contextData)) {
              return pw.SizedBox();
            }
            return buildRawComponent(
              childMap,
              defaultUnit,
              imageCache,
              contextData: contextData,
            );
          }).toList(),
        );
        break;
      case 'container':
        final childJson = comp['child'] as Map<String, dynamic>?;
        final padding =
            PdfUnitUtils.parseEdgeInsets(comp['padding'], defaultUnit);
        final margin =
            PdfUnitUtils.parseEdgeInsets(comp['margin'], defaultUnit);
        final borderColorStr = comp['border_color']?.toString();
        final borderWidth = (comp['border_width'] as num?)?.toDouble();
        final bgColorStr = comp['background_color']?.toString();

        pw.Widget? childWidget;
        if (childJson != null) {
          childWidget = buildRawComponent(
            childJson,
            defaultUnit,
            imageCache,
            contextData: contextData,
          );
        }

        pw.BoxDecoration? decoration;
        if (borderColorStr != null ||
            borderWidth != null ||
            bgColorStr != null) {
          decoration = pw.BoxDecoration(
            color: bgColorStr != null ? PdfColor.fromHex(bgColorStr) : null,
            border: (borderColorStr != null || borderWidth != null)
                ? pw.Border.all(
                    color: borderColorStr != null
                        ? PdfColor.fromHex(borderColorStr)
                        : PdfColors.black,
                    width: borderWidth ?? 1.0,
                  )
                : null,
          );
        }

        widget = pw.Container(
          width: width,
          height: height,
          padding: padding,
          margin: margin,
          decoration: decoration,
          child: childWidget ?? pw.SizedBox(),
        );
        break;
      default:
        widget = pw.SizedBox();
    }

    if (width != null || height != null) {
      if (type != 'qrcode' &&
          type != 'barcode' &&
          type != 'shape' &&
          type != 'image' &&
          type != 'container') {
        widget = pw.SizedBox(width: width, height: height, child: widget);
      }
    }

    return widget;
  }

  static pw.TextAlign? _parseTextAlign(String? align) {
    if (align == null) return null;
    switch (align.toLowerCase()) {
      case 'center':
        return pw.TextAlign.center;
      case 'right':
      case 'end':
        return pw.TextAlign.right;
      case 'justify':
        return pw.TextAlign.justify;
      case 'left':
      case 'start':
      default:
        return pw.TextAlign.left;
    }
  }

  static pw.CrossAxisAlignment _parseCrossAxisAlignment(String? alignment) {
    if (alignment == null) return pw.CrossAxisAlignment.start;
    final align = alignment.toLowerCase();
    switch (align) {
      case 'center':
      case 'middle':
        return pw.CrossAxisAlignment.center;
      case 'end':
      case 'right':
      case 'bottom':
        return pw.CrossAxisAlignment.end;
      case 'stretch':
        return pw.CrossAxisAlignment.stretch;
      case 'start':
      case 'left':
      case 'top':
      default:
        return pw.CrossAxisAlignment.start;
    }
  }

  static pw.MainAxisAlignment _parseMainAxisAlignment(String? alignment) {
    if (alignment == null) return pw.MainAxisAlignment.start;
    final align = alignment.toLowerCase();
    switch (align) {
      case 'center':
      case 'middle':
        return pw.MainAxisAlignment.center;
      case 'end':
      case 'right':
      case 'bottom':
        return pw.MainAxisAlignment.end;
      case 'space_between':
        return pw.MainAxisAlignment.spaceBetween;
      case 'space_around':
        return pw.MainAxisAlignment.spaceAround;
      case 'space_evenly':
        return pw.MainAxisAlignment.spaceEvenly;
      case 'start':
      case 'left':
      case 'top':
      default:
        return pw.MainAxisAlignment.start;
    }
  }
}
