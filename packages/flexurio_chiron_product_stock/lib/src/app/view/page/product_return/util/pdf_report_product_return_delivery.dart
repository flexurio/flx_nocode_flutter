import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_check.dart';

Future<Page> pdfReportProductReturnDelivery(
  ProductReturn productReturn,
  List<ProductReturnCheck> productReturnChecks, {
  required int chunkIndex,
}) async {
  // final font = await PdfGoogleFonts.nunitoRegular();
  final logo = await rootBundle.load('asset/image/logo-company-01.png');
  final companyLogo = logo.buffer.asUint8List();
  final name = await rootBundle.load('asset/image/logo-name-company-01.png');
  final companyName = name.buffer.asUint8List();

  final childrenTable = <TableRow>[];
  return MultiPage(
    pageFormat: PdfPageFormat.a5.portrait,
    margin: const EdgeInsets.all(15),
    header: (context) {
      return Column(children: [
        SizedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35,
                      width: 35,
                      child: Image(MemoryImage(companyLogo)),
                    ),
                    SizedBox(
                      height: 35,
                      width: 70,
                      child: Image(MemoryImage(companyName)),
                    ),
                  ],
                ),
              ),
              Container(
                width: 200,
                padding: EdgeInsets.only(top: 40),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SALES RETUR PRODUK',
                        style: TextStyle(
                          fontSize: 13,
                          letterSpacing: 0.25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: Text(
                          'Tanggal',
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),
                      ),
                      Text(
                        ':',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 8,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${productReturn.createdAt.ddMMyyyySlash}',
                        style: TextStyle(
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                          child: Text(
                            'No SR',
                            style: TextStyle(
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ':',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 8,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${productReturn.id}',
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 50,
                          child: Text(
                            'No Ref',
                            style: TextStyle(
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ':',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 8,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            '${productReturn.referenceNo}',
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 8,
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
        Row(children: [
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Center(
              child: BarcodeWidget(
                barcode: Barcode.qrCode(),
                data: productReturn.id,
                width: 1.3 * PdfPageFormat.cm,
                height: 1.3 * PdfPageFormat.cm,
              ),
            ),
          ),
        ]),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: Text(
                          'Customer',
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),
                      ),
                      Text(
                        ':',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 8,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${productReturn.customer.name} - ${productReturn.customer.cityName}',
                        style: TextStyle(
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ]);
    },
    footer: (context) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Print By : ${UserRepositoryApp.instance.userApp == null ? '-' : UserRepositoryApp.instance.userApp!.name}',
                style: TextStyle(
                  fontSize: 8,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          productReturn.id.substring(0, 3) == 'SOS' ||
                  productReturn.id.substring(0, 3) == 'SOV'
              ? SizedBox(width: 0)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PdfColor.fromHex('#000000'),
                          ),
                        ),
                        child: Text(
                          'Issued Date:30 Agus 2023',
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PdfColor.fromHex('#000000'),
                          ),
                        ),
                        child: Text(
                          'Form.No.F-SOP-C.5-001',
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PdfColor.fromHex('#000000'),
                          ),
                        ),
                        child: Text(
                          'Rev.No:00',
                          style: TextStyle(
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
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
        ],
      );
    },
    build: (Context context) {
      final tables = <Widget>[];
      final signature = <Widget>[];
      signature.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Pemeriksa :',
                  style: TextStyle(
                    fontSize: 8,
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  '(                           )',
                  style: TextStyle(
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
                  'Dept. QA',
                  style: TextStyle(
                    fontSize: 8,
                  ),
                ),
              ],
            ),
            SizedBox(width: 40),
            Column(
              children: [
                Text(
                  'Mengetahui :',
                  style: TextStyle(
                    fontSize: 8,
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  '(                           )',
                  style: TextStyle(
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
                  'Dept. PPIC',
                  style: TextStyle(
                    fontSize: 8,
                  ),
                ),
              ],
            ),
            SizedBox(width: 40),
            Column(
              children: [
                Text(
                  'Jakarta, ${DateFormat('dd/MM/yyyy h:mm a').format(DateTime.now())}',
                  style: TextStyle(
                    fontSize: 8,
                  ),
                ),
                SizedBox(height: 80),
              ],
            ),
          ],
        ),
      );
      childrenTable.add(
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
                  'No',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              child: Center(
                child: Text(
                  'Qty Sat.',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              child: Center(
                child: Text(
                  'Unit',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              child: Center(
                child: Text(
                  'No. Batch',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              child: Center(
                child: Text(
                  'Ex. Date',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
      List.generate(
        productReturnChecks.length,
        (index) {
          return childrenTable.add(
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
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 8,
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
                        '${productReturnChecks[index].productId.name}',
                        style: TextStyle(
                          fontSize: 8,
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
                        '${productReturnChecks[index].quantity}',
                        style: TextStyle(
                          fontSize: 8,
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
                        '${productReturnChecks[index].unitId.id}',
                        style: TextStyle(
                          fontSize: 8,
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
                      '${productReturnChecks[index].batch.id}',
                      style: TextStyle(
                        fontSize: 8,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                  child: Center(
                    child: Text(
                      '${DateFormat('dd MMM yyyy').format(productReturnChecks[index].batch.expirationDate)}',
                      style: TextStyle(
                        fontSize: 8,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                  child: Center(
                    child: Text(
                      '${productReturnChecks[index].status.id}',
                      style: TextStyle(
                        fontSize: 8,
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
          children: childrenTable,
        ),
      );
      return [
        SizedBox(height: 10),
        ...tables,
        SizedBox(height: 60),
        signature[0]
      ];
    },
  );
}
