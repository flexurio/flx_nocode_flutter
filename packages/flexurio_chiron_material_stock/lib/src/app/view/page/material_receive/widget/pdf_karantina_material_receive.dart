import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Page> pdfKarantinaMaterialReceive(
  MaterialReceiveDetail materialReceiveDetail,
  List<MaterialReceiveDetail> materialReceiveDetails, {
  required int chunkIndex,
}) async {
  final font = await PdfGoogleFonts.nunitoRegular();
  final fontBold = await PdfGoogleFonts.nunitoBold();

  final children = <TableRow>[];
  // final number = (chunkIndex * 1) + 1;
  final number = chunkIndex;
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
                  'Form.No:F-IK-I.1.1-001-1',
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
                  'Rev.No:00',
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
                  'Issue Date:25 Mei 2023',
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
        materialReceiveDetails.length,
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
                    '${materialReceiveDetails[index].quantity} ${materialReceiveDetails[index].material.stockUnit.id}',
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
                    materialReceiveDetails[index].material.name,
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
                    materialReceiveDetails[index].na,
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
                    materialReceiveDetails[index].batchNo,
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
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: PdfColor.fromHex('#FFFFFF'),
            border: Border(
              bottom: BorderSide(
                color: PdfColor.fromHex('#000000'),
                width: 4,
              ),
            ),
          ),
          child: Center(
            child: Text(
              'KARANTINA',
              style: TextStyle(
                font: fontBold,
                fontSize: 24,
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 195,
          padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: PdfColor.fromHex('#FFFFFF'),
            border: Border(
              bottom: BorderSide(
                color: PdfColor.fromHex('#000000'),
                width: 1.7,
              ),
            ),
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
                            'Nomor',
                            style: TextStyle(
                              font: font,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 2),
                            decoration: BoxDecoration(
                              color: PdfColor.fromHex('#FFFFFF'),
                              border: Border(
                                bottom: BorderSide(
                                  color: PdfColor.fromHex('#000000'),
                                  width: 1.7,
                                ),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Positioned(
                                left: 0,
                                child: Text(
                                  ': ${materialReceiveDetail.vatNo}',
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
                            'Nama Bahan/Produk',
                            style: TextStyle(
                              font: font,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 2),
                            decoration: BoxDecoration(
                              color: PdfColor.fromHex('#FFFFFF'),
                              border: Border(
                                bottom: BorderSide(
                                  color: PdfColor.fromHex('#000000'),
                                  width: 1.7,
                                ),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Positioned(
                                left: 0,
                                child: Text(
                                  ': ${materialReceiveDetail.material.name}',
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
                            'Nomor Analisa/Bets',
                            style: TextStyle(
                              font: font,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 2),
                            decoration: BoxDecoration(
                              color: PdfColor.fromHex('#FFFFFF'),
                              border: Border(
                                bottom: BorderSide(
                                  color: PdfColor.fromHex('#000000'),
                                  width: 1.7,
                                ),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Positioned(
                                left: 0,
                                child: Text(
                                  ': ${materialReceiveDetail.na}/${materialReceiveDetail.batchNo}',
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
                            'Pabrik Pembuat/Supplier',
                            style: TextStyle(
                              font: font,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 2),
                            decoration: BoxDecoration(
                              color: PdfColor.fromHex('#FFFFFF'),
                              border: Border(
                                bottom: BorderSide(
                                  color: PdfColor.fromHex('#000000'),
                                  width: 1.7,
                                ),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Positioned(
                                left: 0,
                                child: Text(
                                  // ': ${materialReceiveDetail.materialReceive.vendor.name == ''
                                  //   ? '-'
                                  //   : materialReceiveDetail.materialReceive.vendor.name
                                  // }/${materialReceiveDetail.materialReceive.purchaseOrder.supplier.name == ''
                                  //   ? '-'
                                  //   : materialReceiveDetail.materialReceive.purchaseOrder.supplier.name
                                  // }',
                                  ': ${materialReceiveDetails[0].materialReceive.vendor.name == '' ? '-' : materialReceiveDetails[0].materialReceive.vendor.name}/${materialReceiveDetails[0].materialReceive.purchaseOrder.supplier.name == '' ? '-' : materialReceiveDetails[0].materialReceive.purchaseOrder.supplier.name}',
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
                            decoration: BoxDecoration(
                              color: PdfColor.fromHex('#FFFFFF'),
                              border: Border(
                                bottom: BorderSide(
                                  color: PdfColor.fromHex('#000000'),
                                  width: 1.7,
                                ),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Positioned(
                                left: 0,
                                child: Text(
                                  ': ${materialReceiveDetail.quantity}',
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
                            'Nomor Wadah',
                            style: TextStyle(
                              font: font,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 2),
                            decoration: BoxDecoration(
                              color: PdfColor.fromHex('#FFFFFF'),
                              border: Border(
                                bottom: BorderSide(
                                  color: PdfColor.fromHex('#000000'),
                                  width: 1.7,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Positioned(
                                    left: 0,
                                    child: Text(
                                      ': ${materialReceiveDetail.vatNo}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        font: font,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 150),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Positioned(
                                    left: 0,
                                    child: Text(
                                      'dari   : ${materialReceiveDetail.vatTotal}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        font: font,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            'Tanggal',
                            style: TextStyle(
                              font: font,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 2),
                            decoration: BoxDecoration(
                              color: PdfColor.fromHex('#FFFFFF'),
                              border: Border(
                                bottom: BorderSide(
                                  color: PdfColor.fromHex('#000000'),
                                  width: 1.7,
                                ),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Positioned(
                                left: 0,
                                child: Text(
                                  ': ${DateFormat('dd MMM yyyy').format(DateTime.now())}',
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
              BarcodeWidget(
                barcode: Barcode.qrCode(),
                data:
                    '${materialReceiveDetail.na}/${materialReceiveDetail.vatNo} dari ${materialReceiveDetail.vatTotal}',
                width: 60,
                height: 60,
              ),
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
                  Text(
                    'Paraf',
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
        // Padding(
        //   padding: const EdgeInsets.only(left: 20),
        //   child: Text(
        //     'Print By : ${UserRepository.instance.user != null ? UserRepository.instance.user!.name : '-'}',
        //     style: TextStyle(
        //       font: font,
        //       fontSize: 8,
        //     ),
        //   ),
        // ),
        // Table(
        //   border: TableBorder.all(),
        //   children: children,
        // ),
      ];
    },
  );
}
