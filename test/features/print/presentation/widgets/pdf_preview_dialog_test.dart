import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/print/presentation/widgets/pdf_preview_dialog.dart';

void main() {
  testWidgets('PdfPreviewDialog zoom in and zoom out test', (WidgetTester tester) async {
    final pdfBytes = Uint8List(10); // Small dummy data
    const title = 'Test PDF';

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

    // Initial zoom should be 100%
    expect(find.text('100%'), findsOneWidget);

    // Find zoom in button
    final zoomInButton = find.byIcon(Icons.zoom_in);
    expect(zoomInButton, findsOneWidget);

    // Zoom in once
    await tester.tap(zoomInButton);
    await tester.pump();
    expect(find.text('110%'), findsOneWidget);

    // Zoom in multiple times to test clamp (max 3.0 = 300%)
    // Starting from 1.1, we need 19 more taps to reach 3.0
    for (int i = 0; i < 25; i++) {
      await tester.tap(zoomInButton);
    }
    await tester.pump();
    expect(find.text('300%'), findsOneWidget);

    // Find zoom out button
    final zoomOutButton = find.byIcon(Icons.zoom_out);
    expect(zoomOutButton, findsOneWidget);

    // Zoom out once
    await tester.tap(zoomOutButton);
    await tester.pump();
    expect(find.text('290%'), findsOneWidget);

    // Zoom out multiple times to test clamp (min 0.5 = 50%)
    // Starting from 2.9, we need 24 more taps to reach 0.5
    for (int i = 0; i < 30; i++) {
      await tester.tap(zoomOutButton);
    }
    await tester.pump();
    expect(find.text('50%'), findsOneWidget);
  });
}
