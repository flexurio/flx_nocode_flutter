import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_detail.dart';
import 'package:flutter/services.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

Future<Page> pdfReportSalesOder(
  SalesOrder salesOrder,
  List<SalesOrderDetail> salesOrderDetails, {
  required int chunkIndex,
}) async {
  final groupByProductReportSalesOrder = groupBy<SalesOrderDetail>(
    salesOrderDetails,
    (element) => element.productId,
  ).entries;
  final font = await PdfGoogleFonts.nunitoRegular();
  final logo = await rootBundle.load('asset/image/logo-company-01.png');
  final companyLogo = logo.buffer.asUint8List();
  final name = await rootBundle.load('asset/image/logo-name-company-01.png');
  final companyName = name.buffer.asUint8List();

  // final children = <TableRow>[];
  return MultiPage(
    pageFormat: PdfPageFormat.a5.portrait,
    margin: const EdgeInsets.all(15),
    header: (context) {
      return Column(children: [
        Container(
          child: Row(
            children: [
              Container(
                width: 100,
                height: 80,
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
                width: 290,
                height: 80,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SALES ORDER',
                        style: TextStyle(
                          fontSize: 13,
                          letterSpacing: 0.25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                        width: 200,
                        child: Divider(
                          height: 1,
                          thickness: 1.5,
                          color: PdfColor.fromHex('#000000'),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'BON PERMINTAAN BARANG JADI',
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
            ],
          ),
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
                            'No. SO',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ': ${salesOrder.id}',
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
                            'Tanggal',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ': ${DateFormat('dd MMM yyyy').format(salesOrder.createdAt)}',
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
                            'Kiriman Susulan',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ': ',
                          style: TextStyle(
                            font: font,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 80,
                          child: Text(
                            'No. PO',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ': ${salesOrder.productRequest?.purchaseOrderDistributor}',
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
                            'No.Faktur',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ': ${salesOrder.invoiceId}',
                          style: TextStyle(
                            font: font,
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
        ),
        Table(
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
                  width: 80,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
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
          ],
        ),
      ]);
    },
    footer: (context) {
      return Column(
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
                    'PPIC Departement',
                    style: TextStyle(
                      font: font,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 40),
              salesOrder.id.substring(0, 3) == 'SOS' ||
                      salesOrder.id.substring(0, 3) == 'SOV'
                  ? Column(
                      children: [
                        Text(
                          'Mengetahui, :',
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
                          salesOrder.id.substring(0, 3) == 'SOS'
                              ? 'Penanggung Jawab Produksi'
                              : 'Quality Assurance',
                          style: TextStyle(
                            font: font,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    )
                  : SizedBox(width: 0),
              SizedBox(width: 40),
              Column(
                children: [
                  Text(
                    'Diajukan Oleh,',
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
                    salesOrder.id.substring(0, 3) == 'SOP' ||
                            salesOrder.id.substring(0, 3) == 'SOX' ||
                            salesOrder.id.substring(0, 3) == 'SOI'
                        ? 'SCMA Departement'
                        : salesOrder.id.substring(0, 3) == 'SOQ'
                            ? 'FAT'
                            : salesOrder.id.substring(0, 3) == 'SOS' ||
                                    salesOrder.id.substring(0, 3) == 'SOV' ||
                                    salesOrder.id.substring(0, 3) == 'SO0'
                                ? 'MARKETING'
                                : '',
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PdfColor.fromHex('#000000'),
                          ),
                        ),
                        child: Text(
                          salesOrder.id.substring(0, 3) == 'SOP' ||
                                  salesOrder.id.substring(0, 3) == 'SOX' ||
                                  salesOrder.id.substring(0, 3) == 'SOI' ||
                                  salesOrder.id.substring(0, 3) == 'SO0'
                              ? 'Form.No.F-C.1.2-001'
                              : salesOrder.id.substring(0, 3) == 'SOQ' || 
                                salesOrder.id.substring(0, 3) =='SOS' ||
                                salesOrder.id.substring(0, 3) =='SOV'
                                  ? 'DIC-LGS-FR-0033B'
                              : salesOrder.id.substring(0, 3) == 'SOS'
                                  ? 'DIC-LGS-FR-0033B'         
                                  : ' ',
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
                            horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PdfColor.fromHex('#000000'),
                          ),
                        ),
                        child: Text(
                          salesOrder.id.substring(0, 3) == 'SOQ'
                              ? 'Rev. No : 01'
                              : salesOrder.id.substring(0, 3) == 'SOV' || salesOrder.id.substring(0, 3) == 'SOS'
                              ? 'Rev:01 (27-40-2021)'
                              : 'Rev. No : 00',
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
                            horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PdfColor.fromHex('#000000'),
                          ),
                        ),
                        child: Text(
                          salesOrder.id.substring(0, 3) == 'SOQ'
                              ? 'Issued Date : 27 April 2021'
                              : 'Issued Date : 11 Mei 2021',
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
      final tables = <Table>[];
      List.generate(
        groupByProductReportSalesOrder.length,
        (index) {
          // return children.add(

          return tables.add(Table(
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
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: PdfColor.fromHex('#000000'),
                    ),
                  ),
                  children: [
                    Container(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 7),
                        child: Center(
                          child: Text(
                            '${groupByProductReportSalesOrder.elementAt(index).value.fold<int>(0, (previousValue, element) => previousValue + element.quantity)} ${groupByProductReportSalesOrder.elementAt(index).value.first.unit.id}',
                            style: TextStyle(
                              fontSize: 8,
                              font: font,
                            ),
                          ),
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
                              '${groupByProductReportSalesOrder.length > index ? groupByProductReportSalesOrder.elementAt(index).value.first.product?.name : ''}',
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
                        child: Center(
                          child: Text(
                            '',
                            style: TextStyle(
                              fontSize: 8,
                              font: font,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]));
        },
      );
      // tables.add(
      //   Table(
      //     border: TableBorder.all(),
      //     children: children,
      //   ),
      // );
      return [
        ...tables,
        SizedBox(height: 5),
        SizedBox(
          height: 90,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black),
                          ),
                          child: Center(
                            child: Text(
                              'X',
                              style: TextStyle(fontSize: 8),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        SizedBox(
                          width: 80,
                          child: Text(
                            'Pesanan PBF',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ': ${salesOrder.productRequest?.deliveryAddress.name} / ${salesOrder.productRequest?.deliveryAddress.cityName}',
                          style: TextStyle(
                            font: font,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    salesOrder.id.substring(0, 3) == 'SOS' ||
                            salesOrder.id.substring(0, 3) == 'SOV' ||
                            salesOrder.id.substring(0, 3) == 'SO0'
                        ? Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  border: Border.all(color: PdfColors.black),
                                ),
                                child: Center(
                                  child: Text(
                                    '',
                                    style: TextStyle(fontSize: 8),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              SizedBox(
                                width: 80,
                                child: Text(
                                  'Pesanan PHB',
                                  style: TextStyle(
                                    font: font,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                              Text(
                                ': ',
                                style: TextStyle(
                                  font: font,
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          )
                        : SizedBox(height: 0),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black),
                          ),
                          child: Center(
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 8),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        SizedBox(
                          width: 80,
                          child: Text(
                            'Pesanan Khusus',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ': ',
                          style: TextStyle(
                            font: font,
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
        ),
        SizedBox(height: 30),
      ];
    },
  );
}
