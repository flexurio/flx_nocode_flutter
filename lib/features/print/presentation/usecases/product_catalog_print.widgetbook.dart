import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:printing/printing.dart';
import 'dart:convert';
import '../../domain/json_pdf_generator.dart';

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
