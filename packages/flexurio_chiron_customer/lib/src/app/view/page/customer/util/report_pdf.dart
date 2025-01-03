import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_design/util/report_pdf.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart' as ui;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Page> pdfCustomer(
  List<Customer> customers,
  ui.BuildContext buildContext,
) async {
  final font = await PdfGoogleFonts.nunitoBold();
  const fontSize = 10.0;
  const padding = EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 4);
  const tableWidth = {
    0: FlexColumnWidth(45), //Name
    1: FlexColumnWidth(30), //Code
    2: FlexColumnWidth(40), //Parent
    3: FlexColumnWidth(60), //Address
    4: FlexColumnWidth(30), //PIC
    5: FlexColumnWidth(25), //Postal Code
    6: FlexColumnWidth(52), //Phone
    7: FlexColumnWidth(60), //Email
    8: FlexColumnWidth(40), //NPWP
    9: FlexColumnWidth(40), //NPPKP
    10: FlexColumnWidth(28), //Term of Payment
    11: FlexColumnWidth(28), //Discount
  };
  return MultiPage(
    maxPages: 100,
    margin: const EdgeInsets.all(6),
    pageFormat: PdfPageFormat.a4.landscape,
    header: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'report_customer'.tr(),
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
            columnWidths: tableWidth,
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
                      padding: padding,
                      child: Text(
                        'name'.tr(),
                        style: TextStyle(
                          fontSize: fontSize,
                          font: font,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: padding,
                    child: Text(
                      'code'.tr(),
                      style: TextStyle(
                        fontSize: fontSize,
                        font: font,
                      ),
                    ),
                  ),
                  Padding(
                    padding: padding,
                    child: Text(
                      'parent'.tr(),
                      style: TextStyle(
                        fontSize: fontSize,
                        font: font,
                      ),
                    ),
                  ),
                  Padding(
                    padding: padding,
                    child: Text(
                      'address'.tr(),
                      style: TextStyle(
                        fontSize: fontSize,
                        font: font,
                      ),
                    ),
                  ),
                  Padding(
                    padding: padding,
                    child: Text(
                      'pic'.tr(),
                      style: TextStyle(
                        fontSize: fontSize,
                        font: font,
                      ),
                    ),
                  ),
                  Padding(
                    padding: padding,
                    child: Text(
                      'postal_code'.tr(),
                      style: TextStyle(
                        fontSize: fontSize,
                        font: font,
                      ),
                    ),
                  ),
                  Padding(
                    padding: padding,
                    child: Text(
                      'phone'.tr(),
                      style: TextStyle(
                        fontSize: fontSize,
                        font: font,
                      ),
                    ),
                  ),
                  Padding(
                    padding: padding,
                    child: Text(
                      'email'.tr(),
                      style: TextStyle(
                        fontSize: fontSize,
                        font: font,
                      ),
                    ),
                  ),
                  Padding(
                    padding: padding,
                    child: Text(
                      'npwp'.tr(),
                      style: TextStyle(
                        fontSize: fontSize,
                        font: font,
                      ),
                    ),
                  ),
                  Padding(
                    padding: padding,
                    child: Text(
                      'NPPKP',
                      style: TextStyle(
                        fontSize: fontSize,
                        font: font,
                      ),
                    ),
                  ),
                  Padding(
                    padding: padding,
                    child: Text(
                      'term_of_payment'.tr(),
                      style: TextStyle(
                        fontSize: fontSize,
                        font: font,
                      ),
                    ),
                  ),
                  Padding(
                    padding: padding,
                    child: Text(
                      'discount'.tr(),
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
      for (var i = 0; i < customers.length; i++) {
        final customer = customers[i];
        tableRows.add(
          TableRow(
            decoration: const BoxDecoration(
              border: TableBorder(
                bottom: BorderSide(
                  width: 1.2,
                  color: PdfColors.grey,
                ),
              ),
            ),
            verticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              Padding(
                padding: padding,
                child: Text(
                  customer.name,
                  style: TextStyle(
                    fontSize: fontSize,
                    font: font,
                  ),
                ),
              ),
              Padding(
                padding: padding,
                child: Text(
                  customer.id,
                  style: TextStyle(
                    fontSize: fontSize,
                    font: font,
                  ),
                ),
              ),
              Padding(
                padding: padding,
                child: Text(
                  customer.parent!.isEmpty ? '-' : customer.parent ?? '-',
                  style: TextStyle(
                    fontSize: fontSize,
                    font: font,
                  ),
                ),
              ),
              Padding(
                padding: padding,
                child: Text(
                  customer.address,
                  style: TextStyle(
                    fontSize: fontSize,
                    font: font,
                  ),
                ),
              ),
              Padding(
                padding: padding,
                child: Text(
                  customer.pic.isEmpty ? '-' : customer.pic,
                  style: TextStyle(
                    fontSize: fontSize,
                    font: font,
                  ),
                ),
              ),
              Padding(
                padding: padding,
                child: Text(
                  customer.postalCode.toString(),
                  style: TextStyle(
                    fontSize: fontSize,
                    font: font,
                  ),
                ),
              ),
              Padding(
                padding: padding,
                child: Text(
                  customer.phone.isEmpty ? '-' : customer.phone,
                  style: TextStyle(
                    fontSize: fontSize,
                    font: font,
                  ),
                ),
              ),
              Padding(
                padding: padding,
                child: Text(
                  customer.email.isEmpty ? '-' : customer.email,
                  style: TextStyle(
                    fontSize: fontSize,
                    font: font,
                  ),
                ),
              ),
              Padding(
                padding: padding,
                child: Text(
                  customer.npwp.isEmpty ? '-' : customer.npwp,
                  style: TextStyle(
                    fontSize: fontSize,
                    font: font,
                  ),
                ),
              ),
              Padding(
                padding: padding,
                child: Text(
                  customer.nppkp.isEmpty ? '-' : customer.nppkp,
                  style: TextStyle(
                    fontSize: fontSize,
                    font: font,
                  ),
                ),
              ),
              Padding(
                padding: padding,
                child: Text(
                  customer.termOfPayment.toString(),
                  style: TextStyle(
                    fontSize: fontSize,
                    font: font,
                  ),
                ),
              ),
              Padding(
                padding: padding,
                child: Text(
                  customer.discount?.format() ?? '-',
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
          children: tableRows,
          columnWidths: tableWidth,
        ),
      ];
    },
  );
}
