import 'package:flutter/material.dart';

/// Configuration for visually highlighting the top N rows in a data table with a
/// distinct background color (e.g. for top performers / rankings).
class HighlightTopRows {
  final int count;
  final Color? color;
  final Color? stripedColor;

  const HighlightTopRows({
    this.count = 5,
    this.color,
    this.stripedColor,
  });

  factory HighlightTopRows.fromRaw(dynamic raw) {
    if (raw == null) return const HighlightTopRows(count: 0);
    if (raw is num) {
      const defaultBase = Color(0xFFEFF6FF); // Soft blue 50
      const defaultStriped = Color(0xFFDBEAFE); // Soft blue 100
      return HighlightTopRows(
        count: raw.toInt(),
        color: defaultBase,
        stripedColor: defaultStriped,
      );
    }
    if (raw is Map) {
      final count = (raw['count'] as num?)?.toInt() ?? 5;
      final hex = raw['color']?.toString() ??
          raw['background_color']?.toString() ??
          '#EFF6FF';
      final stripedHex = raw['striped_color']?.toString();
      final baseColor = _parseColor(hex) ?? const Color(0xFFEFF6FF);
      final derivedStriped = stripedHex != null
          ? _parseColor(stripedHex)
          : _deriveStriped(baseColor);
      return HighlightTopRows(
        count: count,
        color: baseColor,
        stripedColor: derivedStriped,
      );
    }
    return const HighlightTopRows(count: 0);
  }

  static Color? _parseColor(String hex) {
    try {
      final clean = hex.replaceAll('#', '').replaceAll('0x', '');
      return Color(
          int.parse(clean.length == 6 ? 'FF$clean' : clean, radix: 16));
    } catch (_) {
      return null;
    }
  }

  static Color _deriveStriped(Color base) {
    return Color.lerp(base, Colors.black, 0.03)!;
  }

  Color? getColor(int rowIndex) {
    if (rowIndex < count) {
      return (rowIndex % 2 != 0 && stripedColor != null) ? stripedColor : color;
    }
    return null;
  }
}
