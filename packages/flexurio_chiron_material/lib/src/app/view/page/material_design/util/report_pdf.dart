import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart' as ui;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Page> pdfMaterialDesign(
  List<MaterialDesign> data,
  ui.BuildContext buildContext,
) async {
  final font = await PdfGoogleFonts.nunitoExtraLight();
  const fontSize = 9.0;
  return MultiPage(
    margin: const EdgeInsets.all(24),
    pageFormat: PdfPageFormat.a4.portrait,
    header: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Report Code Design',
            style: TextStyle(
              font: font,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 6),
          Text(
            flavorConfig.companyName,
            style: TextStyle(font: font),
          ),
          SizedBox(height: 25),
          Table(
            columnWidths: {
              0: const FlexColumnWidth(20),
              1: const FlexColumnWidth(40),
              2: const FlexColumnWidth(50),
              3: const FlexColumnWidth(40),
              4: const FlexColumnWidth(60),
            },
            children: [
              TableRow(
                decoration: BoxDecoration(
                  border: TableBorder(
                    bottom: BorderSide(
                      width: 2,
                      color: pdfPrimaryColor(buildContext),
                    ),
                  ),
                ),
                verticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                        left: 5,
                        right: 5,
                      ),
                      child: Text(
                        'No',
                        style: TextStyle(
                          fontSize: fontSize,
                          font: font,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                      left: 5,
                      right: 5,
                    ),
                    child: Text(
                      'Kode Desain',
                      style: TextStyle(
                        fontSize: fontSize,
                        font: font,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                      left: 5,
                      right: 5,
                    ),
                    child: Text(
                      'Product Name',
                      style: TextStyle(
                        fontSize: fontSize,
                        font: font,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                      left: 5,
                      right: 5,
                    ),
                    child: Text(
                      'Material ID',
                      style: TextStyle(
                        fontSize: fontSize,
                        font: font,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                      left: 5,
                      right: 5,
                    ),
                    child: Text(
                      'Material Name',
                      style: TextStyle(
                        fontSize: fontSize,
                        font: font,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    },
    build: (context) {
      final tableRows = <TableRow>[];
      for (var i = 0; i < data.length; i++) {
        final materialDesign = data[i];
        tableRows.add(
          TableRow(
            decoration: const BoxDecoration(
              border: TableBorder(
                bottom: BorderSide(
                  width: 0.8,
                  color: PdfColors.grey,
                ),
              ),
            ),
            verticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              Center(
                child: Text(
                  (i + 1).toString(),
                  style: TextStyle(
                    fontSize: fontSize,
                    font: font,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                  left: 5,
                  right: 5,
                ),
                child: Text(
                  materialDesign.designCode,
                  style: TextStyle(
                    fontSize: fontSize,
                    font: font,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                  left: 5,
                  right: 5,
                ),
                child: Text(
                  materialDesign.formulation.product.name,
                  style: TextStyle(
                    fontSize: fontSize,
                    font: font,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                  left: 5,
                  right: 5,
                ),
                child: Text(
                  materialDesign.material.id,
                  style: TextStyle(
                    fontSize: fontSize,
                    font: font,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                  left: 5,
                  right: 5,
                ),
                child: Text(
                  materialDesign.material.name,
                  style: TextStyle(
                    fontSize: fontSize,
                    font: font,
                  ),
                ),
              ),
            ],
          ),
        );
      }
      return [
        SizedBox(height: 5),
        Table(
          columnWidths: {
            0: const FlexColumnWidth(20),
            1: const FlexColumnWidth(40),
            2: const FlexColumnWidth(50),
            3: const FlexColumnWidth(40),
            4: const FlexColumnWidth(60),
          },
          children: tableRows,
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
