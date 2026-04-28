import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:printing/printing.dart';
import 'dart:convert';
import '../../domain/json_pdf_generator.dart';

@widgetbook.UseCase(
  name: 'Concert Ticket (Canvas Mode)',
  type: PdfPreview,
  path: '[Print]',
)
Widget buildConcertTicketUseCase(BuildContext context) {
  // Mock JSON representing the LayoutPrint configuration
  const jsonString = '''
  {
    "id": "print_concert_ticket",
    "name": "Concert Ticket",
    "layout_type": "canvas",
    "unit": "mm",
    "page_size": [150, 50],
    "orientation": "landscape",
    "pages": [
      {
        "background_color": "#F9F9F9",
        "components": [
          {
            "type": "text",
            "value": "SUMMER FESTIVAL 2026",
            "x": 55, "y": 5,
            "font_size": 16
          },
          {
            "type": "text",
            "value": "Attendee: John Doe",
            "x": 55, "y": 20,
            "font_size": 10
          },
          {
            "type": "text",
            "value": "Date: 28 Apr 2026",
            "x": 55, "y": 30,
            "font_size": 10
          },
          {
            "type": "shape",
            "shape_type": "line",
            "x": 115, "y": 0, "width": 0, "height": 50,
            "border_color": "#CCCCCC", "border_width": 0.5
          },
          {
            "type": "barcode",
            "value": "1234567890",
            "format": "CODE_128",
            "x": 125, "y": 5, "width": 40, "height": 15,
            "rotation": 90
          },
          {
            "type": "qrcode",
            "value": "https://example.com/verify/1234567890",
            "x": 5, "y": 5, "size": 40
          }
        ]
      }
    ]
  }
  ''';

  final Map<String, dynamic> config = jsonDecode(jsonString);

  return Scaffold(
    appBar: AppBar(title: const Text('LayoutPrint PDF Engine Demo')),
    body: PdfPreview(
      build: (format) => JsonPdfGenerator.generate(config),
      allowPrinting: true,
      allowSharing: true,
      canChangeOrientation: false,
      canChangePageFormat: false,
    ),
  );
}
