import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment_detail_receivable.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:terbilang_id/terbilang_id.dart';

Future<Page> pdfReportPayment({
  required Payment payment,
  required TransactionPayment transactionPayment,
  required List<PaymentDetailReceivable> paymentDetail,
}) async {
  final font = await PdfGoogleFonts.nunitoRegular();
  final fontBold = await PdfGoogleFonts.nunitoBold();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '-';
  List<Widget> children = [];
  double total = 0;

  for (var i = 0; i < paymentDetail.length; i++) {
    var data = paymentDetail[i];
    total += data.amount;
    children.add(Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Table(border: TableBorder.all(), children: [
          TableRow(
            decoration: BoxDecoration(
              border: Border.all(
                color: PdfColor.fromHex('#000000'),
              ),
            ),
            children: [
              Container(
                width: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 7,
                  ),
                  child: Text(
                    '${i + 1}',
                    style: TextStyle(
                      fontSize: 8,
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
                    '${data.description} ${data.deliveryAddressCity}',
                    style: TextStyle(
                      fontSize: 8,
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
                    '${data.amount.format()}',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 8,
                      font: font,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ])));
  }

  children.add(
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
                width: 170,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 7,
                  ),
                  child: Text(
                    '',
                    style: TextStyle(
                      fontSize: 8,
                      font: font,
                    ),
                  ),
                ),
              ),
              Container(
                width: 50,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                  child: Text(
                    'SUB TOTAL',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 8,
                      font: font,
                      fontWeight: FontWeight.bold,
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
                    '${total.format()}',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 8,
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
  );

  children.add(
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
                width: 170,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 50,
                            child: Text(
                              'TERBILANG',
                              textAlign: TextAlign.start,
                              style: const TextStyle(
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
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              '${Terbilang().terbilang(total).toUpperCase()}',
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              style: const TextStyle(
                                fontSize: 8,
                              ),
                            ),
                          ),
                        ]),
                    SizedBox(height: 50),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 60,
                            child: Text(
                              'KETERANGAN',
                              textAlign: TextAlign.start,
                              style: const TextStyle(
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
                            width: 10,
                          ),
                          Text(
                            '${payment.remark}',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 8,
                            ),
                          ),
                        ]),
                  ]),
                ),
              ),
              Container(
                width: 150,
                child: Column(children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'BIAYA KU',
                            style: TextStyle(
                              fontSize: 8,
                              font: font,
                            ),
                          ),
                          Text(
                            payment.kuCost.format(),
                            style: TextStyle(
                              fontSize: 8,
                              font: font,
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'MATERAI',
                            style: TextStyle(
                              fontSize: 8,
                              font: font,
                            ),
                          ),
                          Text(
                            payment.stampCost.format(),
                            style: TextStyle(
                              fontSize: 8,
                              font: font,
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'PEMBULATAN',
                            style: TextStyle(
                              fontSize: 8,
                              font: font,
                            ),
                          ),
                          Text(
                            payment.rounding.format(),
                            style: TextStyle(
                              fontSize: 8,
                              font: font,
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'PPH',
                            style: TextStyle(
                              fontSize: 8,
                              font: font,
                            ),
                          ),
                          Text(
                            payment.artCost.format(),
                            style: TextStyle(
                              fontSize: 8,
                              font: font,
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'LAIN LAIN',
                            style: TextStyle(
                              fontSize: 8,
                              font: font,
                            ),
                          ),
                          Text(
                            payment.otherCost.format(),
                            style: TextStyle(
                              fontSize: 8,
                              font: font,
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    width: 300,
                    child: Divider(
                      height: 1.2,
                      thickness: 1.2,
                      color: PdfColor.fromHex('#000000'),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TOTAL',
                            style: TextStyle(
                              fontSize: 8,
                              font: font,
                            ),
                          ),
                          Text(
                            '${total.format()}',
                            style: TextStyle(
                              fontSize: 8,
                              font: font,
                            ),
                          ),
                        ]),
                  ),
                ]),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  children.add(
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
              Padding(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, bottom: 15, top: 15),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Prepared by',
                          style: TextStyle(
                            font: font,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(height: 38),
                        Text(
                          'Antoni',
                          style: TextStyle(
                            font: font,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(
                          width: 110,
                          child: Divider(
                            height: 1.2,
                            thickness: 1.2,
                            color: PdfColor.fromHex('#000000'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 40),
                    Column(
                      children: [
                        Text(
                          'Checked by',
                          style: TextStyle(
                            font: font,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(height: 50),
                        SizedBox(
                          width: 110,
                          child: Divider(
                            height: 1.2,
                            thickness: 1.2,
                            color: PdfColor.fromHex('#000000'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text(
                          'Approved by',
                          style: TextStyle(
                            font: font,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(height: 50),
                        SizedBox(
                          width: 110,
                          child: Divider(
                            height: 1.2,
                            thickness: 1.2,
                            color: PdfColor.fromHex('#000000'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text(
                          'Received by',
                          style: TextStyle(
                            font: font,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(height: 50),
                        SizedBox(
                          width: 110,
                          child: Divider(
                            height: 1.2,
                            thickness: 1.2,
                            color: PdfColor.fromHex('#000000'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

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
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 4),
                    SizedBox(height: 5),
                  ],
                ),
                SizedBox(
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          'LAPORAN PELUNASAN',
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(children: [
                        Container(
                          width: 50,
                          child: Text(
                            'NO.',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Text(
                          ':',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            '${payment.paidReceivableNo ?? '-'}',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(height: 10),
                      Row(children: [
                        Container(
                          width: 50,
                          child: Text(
                            'Date',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Text(
                          ':',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            '${payment.date.yMMMMd}',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(height: 10),
                      Row(children: [
                        Container(
                          width: 50,
                          child: Text(
                            'NO. Ref',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Text(
                          ':',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            '${transactionPayment.paymentId ?? '-'}',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
            child: Table(
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: PdfColor.fromHex('#000000'),
                    ),
                  ),
                  children: [
                    Container(
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 7),
                        child: Text(
                          'Diterima Dari : ${payment.partnerName ?? '-'}',
                          style: TextStyle(
                            fontSize: 8,
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
                      width: 20,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 7,
                        ),
                        child: Text(
                          'NO.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 8,
                            font: font,
                            fontWeight: FontWeight.bold,
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
                          'URAIAN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 8,
                            font: font,
                            fontWeight: FontWeight.bold,
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
                          'JUMLAH (Rp.)',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 8,
                            font: font,
                            fontWeight: FontWeight.bold,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Print By : $printedBy',
                  style: TextStyle(
                    font: font,
                    fontSize: 8,
                  ),
                ),
                Text(
                  'F-C.5.1-003 Rev.00 (16 Aug 2011)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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
      return children;
    },
  );
}
