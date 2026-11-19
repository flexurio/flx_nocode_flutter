import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/highlight_top_rows.dart';

void main() {
  group('HighlightTopRows Unit Tests', () {
    test('HighlightTopRows.fromRaw with null returns count 0 and null colors',
        () {
      final highlight = HighlightTopRows.fromRaw(null);

      expect(highlight.count, 0);
      expect(highlight.color, isNull);
      expect(highlight.stripedColor, isNull);
      expect(highlight.getColor(0), isNull);
    });

    test(
        'HighlightTopRows.fromRaw with num parses count with theme-adaptable null color',
        () {
      final highlight = HighlightTopRows.fromRaw(5);

      expect(highlight.count, 5);
      expect(highlight.color, isNull);
      // Resolves dynamically based on theme primary color
      final customTheme = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      );
      final resolvedColor = highlight.getColor(0, customTheme);
      expect(resolvedColor, isNotNull);
      expect(highlight.getColor(5, customTheme), isNull);
    });

    test(
        'HighlightTopRows.fromRaw with Map parses count, 6-digit hex color, and derives striped color',
        () {
      final json = {
        'count': 3,
        'color': '#DBEAFE',
      };

      final highlight = HighlightTopRows.fromRaw(json);

      expect(highlight.count, 3);
      expect(highlight.color, const Color(0xFFDBEAFE));
      expect(highlight.stripedColor, isNull);
      // Index 0 (even) gets base color
      expect(highlight.getColor(0), const Color(0xFFDBEAFE));
      // Index 1 (odd) gets derived striped color
      expect(highlight.getColor(1), isNotNull);
      // Index 2 (even) gets base color
      expect(highlight.getColor(2), const Color(0xFFDBEAFE));
      // Index 3 (out of range, >= count) returns null
      expect(highlight.getColor(3), isNull);
      expect(highlight.getColor(4), isNull);
    });

    test(
        'HighlightTopRows parses hex with 8 digits (ARGB) and without hash prefix',
        () {
      final json8Digit = {
        'count': 2,
        'color': '#80EFF6FF',
      };
      final highlight8 = HighlightTopRows.fromRaw(json8Digit);
      expect(highlight8.color, const Color(0x80EFF6FF));

      final jsonNoHash = {
        'count': 2,
        'color': 'EFF6FF',
      };
      final highlightNoHash = HighlightTopRows.fromRaw(jsonNoHash);
      expect(highlightNoHash.color, const Color(0xFFEFF6FF));
    });

    test('HighlightTopRows parses explicit striped_color when specified', () {
      final json = {
        'count': 5,
        'color': '#DBEAFE',
        'striped_color': '#BFDBFE',
      };

      final highlight = HighlightTopRows.fromRaw(json);

      expect(highlight.color, const Color(0xFFDBEAFE));
      expect(highlight.stripedColor, const Color(0xFFBFDBFE));
      expect(highlight.getColor(0), const Color(0xFFDBEAFE));
      expect(highlight.getColor(1), const Color(0xFFBFDBFE));
      expect(highlight.getColor(2), const Color(0xFFDBEAFE));
      expect(highlight.getColor(3), const Color(0xFFBFDBFE));
    });

    test(
        'HighlightTopRows falls back to background_color and defaults count to 5',
        () {
      final json = {
        'background_color': '#FEF3C7',
      };

      final highlight = HighlightTopRows.fromRaw(json);

      expect(highlight.count, 5);
      expect(highlight.color, const Color(0xFFFEF3C7));
    });

    test(
        'HighlightTopRows handles "theme" or "primary" keyword by using theme dynamically',
        () {
      final json = {
        'count': 5,
        'color': 'theme',
      };

      final highlight = HighlightTopRows.fromRaw(json);
      expect(highlight.count, 5);
      expect(highlight.color, isNull);

      final theme = ThemeData(
        colorScheme: const ColorScheme.light(primary: Color(0xFF1E40AF)),
      );
      final color = highlight.getColor(0, theme);
      expect(color, isNotNull);
    });

    test('HighlightTopRows handles invalid hex format gracefully', () {
      final json = {
        'count': 5,
        'color': 'invalid-hex-color',
      };

      final highlight = HighlightTopRows.fromRaw(json);

      expect(highlight.count, 5);
      expect(highlight.color, isNull);
      expect(highlight.getColor(0), isNotNull);
    });

    test(
        'HighlightTopRows returns null for all rows when count is 0 or negative',
        () {
      final highlightZero =
          HighlightTopRows.fromRaw({'count': 0, 'color': '#EFF6FF'});
      expect(highlightZero.getColor(0), isNull);
      expect(highlightZero.getColor(1), isNull);

      final highlightNegative =
          HighlightTopRows.fromRaw({'count': -1, 'color': '#EFF6FF'});
      expect(highlightNegative.getColor(0), isNull);
    });
  });
}
