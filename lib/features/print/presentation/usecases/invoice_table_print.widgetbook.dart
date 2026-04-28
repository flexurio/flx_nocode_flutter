import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:printing/printing.dart';
import 'dart:convert';
import '../../domain/json_pdf_generator.dart';

@widgetbook.UseCase(
  name: 'Invoice Table (Canvas Mode)',
  type: PdfPreview,
  path: '[Print]',
)
Widget buildInvoiceTableUseCase(BuildContext context) {
  const jsonString = '''
  {
    "id": "print_invoice_table",
    "name": "Invoice Table",
    "layout_type": "canvas",
    "unit": "mm",
    "page_size": "A4",
    "orientation": "portrait",
    "pages": [
      {
        "background_color": "#FFFFFF",
        "components": [
          {
            "type": "text",
            "value": "INVOICE",
            "x": 20, "y": 20,
            "font_size": 24
          },
          {
            "type": "table",
            "x": 20, "y": 40,
            "width": 170,
            "columns": [
              { "header": "No.", "key": "no", "flex": 1 },
              { "header": "Item Description", "key": "item", "flex": 4 },
              { "header": "Qty", "key": "qty", "flex": 1 },
              { "header": "Total", "key": "total", "flex": 2 }
            ],
            "data": [
              { "no": "1", "item": "Web Development Services", "qty": "1", "total": "\$1,500.00" },
              { "no": "2", "item": "Server Hosting (1 Year)", "qty": "1", "total": "\$120.00" },
              { "no": "3", "item": "Domain Registration", "qty": "2", "total": "\$30.00" }
            ]
          }
        ]
      }
    ]
  }
  ''';

  final Map<String, dynamic> config = jsonDecode(jsonString);

  return Scaffold(
    appBar: AppBar(title: const Text('LayoutPrint Table Demo')),
    body: PdfPreview(
      build: (format) => JsonPdfGenerator.generate(config),
      allowPrinting: true,
      allowSharing: true,
      canChangeOrientation: false,
      canChangePageFormat: false,
    ),
  );
}
