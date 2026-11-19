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
      return HighlightTopRows(
        count: raw.toInt(),
      );
    }
    if (raw is Map) {
      final count = (raw['count'] as num?)?.toInt() ?? 5;
      final rawHex =
          raw['color']?.toString() ?? raw['background_color']?.toString();
      final baseColor = (rawHex != null &&
              rawHex.isNotEmpty &&
              rawHex.toLowerCase() != 'theme' &&
              rawHex.toLowerCase() != 'primary')
          ? _parseColor(rawHex)
          : null;
      final stripedHex = raw['striped_color']?.toString();
      final stripedColor = (stripedHex != null && stripedHex.isNotEmpty)
          ? _parseColor(stripedHex)
          : null;
      return HighlightTopRows(
        count: count,
        color: baseColor,
        stripedColor: stripedColor,
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
    return Color.lerp(base, Colors.black, 0.05)!;
  }

  Color? getColor(int rowIndex, [ThemeData? theme]) {
    if (rowIndex >= count || count <= 0) return null;

    final primary = theme?.colorScheme.primary ?? const Color(0xFF2563EB);
    final isDark = theme?.brightness == Brightness.dark;
    final defaultBase = isDark
        ? Color.lerp(theme?.cardColor ?? Colors.black, primary, 0.35)!
        : Color.lerp(Colors.white, primary, 0.18)!;
    final defaultStriped = isDark
        ? Color.lerp(theme?.cardColor ?? Colors.black, primary, 0.45)!
        : Color.lerp(Colors.white, primary, 0.28)!;

    final effectiveBase = color ?? defaultBase;
    final effectiveStriped = stripedColor ??
        (color != null ? _deriveStriped(color!) : defaultStriped);

    return (rowIndex % 2 != 0) ? effectiveStriped : effectiveBase;
  }
}
