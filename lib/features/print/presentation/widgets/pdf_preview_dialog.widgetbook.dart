import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/print/presentation/widgets/pdf_preview_dialog.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

Future<Uint8List> _buildSamplePdfBytes(String title) async {
  final doc = pw.Document();
  doc.addPage(
    pw.Page(
      build: (_) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            title,
            style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 12),
          pw.Text('Contoh dokumen PDF untuk verifikasi PdfPreviewDialog.'),
          pw.SizedBox(height: 8),
          pw.Text('Nomor Dokumen: CAPA-2026-0042'),
          pw.Text('Status: APPROVED'),
        ],
      ),
    ),
  );
  return doc.save();
}

@UseCase(
  name: 'Interactive PDF Preview Popup',
  type: PdfPreviewDialog,
  path: '[Popups]/Dialogs',
)
Widget interactivePdfPreviewDialogUseCase(BuildContext context) {
  final title = context.knobs.string(
    label: 'Dialog Title',
    initialValue: 'Pratinjau Dokumen CAPA-2026-0042',
  );
  final canPrint = context.knobs.boolean(
    label: 'Can Print',
    initialValue: true,
  );
  final canDownload = context.knobs.boolean(
    label: 'Can Download',
    initialValue: true,
  );

  return Center(
    child: ElevatedButton.icon(
      icon: const Icon(Icons.picture_as_pdf_outlined),
      label: const Text('Buka PDF Preview Popup'),
      onPressed: () async {
        final bytes = await _buildSamplePdfBytes(title);
        if (context.mounted) {
          await PdfPreviewDialog.show(
            context,
            bytes,
            title,
            canPrint: canPrint,
            canDownload: canDownload,
          );
        }
      },
    ),
  );
}
