import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/report_form_material_return.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

Future<Page> pdfAdjustmentMaterial(
  MaterialReturn materialReturn,
  List<ReportFormMaterialReturn> reportFormMaterialReturns, {
  required int chunkIndex,
}) async {
  final font = await PdfGoogleFonts.nunitoRegular();
  final fontBold = await PdfGoogleFonts.nunitoBold();

  final groupByReportFormMaterialReturns = groupBy<ReportFormMaterialReturn>(
    reportFormMaterialReturns,
    (element) => element.na,
  ).entries;

  final children = <TableRow>[];
  return MultiPage(
    pageFormat: PdfPageFormat.a5.portrait,
    margin: const EdgeInsets.all(15),
    footer: (context) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Dibuat Oleh, :',
                    style: TextStyle(
                      font: font,
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    '(                           )',
                    style: TextStyle(
                      font: font,
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    width: 100,
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: PdfColor.fromHex('#000000'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Kepala Gudang',
                    style: TextStyle(
                      font: font,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 40),
              Column(
                children: [
                  Text(
                    'Diketahui Oleh,',
                    style: TextStyle(
                      font: font,
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    '(                           )',
                    style: TextStyle(
                      font: font,
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    width: 100,
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: PdfColor.fromHex('#000000'),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Bagian PPIC',
                    style: TextStyle(
                      font: font,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 40),
              Column(
                children: [
                  Text(
                    'Diperiksa Oleh,',
                    style: TextStyle(
                      font: font,
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    '(                           )',
                    style: TextStyle(
                      font: font,
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    width: 100,
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: PdfColor.fromHex('#000000'),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Warehouse SPV',
                    style: TextStyle(
                      font: font,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Print By : ${UserRepositoryApp.instance.userApp == null ? '-' : UserRepositoryApp.instance.userApp!.name}',
                style: TextStyle(
                  font: font,
                  fontSize: 8,
                ),
              ),
            ],
          )
        ],
      );
    },
    build: (Context context) {
      final tables = <Widget>[];
      children.add(
        TableRow(
          decoration: BoxDecoration(
            border: Border.all(
              color: PdfColor.fromHex('#000000'),
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              child: Center(
                child: Text(
                  'Jumlah',
                  style: TextStyle(
                    fontSize: 8,
                    font: font,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              child: Center(
                child: Text(
                  'Material Name',
                  style: TextStyle(
                    fontSize: 8,
                    font: font,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              child: Center(
                child: Text(
                  'NA',
                  style: TextStyle(
                    fontSize: 8,
                    font: font,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              child: Center(
                child: Text(
                  'ExDate',
                  style: TextStyle(
                    fontSize: 8,
                    font: font,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
      List.generate(
        groupByReportFormMaterialReturns.length,
        (index) {
          return children.add(
            TableRow(
              decoration: BoxDecoration(
                border: Border.all(
                  color: PdfColor.fromHex('#000000'),
                ),
              ),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                  child: Center(
                    child: Text(
                      '${groupByReportFormMaterialReturns.fold<double>(0, (previousValue, element) => previousValue + element.value.fold<double>(0, (previousValue, element) => previousValue + element.quantity))} ${reportFormMaterialReturns[index].materialUnit.id}',
                      style: TextStyle(
                        fontSize: 8,
                        font: font,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        reportFormMaterialReturns[index].material.name,
                        style: TextStyle(
                          fontSize: 8,
                          font: font,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                  child: Center(
                    child: Text(
                      '${reportFormMaterialReturns[index].na}',
                      style: TextStyle(
                        fontSize: 8,
                        font: font,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                  child: Center(
                    child: Text(
                      DateFormat('MMMM yyyy').format(
                          reportFormMaterialReturns[index]
                              .materialReturn
                              .productionOrder
                              .expirationDate),
                      style: TextStyle(
                        fontSize: 8,
                        font: font,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
      tables.add(
        Table(
          border: TableBorder.all(),
          children: children,
        ),
      );
      return [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'PT. METISKA FARMA',
              style: TextStyle(
                font: fontBold,
                fontSize: 14,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Text(
              'Adjustment Material',
              style: TextStyle(
                font: fontBold,
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
            BarcodeWidget(
              barcode: Barcode.qrCode(),
              data: materialReturn.id,
              width: 40,
              height: 40,
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(
          'Adjustment Penambahan Material ${(materialReturn.materialGroup.id)} per tanggal ${DateFormat('dd MMM yyyy').format(materialReturn.createdAt)}.',
          style: TextStyle(
            fontSize: 9,
          ),
        ),
        SizedBox(height: 5),
        Table(
          border: TableBorder.all(),
          children: children,
        ),
        SizedBox(height: 5),
        SizedBox(
          height: 60,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 80,
                          child: Text(
                            'No. Trans',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ': ${materialReturn.id}',
                          style: TextStyle(
                            font: font,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 80,
                          child: Text(
                            'tgl. Trans',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ': ${DateFormat('dd MMM yyyy').format(materialReturn.createdAt)}',
                          style: TextStyle(
                            font: font,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                      width: 570,
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: PdfColor.fromHex('#000000'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat('dd/MM/yyyy h:mm a').format(DateTime.now()),
              style: TextStyle(
                font: fontBold,
                fontSize: 9,
              ),
            ),
            Text(
              'Jakarta, ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
              style: TextStyle(
                font: fontBold,
                fontSize: 9,
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
      ];
    },
  );
}
