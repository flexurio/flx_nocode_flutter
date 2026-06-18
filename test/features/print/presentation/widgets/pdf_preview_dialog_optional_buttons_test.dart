import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/print/presentation/widgets/pdf_preview_dialog.dart';

void main() {
  group('PdfPreviewDialog Optional Buttons Tests', () {
    final pdfBytes = Uint8List(10);
    const title = 'Test PDF';

    testWidgets('shows both buttons by default', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PdfPreviewDialog(
              pdfBytes: pdfBytes,
              title: title,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.print), findsOneWidget);
      expect(find.byIcon(Icons.download), findsOneWidget);
    });

    testWidgets('hides print button when canPrint is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PdfPreviewDialog(
              pdfBytes: pdfBytes,
              title: title,
              canPrint: false,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.print), findsNothing);
      expect(find.byIcon(Icons.download), findsOneWidget);
    });

    testWidgets('hides download button when canDownload is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PdfPreviewDialog(
              pdfBytes: pdfBytes,
              title: title,
              canDownload: false,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.print), findsOneWidget);
      expect(find.byIcon(Icons.download), findsNothing);
    });

    testWidgets('hides both buttons when both flags are false', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PdfPreviewDialog(
              pdfBytes: pdfBytes,
              title: title,
              canPrint: false,
              canDownload: false,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.print), findsNothing);
      expect(find.byIcon(Icons.download), findsNothing);
    });
  });
}
