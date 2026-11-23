import 'package:pdf/pdf.dart';

/// Root-level watermark configuration for `layout_print`.
///
/// Follows standard `layout_print` naming (`value`, `rotation`, `color`,
/// `font_size`, `opacity`, `layer`, `repeat`, `visible_if`) while also
/// accepting `text` and `angle` as backward-friendly aliases.
class PdfWatermarkModel {
  final String value;
  final String? imageUrl;
  final double fontSize;
  final PdfColor color;
  final double opacity;
  final double rotation;
  final String layer; // 'background' | 'foreground'
  final String repeat; // 'single' | 'tiled'
  final dynamic visibleIf;

  const PdfWatermarkModel({
    required this.value,
    this.imageUrl,
    this.fontSize = 42.0,
    this.color = PdfColors.grey,
    this.opacity = 0.12,
    this.rotation = -30.0,
    this.layer = 'background',
    this.repeat = 'single',
    this.visibleIf,
  });

  bool get isForeground => layer == 'foreground';
  bool get isTiled => repeat == 'tiled';
  bool get hasContent =>
      value.trim().isNotEmpty ||
      (imageUrl != null && imageUrl!.trim().isNotEmpty);

  static PdfWatermarkModel? fromJson(dynamic json) {
    if (json is! Map) return null;
    final map = Map<String, dynamic>.from(json);

    final rawValue = (map['value'] ?? map['text'])?.toString() ?? '';
    final rawImageUrl = map['image_url']?.toString();
    if (rawValue.trim().isEmpty &&
        (rawImageUrl == null || rawImageUrl.trim().isEmpty)) {
      return null;
    }

    final fontSize = _toDouble(map['font_size']) ?? 42.0;
    final opacity = (_toDouble(map['opacity']) ?? 0.12).clamp(0.0, 1.0);
    final rotation = _toDouble(map['rotation'] ?? map['angle']) ?? -30.0;
    final layerStr = map['layer']?.toString().toLowerCase();
    final layer = layerStr == 'foreground' ? 'foreground' : 'background';
    final repeatStr = map['repeat']?.toString().toLowerCase();
    final repeat = repeatStr == 'tiled' ? 'tiled' : 'single';

    PdfColor color = PdfColors.grey;
    final colorHex = map['color']?.toString();
    if (colorHex != null && colorHex.trim().isNotEmpty) {
      try {
        color = PdfColor.fromHex(colorHex.trim());
      } catch (_) {
        color = PdfColors.grey;
      }
    }

    return PdfWatermarkModel(
      value: rawValue,
      imageUrl: rawImageUrl,
      fontSize: fontSize,
      color: color,
      opacity: opacity,
      rotation: rotation,
      layer: layer,
      repeat: repeat,
      visibleIf: map['visible_if'],
    );
  }

  static double? _toDouble(dynamic value) {
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }
}
