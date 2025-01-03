import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_detail.dart';

Future<Page> pdfReportInventoryControlForm(
  SalesOrder salesOrder,
  SalesOrderDetail salesOrderDetail,
  List<SalesOrderDetail> salesOrderDetails, {
  required int chunkIndex,
}) async {
  final font = await PdfGoogleFonts.nunitoRegular();

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
                    'DICHECK',
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
                    'Bag. Pengiriman',
                    style: TextStyle(
                      font: font,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 80),
              Column(
                children: [
                  Text(
                    'DIPACKING',
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
                    'Bag. Gudang',
                    style: TextStyle(
                      font: font,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
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
                    '3F-IK-C.4.2-002-1',
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
                    'Rev No:00',
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
                    'Issue Date:18 Oct 2023',
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
          SizedBox(height: 10),
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
          ),
        ],
      );
    },
    build: (Context context) {
      return [
        Column(
          children: [
            Container(
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 390,
                        child: Divider(
                          height: 1,
                          thickness: 1.0,
                          color: PdfColor.fromHex('#000000'),
                        ),
                      ),
                      Container(
                        width: 290,
                        height: 70,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'PT. METISKA FARMA',
                                style: TextStyle(
                                  fontSize: 13,
                                  letterSpacing: 0.25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'SURAT KONTROL PENGIRIMAN PRODUK JADI',
                                style: TextStyle(
                                  fontSize: 10,
                                  letterSpacing: 0.25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 390,
                        child: Divider(
                          height: 1,
                          thickness: 1.0,
                          color: PdfColor.fromHex('#000000'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 120,
                              child: Text(
                                'CUSTOMER NAME',
                                style: TextStyle(
                                  font: font,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Text(
                              ': - ${salesOrder.productRequest?.deliveryAddress.name}',
                              style: TextStyle(
                                font: font,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            SizedBox(
                              width: 120,
                              child: Text(
                                'NO. SJ',
                                style: TextStyle(
                                  font: font,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Text(
                              ': ${salesOrder.deliveryOrderId}',
                              style: TextStyle(
                                font: font,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 120,
                              child: Text(
                                'DIPACK DGN MB',
                                style: TextStyle(
                                  font: font,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Text(
                              ': ${salesOrderDetail.product?.name}',
                              style: TextStyle(
                                font: font,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 120,
                              child: Text(
                                'MASTERBOX KE',
                                style: TextStyle(
                                  font: font,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Text(
                              ': ${chunkIndex}',
                              style: TextStyle(
                                font: font,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 300,
                              child: Text(
                                'Barang-barang tersebut dibawah telah diperiksa dengan benar',
                                style: TextStyle(
                                  font: font,
                                  fontSize: 10,
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
            Table(
              // border:  TableBorder.all(),
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 1,
                        color: PdfColor.fromHex('#000000'),
                      ),
                      bottom: BorderSide(
                        width: 1,
                        color: PdfColor.fromHex('#000000'),
                      ),
                    ),
                  ),
                  children: [
                    Container(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Jumlah',
                              style: TextStyle(
                                fontSize: 8,
                                font: font,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 185,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Nama Barang',
                              style: TextStyle(
                                fontSize: 8,
                                font: font,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Batch No.',
                              style: TextStyle(
                                fontSize: 8,
                                font: font,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Container(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${salesOrderDetail.product?.quantityPack} ${salesOrderDetail.unit.id}',
                              style: TextStyle(
                                fontSize: 8,
                                font: font,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 185,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${salesOrderDetail.product?.id}',
                              style: TextStyle(
                                fontSize: 8,
                                font: font,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${salesOrderDetail.batchNo.id}',
                              style: TextStyle(
                                fontSize: 8,
                                font: font,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ];
    },
  );
}
