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
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          child: Scaffold(
            appBar: AppBar(
              title: Text(title),
              leading: const CloseButton(),
              elevation: 0,
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            ),
            body: PdfPreview(
              build: (format) async => pdfBytes,
              allowPrinting: true,
              allowSharing: true,
              canChangeOrientation: false,
              canChangePageFormat: false,
              dynamicLayout: false,
              loadingWidget: const Center(child: CircularProgressIndicator()),
            ),
          ),
        ),
      ),
    );
  }
}
