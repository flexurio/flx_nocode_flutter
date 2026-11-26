import 'dart:convert';

import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/strategies/document_layout_strategy.dart';
import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/utils/pdf_unit_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void main() {
  void expectEdgeInsets(
    pw.EdgeInsetsGeometry actual, {
    required double left,
    required double top,
    required double right,
    required double bottom,
  }) {
    expect(actual, isA<pw.EdgeInsets>());
    final insets = actual as pw.EdgeInsets;
    expect(insets.left, closeTo(left, 1e-6));
    expect(insets.top, closeTo(top, 1e-6));
    expect(insets.right, closeTo(right, 1e-6));
    expect(insets.bottom, closeTo(bottom, 1e-6));
  }

  group('DocumentLayoutStrategy.resolvePageMargins', () {
    test('falls back to numeric margin when margins is an empty map', () {
      final resolved = DocumentLayoutStrategy.resolvePageMargins(
        {
          'margins': <String, dynamic>{},
          'margin': 10,
        },
        'mm',
      );

      final expectedPt = PdfUnitUtils.convertToPt(10, 'mm');
      expectEdgeInsets(
        resolved,
        left: expectedPt,
        top: expectedPt,
        right: expectedPt,
        bottom: expectedPt,
      );
    });

    test('falls back to map margin when margins is an empty map', () {
      final resolved = DocumentLayoutStrategy.resolvePageMargins(
        {
          'margins': <String, dynamic>{},
          'margin': {'left': 5, 'top': 10, 'right': 15, 'bottom': 20},
        },
        'mm',
      );

      expectEdgeInsets(
        resolved,
        left: PdfUnitUtils.convertToPt(5, 'mm'),
        top: PdfUnitUtils.convertToPt(10, 'mm'),
        right: PdfUnitUtils.convertToPt(15, 'mm'),
        bottom: PdfUnitUtils.convertToPt(20, 'mm'),
      );
    });

    test('falls back to default 20pt when margins is empty and margin is absent',
        () {
      final resolved = DocumentLayoutStrategy.resolvePageMargins(
        {'margins': <String, dynamic>{}},
        'mm',
      );

      expectEdgeInsets(
        resolved,
        left: 20.0,
        top: 20.0,
        right: 20.0,
        bottom: 20.0,
      );
    });

    test('prefers non-empty margins over margin', () {
      final resolved = DocumentLayoutStrategy.resolvePageMargins(
        {
          'margins': {'top': 12, 'left': 8},
          'margin': 25,
        },
        'pt',
      );

      expectEdgeInsets(
        resolved,
        left: 8.0,
        top: 12.0,
        right: 0.0,
        bottom: 0.0,
      );
    });
  });

  group('DocumentLayoutStrategy.build', () {
    test('generates PDF cleanly when margins is empty map and margin is set',
        () async {
      final pdf = pw.Document();
      final strategy = DocumentLayoutStrategy();

      await strategy.build(
        pdf: pdf,
        processedJson: {
          'margins': <String, dynamic>{},
          'margin': 12,
          'content': [
            {'type': 'text', 'value': 'Hello World'},
          ],
        },
        format: PdfPageFormat.a4,
        unit: 'mm',
        imageCache: const {},
        globalHeader: const [],
        globalFooter: const [],
      );

      final bytes = await pdf.save();
      expect(bytes, isNotEmpty);
      expect(utf8.decode(bytes.take(5).toList()), '%PDF-');
    });
  });
}
