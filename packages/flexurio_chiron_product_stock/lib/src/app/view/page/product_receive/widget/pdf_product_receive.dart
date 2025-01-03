import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive_detail.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Page> pdfProductReceive(
  ProductReceiveDetail productReceiveDetail,
  List<ProductReceiveDetail> productReceiveDetails, {
  required int chunkIndex,
}) async {
  final font = await PdfGoogleFonts.nunitoRegular();
  final fontBold = await PdfGoogleFonts.nunitoBold();

  final children = <TableRow>[];
  return MultiPage(
    pageFormat: PdfPageFormat.a5.portrait,
    margin: const EdgeInsets.all(15),
    footer: (context) {
      return Padding(
        padding: EdgeInsets.only(bottom: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Diterima Oleh, :',
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
                      'Bagian Gudang',
                      style: TextStyle(
                        font: font,
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
                if (productReceiveDetail.productReceive.id.substring(0, 3) ==
                    'BPP')
                  SizedBox(width: 40)
                else
                  SizedBox(width: 80),
                Column(
                  children: [
                    Text(
                      'Verifikasi Oleh,',
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
                if (productReceiveDetail.productReceive.id.substring(0, 3) ==
                    'BPP')
                  SizedBox(width: 40),
                if (productReceiveDetail.productReceive.id.substring(0, 3) ==
                    'BPP')
                  Column(
                    children: [
                      Text(
                        'Diserahkan Oleh,',
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
                        'Bagian Produksi',
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
            if (productReceiveDetail.productReceive.id.substring(0, 3) !=
                'BPP') ...[
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
                  Text(
                    'F-IK-C.4.1-011-1(20 Des 2023)',
                    style: TextStyle(
                      font: font,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
              SizedBox(),
            ] else
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: PdfColor.fromHex('#000000'),
                        ),
                      ),
                      child: Text(
                        'Form No. : F-IK-C.4.1-011-1',
                        style: TextStyle(
                          font: font,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: PdfColor.fromHex('#000000'),
                        ),
                      ),
                      child: Text(
                        'Rev. No : 00',
                        style: TextStyle(
                          font: font,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: PdfColor.fromHex('#000000'),
                        ),
                      ),
                      child: Text(
                        'Issued Date : 26 Feb 2024',
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
                  'Nama Barang',
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
                  'Keterangan',
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
        productReceiveDetails.length,
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
                      '${productReceiveDetails[index].quantity} ${productReceiveDetails[index].unit.id}',
                      style: TextStyle(
                        fontSize: 8,
                        font: font,
                        fontWeight: FontWeight.bold,
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
                        productReceiveDetails[index].product.id,
                        style: TextStyle(
                          fontSize: 8,
                          font: font,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        productReceiveDetails[index].product.name,
                        style: TextStyle(
                          fontSize: 8,
                          font: font,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productReceiveDetail.productionOrder.id == ''
                            ? '-'
                            : productReceiveDetail.productionOrder.id,
                        style: TextStyle(
                          fontSize: 8,
                          font: font,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        DateFormat('MMM yyyy').format(
                          productReceiveDetails[index].expiredDate,
                        ),
                        style: TextStyle(
                          fontSize: 8,
                          font: font,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
            Text(
              'No Trans : ${productReceiveDetail.productReceive.id}',
              style: TextStyle(
                font: fontBold,
                fontSize: 11,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Text(
              productReceiveDetail.productReceive.id.substring(0, 3) == 'BPP'
                  ? 'BON SERAH TERIMA PRODUK JADI'
                  : 'BON PENERIMAAN PRODUK JADI',
              style: TextStyle(
                font: fontBold,
                fontSize: 12,
                decoration: TextDecoration.underline,
              ),
            ),
            if (productReceiveDetail.productReceive.id.substring(0, 3) != 'BPP')
              BarcodeWidget(
                barcode: Barcode.qrCode(),
                data: productReceiveDetail.productReceive.id,
                width: 40,
                height: 40,
              )
            else
              SizedBox(),
          ],
        ),
        SizedBox(height: 10),
        Table(
          border: TableBorder.all(),
          children: children,
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
        SizedBox(height: 10),
        productReceiveDetails[0].productReceive.transactionType.id == '2A'
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No.PO : ${productReceiveDetail.productReceive.purchaseOrder.id}',
                    style: TextStyle(
                      fontSize: 9,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'No.SJ : ${productReceiveDetail.productReceive.deliveryOrderId}',
                    style: TextStyle(
                      fontSize: 9,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${'supplier'.tr()} : ${productReceiveDetail.productReceive.supplier.name}',
                    style: TextStyle(
                      fontSize: 9,
                    ),
                  ),
                ],
              )
            : Container(),
        SizedBox(height: 30),
      ];
    },
  );
}
