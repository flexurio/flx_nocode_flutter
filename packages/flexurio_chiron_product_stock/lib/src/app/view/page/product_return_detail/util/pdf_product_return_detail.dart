import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:appointment/src/app/resource/user_repository.dart';

Future<Page> pdfProductReturnDetail({
  required ProductReturn productReturn,
  required ProductReturnCheck productReturnCheck,
  required ProductIssue productIssue,
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
                        fontSize: 21,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Text(
                        'SURAT JALAN',
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'No. Ref : ${productReturn.id}',
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'No. Bukti : ${productIssue.deliveryOrderId}',
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Departmen : ${productReturn.department.name}',
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 22),
                      Text(
                        'Keterangan : \n\n${productReturnCheck.status.id}',
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BarcodeWidget(
                            barcode: Barcode.qrCode(),
                            data: productReturn.id,
                            width: 45,
                            height: 45,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
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
                          'No',
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
                          'Nama Barang',
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
                          'No. Batch',
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
                          'Ex. Date',
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
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Jakarta, ${DateFormat('dd/MM/yyyy h:mm a').format(DateTime.now())}',
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
                        'Petugas,',
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
                      SizedBox(height: 10),
                    ],
                  ),
                  SizedBox(width: 100),
                  Column(
                    children: [
                      SizedBox(height: 10),
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
                        'Mengetahui,',
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
                      '',
                      style: TextStyle(
                        font: font,
                        fontSize: 8,
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
                      '',
                      style: TextStyle(
                        font: font,
                        fontSize: 8,
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
                      '',
                      style: TextStyle(
                        font: font,
                        fontSize: 8,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              'Print By : $printedBy',
              style: TextStyle(
                font: font,
                fontSize: 11,
              ),
            ),
          ],
        ),
      );
    },
    build: (Context context) {
      return [
        Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Table(border: TableBorder.all(), children: [
              TableRow(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: PdfColor.fromHex('#000000'),
                    ),
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
                        '${1}'
                        '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
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
                        '${productReturnCheck.productId.name}'
                        '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
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
                        '${productReturnCheck.quantity}'
                        ' ${productReturnCheck.unitId.id}'
                        '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
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
                        '${productReturnCheck.batch.id}'
                        '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
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
                        '${DateFormat('MMM yyyy').format(productReturnCheck.batch.expirationDate)}'
                        '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
                        style: TextStyle(
                          fontSize: 11,
                          font: font,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]))
      ];
    },
  );
}
