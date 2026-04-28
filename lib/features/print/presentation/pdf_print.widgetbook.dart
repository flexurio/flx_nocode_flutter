import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:printing/printing.dart';
import 'dart:convert';
import '../domain/json_pdf_generator.dart';

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

@widgetbook.UseCase(
  name: 'Product Catalog (Table with Images)',
  type: PdfPreview,
  path: '[Print]',
)
Widget buildProductCatalogTableUseCase(BuildContext context) {
  const jsonString = '''
  {
    "id": "print_catalog",
    "name": "Product Catalog",
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
            "value": "NEW ARRIVALS 2026",
            "x": 20, "y": 20,
            "font_size": 20
          },
          {
            "type": "table",
            "x": 20, "y": 35,
            "width": 170,
            "columns": [
              { "header": "Photo", "key": "photo", "flex": 1 },
              { "header": "Details", "key": "details", "flex": 3 },
              { "header": "Price", "key": "price", "flex": 1 }
            ],
            "data": [
              { 
                "photo": {
                  "type": "container",
                  "padding": 2,
                  "border_color": "#DDDDDD",
                  "border_width": 1,
                  "child": {
                    "type": "image",
                    "url": "https://picsum.photos/201",
                    "width": 30, "height": 30,
                    "fit": "cover"
                  }
                }, 
                "details": {
                  "type": "column",
                  "children": [
                    { "type": "text", "value": "Product A - High Quality Widget", "font_size": 12 },
                    { "type": "text", "value": "This is a premium widget built for extreme durability and heavy-duty performance.", "font_size": 8 }
                  ]
                }, 
                "price": {
                  "type": "container",
                  "background_color": "#E6F4EA",
                  "padding": 4,
                  "child": {
                    "type": "text",
                    "value": "\$19.99",
                    "font_size": 12
                  }
                }
              },
              { 
                "photo": {
                  "type": "image",
                  "url": "https://picsum.photos/202",
                  "width": 30, "height": 30,
                  "fit": "cover"
                }, 
                "details": {
                  "type": "column",
                  "children": [
                    {
                      "type": "row",
                      "children": [
                        { "type": "text", "value": "★ ", "font_size": 10 },
                        { "type": "text", "value": "Product B - Essential Gadget", "font_size": 12 }
                      ]
                    },
                    { "type": "text", "value": "The everyday gadget you didn't know you needed until now.", "font_size": 8 }
                  ]
                }, 
                "price": "\$45.00" 
              }
            ]
          }
        ]
      }
    ]
  }
  ''';

  final Map<String, dynamic> config = jsonDecode(jsonString);

  return Scaffold(
    appBar: AppBar(
        title: const Text('LayoutPrint Table with Component Cells Demo')),
    body: PdfPreview(
      build: (format) => JsonPdfGenerator.generate(config),
      allowPrinting: true,
      allowSharing: true,
      canChangeOrientation: false,
      canChangePageFormat: false,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Daftar Inisial Personel (Complex Table)',
  type: PdfPreview,
  path: '[Print]',
)
Widget buildPersonnelListUseCase(BuildContext context) {
  const jsonString = '''
  {
    "id": "print_personnel_list",
    "name": "Daftar Inisial Personel",
    "layout_type": "canvas",
    "unit": "mm",
    "page_size": "A4",
    "orientation": "portrait",
    "pages": [
      {
        "background_color": "#FFFFFF",
        "components": [
          {
            "type": "table",
            "x": 10, "y": 10,
            "width": 190,
            "show_header": false,
            "columns": [
              { "header": "", "key": "logo", "flex": 2 },
              { "header": "", "key": "title", "flex": 6 },
              { "header": "", "key": "dates", "flex": 3 }
            ],
            "data": [
              {
                "logo": {
                  "type": "container",
                  "padding": 2,
                  "child": {
                    "type": "image",
                    "url": "https://picsum.photos/100",
                    "width": 30, "height": 30,
                    "fit": "contain"
                  }
                },
                "title": {
                  "type": "column",
                  "cross_axis_alignment": "center",
                  "children": [
                    { "type": "container", "height": 12 },
                    { "type": "text", "value": "DAFTAR INISIAL PERSONEL", "font_size": 18, "is_bold": true },
                    { "type": "container", "height": 8 },
                    { "type": "text", "value": "Quality Assurance", "font_size": 10 }
                  ]
                },
                "dates": {
                  "type": "column",
                  "children": [
                    { "type": "text", "value": "Effective Date :", "font_size": 8 },
                    { "type": "container", "height": 15 },
                    { "type": "text", "value": "Review Date :", "font_size": 8 }
                  ]
                }
              }
            ]
          },
          {
            "type": "table",
            "x": 10, "y": 45,
            "width": 190,
            "columns": [
              { "header": "No.", "key": "no", "flex": 1 },
              { "header": "Nama Personel", "key": "nama", "flex": 5 },
              { "header": "Inisial", "key": "inisial", "flex": 2 },
              { "header": "Paraf", "key": "paraf", "flex": 3 },
              { "header": "Tanda Tangan", "key": "ttd", "flex": 4 }
            ],
            "data": [
              { "no": "1.", "nama": "Sri Anjariyah", "inisial": "SAH", "paraf": "", "ttd": "1." },
              { "no": "2.", "nama": "Karina Dwi Lestari", "inisial": "KDL", "paraf": "", "ttd": "       2." },
              { "no": "3.", "nama": "Bestia Arkiani", "inisial": "BAI", "paraf": "", "ttd": "3." },
              { "no": "4.", "nama": "Helmy Akbar", "inisial": "HAR", "paraf": "", "ttd": "       4." },
              { "no": "5.", "nama": "Usha Nandeni", "inisial": "UNI", "paraf": "", "ttd": "5." },
              { "no": "6.", "nama": "Asep Tatang Sudrajat", "inisial": "ATS", "paraf": "", "ttd": "       6." },
              { "no": "7.", "nama": "Syahruddin", "inisial": "SRN", "paraf": "", "ttd": "7." },
              { "no": "8.", "nama": "Dede Mulyadi", "inisial": "DMI", "paraf": "", "ttd": "       8." },
              { "no": "9.", "nama": "Rheza Firmansyah", "inisial": "RFH", "paraf": "", "ttd": "9." },
              { "no": "10.", "nama": "Rahmat Hidayat", "inisial": "RDT", "paraf": "", "ttd": "       10." }
            ]
          }
        ]
      }
    ]
  }
  ''';

  final Map<String, dynamic> config = jsonDecode(jsonString);

  return Scaffold(
    appBar: AppBar(title: const Text('Daftar Inisial Personel')),
    body: PdfPreview(
      build: (format) => JsonPdfGenerator.generate(config),
      allowPrinting: true,
      allowSharing: true,
      canChangeOrientation: false,
      canChangePageFormat: false,
    ),
  );
}
