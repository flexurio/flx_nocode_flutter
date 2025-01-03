import 'package:flexurio_chiron_material_stock/src/app/model/material_issue_detail.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:flutter/services.dart';

Future<Page> pdfPackagingMaterialDelivery(
  MaterialIssueDetail materialIssueDetail,
  List<MaterialIssueDetail> materialIssueDetails, {
  required int chunkIndex,
}) async {
  final font = await PdfGoogleFonts.nunitoRegular();
  // final fontBold = await PdfGoogleFonts.nunitoBold();
  final logo = await rootBundle.load('asset/image/logo-company-01.png');
  final companyLogo = logo.buffer.asUint8List();
  final name = await rootBundle.load('asset/image/logo-name-company-01.png');
  final companyName = name.buffer.asUint8List();

  final children = <TableRow>[];

  return MultiPage(
    pageFormat: PdfPageFormat.a5.landscape,
    margin: EdgeInsets.zero,
    footer: (context) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: PdfColor.fromHex('#000000'),
                  ),
                ),
                child: Text(
                  'Form.No:F-IK-S.5.2-001-3',
                  style: TextStyle(
                    font: font,
                    fontSize: 8,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: PdfColor.fromHex('#000000'),
                  ),
                ),
                child: Text(
                  'Rev.No:01',
                  style: TextStyle(
                    font: font,
                    fontSize: 8,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: PdfColor.fromHex('#000000'),
                  ),
                ),
                child: Text(
                  'Issue Date:25 Mar 2023',
                  style: TextStyle(
                    font: font,
                    fontSize: 8,
                  ),
                ),
              ),
            ),
            SizedBox(width: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Page ${context.pageNumber} of ${context.pagesCount}',
                  style: TextStyle(
                    font: font,
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ],
        ),
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
              child: Text(
                'Jumlah',
                style: TextStyle(
                  fontSize: 8,
                  font: font,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              child: Text(
                'Nama Barang',
                style: TextStyle(
                  fontSize: 8,
                  font: font,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              child: Text(
                'NA',
                style: TextStyle(
                  fontSize: 8,
                  font: font,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              child: Text(
                'No. Batch',
                style: TextStyle(
                  fontSize: 8,
                  font: font,
                ),
              ),
            ),
          ],
        ),
      );
      List.generate(
        materialIssueDetails.length,
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
                  child: Text(
                    '${materialIssueDetails[index].quantity} ${materialIssueDetails[index].material.stockUnit.id}',
                    style: TextStyle(
                      fontSize: 8,
                      font: font,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                  child: Text(
                    materialIssueDetails[index].material.name,
                    style: TextStyle(
                      fontSize: 8,
                      font: font,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                  child: Text(
                    materialIssueDetails[index].na,
                    style: TextStyle(
                      fontSize: 8,
                      font: font,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                  child: Text(
                    materialIssueDetails[index].na,
                    style: TextStyle(
                      fontSize: 8,
                      font: font,
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
        Container(
          child: Row(
            children: [
              Container(
                width: 120,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      child: Image(MemoryImage(companyLogo)),
                    ),
                    Container(
                      height: 35,
                      width: 70,
                      child: Image(MemoryImage(companyName)),
                    ),
                  ],
                ),
              ),
              Container(
                width: 480,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: Text(
                    'LABEL PENYERAHAN BAHAN PENGEMAS',
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 0.25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 195,
          padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
          decoration: BoxDecoration(
            color: PdfColor.fromHex('#FFFFFF'),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 2),
                          width: 200,
                          child: Text(
                            'Nama Material',
                            style: TextStyle(
                              font: font,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Positioned(
                                left: 0,
                                child: Text(
                                  ': ${materialIssueDetail.material.name}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    font: font,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 2),
                          width: 200,
                          child: Text(
                            'Product/Batch',
                            style: TextStyle(
                              font: font,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Positioned(
                                left: 0,
                                child: Text(
                                  ': ${materialIssueDetail.materialIssue.product.name}/${materialIssueDetail.materialIssue.batch.id}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    font: font,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 2),
                          width: 200,
                          child: Text(
                            'Nomor Analisa',
                            style: TextStyle(
                              font: font,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Positioned(
                                left: 0,
                                child: Text(
                                  ': ${materialIssueDetail.na}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    font: font,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Positioned(
                                left: 0,
                                child: Text(
                                  'Kode Desain : ${materialIssueDetail.designCode ?? ''}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    font: font,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 2),
                          width: 200,
                          child: Text(
                            'Jumlah Diterima',
                            style: TextStyle(
                              font: font,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Positioned(
                                left: 0,
                                child: Text(
                                  ': ${materialIssueDetail.quantity} ${materialIssueDetail.weightedUnit}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    font: font,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 2),
                          width: 200,
                          child: Text(
                            'Paraf/Tgl',
                            style: TextStyle(
                              font: font,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Positioned(
                                left: 0,
                                child: Text(
                                  ':',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    font: font,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 4),
                  Text(
                    '(                                             )',
                    style: TextStyle(
                      font: font,
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 130,
                    child: Divider(
                      height: 1.5,
                      thickness: 1.5,
                      color: PdfColor.fromHex('#000000'),
                    ),
                  ),
                  SizedBox(height: 12),
                  Center(
                    child: Text(
                      'Paraf\n(Verifikasi Ka.Gudang/SPV )',
                      style: TextStyle(
                        font: font,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ];
    },
  );
}
