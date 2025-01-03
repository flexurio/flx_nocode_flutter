import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_issue.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_issue_detail_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:appointment/src/app/resource/user_repository.dart';

Future<Page> pdfMaterialIssueDetail({
  required MaterialIssue materialIssue,
  required List<MaterialIssuesDetailReport> materialIssues,
}) async {
  final font = await PdfGoogleFonts.nunitoRegular();
  final fontBold = await PdfGoogleFonts.nunitoBold();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '-';

  return MultiPage(
    pageFormat: PdfPageFormat.a4.portrait,
    margin: EdgeInsets.zero,
    header: (context) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PT. METISKA FARMA',
                      style: TextStyle(
                        font: fontBold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      materialIssue.materialGroup.id == "BAKU" ||
                              materialIssue.materialGroup.id == "BANTU"
                          ? 'Jl. Raya Kebayoran Lama 557\nGrogol Selatan - Kebayoran Lama'
                          : 'Jl. Raya Kebayoran Lama 557\nGrogol Selatan - Kebayoran Lama\nJakarta Selatan - DKI Jakarta 12220',
                      style: TextStyle(
                        font: font,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      'Nomor : ${materialIssue.id}',
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 17),
                    BarcodeWidget(
                      barcode: Barcode.qrCode(),
                      data: materialIssue.id,
                      width: 40,
                      height: 40,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Text(
                'BON PENYERAHAN BAHAN ${materialIssue.materialGroup.id == "BAKU" || materialIssue.materialGroup.id == "BANTU" ? 'AWAL' : materialIssue.materialGroup.id == "KEMASAN" ? "PENGEMAS" : materialIssue.materialGroup.id}',
                style: const TextStyle(
                  fontSize: 17,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 5),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: PdfColor.fromHex('#000000'),
                  width: 1.2,
                ),
              ),
              child: Text(
                '  Keterangan : ${materialIssue.product.name} (${materialIssue.batch.id}). Exp. Date : ${materialIssues.isNotEmpty ? materialIssues[0].materialIssue.productionExpiredDate != null && materialIssues[0].materialIssue.product.id != '' ? DateFormat('MMM yyyy').format(materialIssue.productionExpiredDate!) : '-' : '-'}. Remark : ${materialIssue.remarks != '' ? materialIssue.remarks : '-'}',
                style: TextStyle(
                  font: font,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: PdfColor.fromHex('#000000'),
                    ),
                  ),
                  children: [
                    Container(
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 7,
                        ),
                        child: Text(
                          'Qty',
                          style: TextStyle(
                            fontSize: 12,
                            font: font,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 7),
                        child: Text(
                          'Nama Barang',
                          style: TextStyle(
                            fontSize: 12,
                            font: font,
                          ),
                        ),
                      ),
                    ),
                    if (materialIssue.materialGroup.id == "BAKU" ||
                        materialIssue.materialGroup.id == "BANTU")
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 7),
                          child: Text(
                            'Retest Date',
                            style: TextStyle(
                              fontSize: 12,
                              font: font,
                            ),
                          ),
                        ),
                      ),
                    if (materialIssue.materialGroup.id == "BAKU" ||
                        materialIssue.materialGroup.id == "BANTU")
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 7),
                          child: Text(
                            'Exp Date',
                            style: TextStyle(
                              fontSize: 12,
                              font: font,
                            ),
                          ),
                        ),
                      ),
                    if (materialIssue.materialGroup.id == "BAKU" ||
                        materialIssue.materialGroup.id == "BANTU")
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 7),
                          child: Text(
                            'Keterangan',
                            style: TextStyle(
                              fontSize: 12,
                              font: font,
                            ),
                          ),
                        ),
                      ),
                    if (materialIssue.materialGroup.id != "BAKU" &&
                        materialIssue.materialGroup.id != "BANTU")
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 7),
                          child: Text(
                            'NA',
                            style: TextStyle(
                              fontSize: 12,
                              font: font,
                            ),
                          ),
                        ),
                      ),
                    if (materialIssue.materialGroup.id != "BAKU" &&
                        materialIssue.materialGroup.id != "BANTU")
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 7),
                          child: Text(
                            'Kode Design',
                            style: TextStyle(
                              fontSize: 12,
                              font: font,
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
      );
    },
    footer: (context) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('dd/MM/yyyy h:mm a').format(DateTime.now()),
                    style: TextStyle(
                      font: fontBold,
                      fontSize: 9,
                    ),
                  ),
                  Text(
                    'Jakarta, ${DateFormat('dd/MM/yyyy').format(materialIssue.createdAt)}',
                    style: TextStyle(
                      font: fontBold,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40, left: 40, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Yang Menerima,',
                        style: TextStyle(
                          font: font,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 45),
                      SizedBox(
                        width: 130,
                        child: Divider(
                          height: 1.2,
                          thickness: 1.2,
                          color: PdfColor.fromHex('#000000'),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Dept. Produksi / Dept. Lain',
                        style: TextStyle(
                          font: font,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 100),
                  Column(
                    children: [
                      Text(
                        'Yang Menyerahkan,',
                        style: TextStyle(
                          font: font,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 45),
                      SizedBox(
                        width: 130,
                        child: Divider(
                          height: 1.2,
                          thickness: 1.2,
                          color: PdfColor.fromHex('#000000'),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Dept. ${materialIssue.department.name}',
                        style: TextStyle(
                          font: font,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              'Print By : $printedBy',
              style: TextStyle(
                font: font,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PdfColor.fromHex('#000000'),
                      ),
                    ),
                    child: Text(
                      materialIssue.materialGroup.id == "BAKU" ||
                              materialIssue.materialGroup.id == "BANTU"
                          ? 'Form. No.: F-IK-C.5.2-001-2'
                          : 'Form. No.: F-IK-S.5.2-001-1',
                      style: TextStyle(
                        font: font,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PdfColor.fromHex('#000000'),
                      ),
                    ),
                    child: Text(
                      'Rev. No. : 00',
                      style: TextStyle(
                        font: font,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PdfColor.fromHex('#000000'),
                      ),
                    ),
                    child: Text(
                      materialIssue.materialGroup.id == "BAKU" ||
                              materialIssue.materialGroup.id == "BANTU"
                          ? 'Issue Date : 15 Nov 2023'
                          : 'Issue Date : 01-11-2023',
                      style: TextStyle(
                        font: font,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
    build: (Context context) {
      final tables = <Table>[];
      List.generate(
        materialIssues.length,
        (index) {
          return tables.add(
            Table(
                border: TableBorder(
                  horizontalInside: BorderSide.none,
                  verticalInside: const BorderSide(color: PdfColors.black),
                  top: const BorderSide(),
                  bottom: const BorderSide(),
                  left: const BorderSide(),
                  right: const BorderSide(),
                ),
                children: [
                  TableRow(
                    children: [
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 7,
                          ),
                          child: Text(
                            '${materialIssues[index].quantity} ${materialIssues[index].materialUnit.id}',
                            style: TextStyle(
                              fontSize: 12,
                              font: font,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 7),
                          child: Text(
                            materialIssues[index].material.name,
                            style: TextStyle(
                              fontSize: 12,
                              font: font,
                            ),
                          ),
                        ),
                      ),
                      if (materialIssue.materialGroup.id == "BAKU" ||
                          materialIssue.materialGroup.id == "BANTU")
                        Container(
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 7,
                            ),
                            child: Text(
                              materialIssues[index].retestDateQc?.ddMMyyyySlash ??
                                  '-',
                              style: TextStyle(
                                fontSize: 12,
                                font: font,
                              ),
                            ),
                          ),
                        ),
                      if (materialIssue.materialGroup.id == "BAKU" ||
                          materialIssue.materialGroup.id == "BANTU")
                        Container(
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 7,
                            ),
                            child: Text(
                              materialIssues[index].expiredDate
                                      ?.ddMMyyyySlash ??
                                  materialIssues[index].retestDate
                                      ?.ddMMyyyySlash ??
                                  materialIssues[index].bestBefore
                                      ?.ddMMyyyySlash ??
                                  materialIssues[index].shelfLife
                                      ?.ddMMyyyySlash ??
                                  '',
                              style: TextStyle(
                                fontSize: 12,
                                font: font,
                              ),
                            ),
                          ),
                        ),
                      if (materialIssue.materialGroup.id == "BAKU" ||
                          materialIssue.materialGroup.id == "BANTU")
                        Container(
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 7,
                            ),
                            child: Text(
                              materialIssues[index].na,
                              style: TextStyle(
                                fontSize: 12,
                                font: font,
                              ),
                            ),
                          ),
                        ),
                      if (materialIssue.materialGroup.id != "BAKU" &&
                          materialIssue.materialGroup.id != "BANTU")
                        Container(
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 7,
                            ),
                            child: Text(
                              materialIssues[index].na.isNotEmpty
                                  ? materialIssues[index].na
                                  : '-',
                              style: TextStyle(
                                fontSize: 12,
                                font: font,
                              ),
                            ),
                          ),
                        ),
                      if (materialIssue.materialGroup.id != "BAKU" &&
                          materialIssue.materialGroup.id != "BANTU")
                        Container(
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 7),
                            child: Text(
                              materialIssues[index].designCode ?? '-',
                              style: TextStyle(
                                fontSize: 12,
                                font: font,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ]),
          );
        },
      );
      return [
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, bottom: 5),
          child: Column(
            children: tables,
          ),
        ),
      ];
    },
  );
}
