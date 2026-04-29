import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

class PdfPreviewDialog extends StatelessWidget {
  final Uint8List pdfBytes;
  final String title;

  const PdfPreviewDialog({
    super.key,
    required this.pdfBytes,
    required this.title,
  });

  static Future<void> show(BuildContext context, Uint8List pdfBytes, String title) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => PdfPreviewDialog(
        pdfBytes: pdfBytes,
        title: title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: CloseButton(),
        ),
        body: PdfPreview(
          build: (format) => pdfBytes,
          allowPrinting: true,
          allowSharing: true,
          canChangeOrientation: false,
          canChangePageFormat: false,
          dynamicLayout: false,
        ),
      ),
    );
  }
}
