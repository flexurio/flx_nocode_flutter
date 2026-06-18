import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class PdfPreviewDialog extends StatefulWidget {
  final Uint8List pdfBytes;
  final String title;
  final bool canPrint;
  final bool canDownload;

  const PdfPreviewDialog({
    super.key,
    required this.pdfBytes,
    required this.title,
    this.canPrint = true,
    this.canDownload = true,
  });

  static Future<void> show(
    BuildContext context,
    Uint8List pdfBytes,
    String title, {
    bool canPrint = true,
    bool canDownload = true,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => PdfPreviewDialog(
        pdfBytes: pdfBytes,
        title: title,
        canPrint: canPrint,
        canDownload: canDownload,
      ),
    );
  }

  @override
  State<PdfPreviewDialog> createState() => _PdfPreviewDialogState();
}

class _PdfPreviewDialogState extends State<PdfPreviewDialog> {
  double _zoom = 1.0;

  void _zoomIn() {
    setState(() {
      _zoom = (_zoom + 0.1).clamp(0.5, 3.0);
    });
  }

  void _zoomOut() {
    setState(() {
      _zoom = (_zoom - 0.1).clamp(0.5, 3.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.4),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              // Premium Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.description, color: Colors.blue),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    // Zoom Controls
                    _buildHeaderAction(
                      icon: Icons.zoom_out,
                      onPressed: _zoomOut,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${(_zoom * 100).toInt()}%',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 5),
                    _buildHeaderAction(
                      icon: Icons.zoom_in,
                      onPressed: _zoomIn,
                    ),
                    const SizedBox(width: 20),
                    // Action Buttons
                    if (widget.canPrint) ...[
                      _buildHeaderAction(
                        icon: Icons.print,
                        onPressed: () => Printing.layoutPdf(
                          onLayout: (format) async => widget.pdfBytes,
                          name: widget.title,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                    if (widget.canDownload) ...[
                      _buildHeaderAction(
                        icon: Icons.download,
                        onPressed: () => Printing.sharePdf(
                          bytes: widget.pdfBytes,
                          filename: '${widget.title.replaceAll(' ', '_')}.pdf',
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.grey),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              // PDF Preview
              Expanded(
                child: PdfPreview(
                  build: (format) async => widget.pdfBytes,
                  initialPageFormat: PdfPageFormat.a4,
                  allowPrinting: false,
                  allowSharing: false,
                  canChangeOrientation: true,
                  canChangePageFormat: true,
                  dynamicLayout: false,
                  useActions: false,
                  maxPageWidth: 700 * _zoom, // Simulate zoom by adjusting max width
                  loadingWidget: const Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderAction({required IconData icon, required VoidCallback onPressed}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.blue, size: 20),
        onPressed: onPressed,
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(),
      ),
    );
  }
}
