import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/utils/pdf_unit_utils.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void main() {
  group('PdfUnitUtils Tests', () {
    test('convertToPt should handle mm, cm, in', () {
      expect(PdfUnitUtils.convertToPt(1, 'pt'), 1.0);
      expect(PdfUnitUtils.convertToPt(1, 'mm'), closeTo(2.83, 0.01));
      expect(PdfUnitUtils.convertToPt(1, 'cm'), closeTo(28.34, 0.01));
      expect(PdfUnitUtils.convertToPt(1, 'in'), 72.0);
    });

    test('parsePageSize should handle A4 and custom sizes', () {
      final a4 = PdfUnitUtils.parsePageSize('A4', 'pt');
      expect(a4.width, PdfPageFormat.a4.width);
      expect(a4.height, PdfPageFormat.a4.height);

      final custom = PdfUnitUtils.parsePageSize([100, 200], 'pt');
      expect(custom.width, 100);
      expect(custom.height, 200);
    });

    test('parseEdgeInsets should handle numeric and Map values', () {
      final all = PdfUnitUtils.parseEdgeInsets(10, 'pt') as pw.EdgeInsets?;
      expect(all?.left, 10);
      expect(all?.right, 10);

      final specific = PdfUnitUtils.parseEdgeInsets({'left': 5, 'top': 15}, 'pt')
          as pw.EdgeInsets?;
      expect(specific?.left, 5);
      expect(specific?.top, 15);
      expect(specific?.right, 0);
    });
  });
}
