import 'dart:math' as math;
import 'package:pdf/widgets.dart' as pw;
import '../models/pdf_watermark_model.dart';

/// Renders a full-page watermark (single centered or tiled pattern) for both
/// Document and Canvas PDF strategies.
class PdfWatermarkComponent {
  static pw.Widget build(
    PdfWatermarkModel model,
    Map<String, pw.ImageProvider> imageCache,
  ) {
    final radians = model.rotation * (math.pi / 180.0);

    pw.Widget buildMark() {
      if (model.imageUrl != null && imageCache.containsKey(model.imageUrl)) {
        return pw.Image(
          imageCache[model.imageUrl]!,
          fit: pw.BoxFit.contain,
        );
      }
      return pw.Text(
        model.value,
        textAlign: pw.TextAlign.center,
        style: pw.TextStyle(
          fontSize: model.fontSize,
          fontWeight: pw.FontWeight.bold,
          color: model.color,
        ),
      );
    }

    final rotatedMark = pw.Transform.rotate(
      angle: radians,
      child: buildMark(),
    );

    if (model.isTiled) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Opacity(
          opacity: model.opacity,
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
            children: List.generate(
              3,
              (_) => pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                children: List.generate(2, (_) => rotatedMark),
              ),
            ),
          ),
        ),
      );
    }

    return pw.FullPage(
      ignoreMargins: true,
      child: pw.Center(
        child: pw.Opacity(
          opacity: model.opacity,
          child: rotatedMark,
        ),
      ),
    );
  }
}
