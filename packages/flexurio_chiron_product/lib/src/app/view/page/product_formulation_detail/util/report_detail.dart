import 'package:flexurio_chiron_product/src/app/model/product_formulation.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation_detail.dart';
import 'package:flutter/material.dart' as ui;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 12);

Future<Page> pdfDetailBillOfMaterial(
  ProductFormulation productFormulation,
  List<ProductFormulationDetail> details,
  ui.BuildContext buildContext,
  String companyName,
) async {
  final columnWidth = {
    0: const FlexColumnWidth(60),
    1: const FlexColumnWidth(120),
    2: const FlexColumnWidth(60),
    3: const FlexColumnWidth(60),
    4: const FlexColumnWidth(60),
  };
  final font = await PdfGoogleFonts.nunitoExtraLight();
  Widget buildRow(String title, String value) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            SizedBox(
              width: 90,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 10,
                  font: font,
                ),
              ),
            ),
            Text(
              ': ',
              style: TextStyle(
                fontSize: 10,
                font: font,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 10,
                font: font,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final tableHeader = TableRow(
    verticalAlignment: TableCellVerticalAlignment.full,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          width: 3,
          color: pdfPrimaryColor(buildContext),
        ),
      ),
    ),
    children: [
      Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          'Material ID',
          style: TextStyle(
            fontSize: 10,
            font: font,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          'Material Name',
          style: TextStyle(
            fontSize: 10,
            font: font,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          'Material Unit',
          style: TextStyle(
            fontSize: 10,
            font: font,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          'Material Group',
          style: TextStyle(
            fontSize: 10,
            font: font,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          'Quantity',
          style: TextStyle(
            fontSize: 10,
            font: font,
          ),
        ),
      ),
    ],
  );

  return MultiPage(
    theme: ThemeData.withFont(
      icons: await PdfGoogleFonts.materialIcons(),
    ),
    pageFormat: PdfPageFormat.a4,
    header: (context) {
      return Column(
        children: [
          Text(
            'Bill of Material Report',
            style: TextStyle(
              font: font,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 6),
          Text(
            companyName,
            style: TextStyle(font: font),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Padding(
                padding: paddingRow,
                child: Text(
                  '${productFormulation.product.id} - ${productFormulation.product.name}',
                  style: TextStyle(fontWeight: FontWeight.bold, font: font),
                ),
              ),
              Divider(
                height: 3,
                thickness: 3,
                color: pdfPrimaryColor(buildContext),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildRow('ID', productFormulation.name ?? '-'),
                    SizedBox(height: 5),
                    Divider(height: 1, thickness: 1, color: PdfColors.grey300),
                    SizedBox(height: 5),
                    buildRow(
                      'Scale',
                      productFormulation.scale.productFormulationScale,
                    ),
                    SizedBox(height: 5),
                    Divider(height: 1, thickness: 1, color: PdfColors.grey300),
                    SizedBox(height: 5),
                    buildRow('Quantity', '${productFormulation.quantity}'),
                    SizedBox(height: 5),
                    Divider(height: 1, thickness: 1, color: PdfColors.grey300),
                    SizedBox(height: 5),
                    buildRow('Unit', productFormulation.unit),
                    SizedBox(height: 5),
                    Divider(height: 1, thickness: 1, color: PdfColors.grey300),
                    SizedBox(height: 5),
                    buildRow('Remark', productFormulation.description ?? '-'),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Table(children: [tableHeader], columnWidths: columnWidth),
            ],
          ),
        ],
      );
    },
    build: (Context context) {
      final tableRow = <TableRow>[];
      for (var i = 0; i < details.length; i++) {
        final formulation = details[i];
        tableRow.add(
          TableRow(
            verticalAlignment: TableCellVerticalAlignment.full,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: PdfColors.grey300,
                ),
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  formulation.material.id,
                  style: TextStyle(
                    fontSize: 10,
                    font: font,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  formulation.material.name,
                  style: TextStyle(
                    fontSize: 10,
                    font: font,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  formulation.material.stockUnit.id,
                  style: TextStyle(
                    fontSize: 10,
                    font: font,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  formulation.material.materialGroup.id,
                  style: TextStyle(
                    fontSize: 10,
                    font: font,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  '${formulation.quantity}',
                  style: TextStyle(
                    fontSize: 10,
                    font: font,
                  ),
                ),
              ),
            ],
          ),
        );
      }
      return [
        Table(
          children: tableRow,
          columnWidths: columnWidth,
        ),
      ];
    },
  );
}

PdfColor convertToPdfColor(ui.Color color) {
  return PdfColor.fromInt(
    color.value,
  );
}

PdfColor pdfPrimaryColor(ui.BuildContext context) {
  return convertToPdfColor(ui.Theme.of(context).colorScheme.primary);
}
