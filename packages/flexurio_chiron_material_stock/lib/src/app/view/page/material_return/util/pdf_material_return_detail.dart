import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/report_form_material_return.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:appointment/src/app/resource/user_repository.dart';

Future<Page> pdfMaterialReturnDetail({
  required MaterialReturn materialReturn,
  required List<ReportFormMaterialReturn> materialReturns,
}) async {
  final font = await PdfGoogleFonts.nunitoRegular();
  final fontBold = await PdfGoogleFonts.nunitoBold();
  final children = <TableRow>[];
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
                        fontSize: 21,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      materialReturn.materialGroup.id == "BAKU" ||
                              materialReturn.materialGroup.id == "BANTU"
                          ? 'Jl. Raya Kebayoran Lama 557\nGrogol Selatan - Kebayoran Lama'
                          : 'Jl. Raya Kebayoran Lama 557\nGrogol Selatan - Kebayoran Lama\nJakarta Selatan - DKI Jakarta 12220',
                      style: TextStyle(
                        font: font,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Nomor : ${materialReturn.id}',
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 22),
                    BarcodeWidget(
                      barcode: Barcode.qrCode(),
                      data: materialReturn.id,
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
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
              child: Text(
                'BON PENGEMBALIAN BAHAN ${materialReturn.materialGroup.id == "BAKU" || materialReturn.materialGroup.id == "BANTU" ? 'AWAL' : materialReturn.materialGroup.id == "KEMASAN" ? 'PENGEMAS' : materialReturn.materialGroup.id}',
                style: const TextStyle(
                  fontSize: 15,
                  decoration: TextDecoration.underline,
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
                            fontSize: 11,
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
                          'Product Name',
                          style: TextStyle(
                            fontSize: 11,
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
                          'Batch Product',
                          style: TextStyle(
                            fontSize: 11,
                            font: font,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 7),
                        child: Text(
                          'Mat. Name',
                          style: TextStyle(
                            fontSize: 11,
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
                          'NA',
                          style: TextStyle(
                            fontSize: 11,
                            font: font,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 7),
                        child: Text(
                          'KD',
                          style: TextStyle(
                            fontSize: 11,
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
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    'Jakarta, ${DateFormat('dd/MM/yyyy').format(materialReturn.createdAt)}',
                    style: TextStyle(
                      font: fontBold,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Mengetahui,',
                        style: TextStyle(
                          font: font,
                          fontSize: 13,
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
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 100),
                  Column(
                    children: [
                      Text(
                        'Diterima Oleh,',
                        style: TextStyle(
                          font: font,
                          fontSize: 13,
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
                        'Bagian Gudang',
                        style: TextStyle(
                          font: font,
                          fontSize: 13,
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
                fontSize: 11,
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
                      // materialReturn.materialGroup.id == "BAKU" || materialReturn.materialGroup.id == "BANTU"
                      //   ? 'Form. No.: F-IK-C.5.2-001-2'
                      //   : 'Form. No.: F-IK-S.5.2-001-1',
                      'Form. No.: DIC-WHS-FR-0034C.01',
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
                      // materialReturn.materialGroup.id == "BAKU" || materialReturn.materialGroup.id == "BANTU"
                      //   ? 'Issue Date : 15 Nov 2023'
                      //   : 'Issue Date : 01-11-2023',
                      'Issue Date : 02-11-2020',
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
      final tables = <Widget>[];
      List.generate(
        materialReturns.length,
        (index) {
          return children.add(
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
                      '${materialReturns[index].quantity.format()} ${materialReturns[index].materialUnit.id}',
                      style: TextStyle(
                        fontSize: 11,
                        font: font,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                    child: Text(
                      materialReturns[index].materialReturn.product.name,
                      style: TextStyle(
                        fontSize: 11,
                        font: font,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                    child: Text(
                      materialReturns[index].materialReturn.productionOrder.id,
                      style: TextStyle(
                        fontSize: 11,
                        font: font,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                    child: Text(
                      materialReturns[index].material.name,
                      style: TextStyle(
                        fontSize: 11,
                        font: font,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                    child: Text(
                      materialReturns[index].na,
                      style: TextStyle(
                        fontSize: 11,
                        font: font,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                    child: Text(
                      materialReturns[index].designCode ?? '-',
                      style: TextStyle(
                        fontSize: 11,
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
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, bottom: 5),
          child: Table(
            border: TableBorder(
              horizontalInside: BorderSide.none,
              verticalInside: const BorderSide(color: PdfColors.black),
              top: const BorderSide(),
              bottom: const BorderSide(),
              left: const BorderSide(),
              right: const BorderSide(),
            ),
            children: children,
          ),
        ),
      );
      tables.add(
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, bottom: 5),
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
              '  Keterangan : ${materialReturn.remark}',
              style: TextStyle(
                font: font,
                fontSize: 11,
              ),
            ),
          ),
        ),
      );
      return tables;
    },
  );
}
