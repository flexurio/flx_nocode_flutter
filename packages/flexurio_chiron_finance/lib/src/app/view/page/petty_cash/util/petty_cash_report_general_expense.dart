import 'package:flexurio_chiron_finance/src/app/model/petty_cash.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';

Future<Page> printReportGeneralExpensePettyCash({
  required PettyCash pettyCash,
  required List<PaymentDetail> paymentDetail,
  required Payment payment,
}) async {
  final totalAmount = paymentDetail.fold<double>(
    0,
    (amount, data) => amount + data.amount,
  );

  final fontSize16 = 12.0;
  // final fontSize13 = 10.0;
  final fontSize10 = 8.0;
  // final fontSize9 = 7.0;
  final fontSize8 = 6.0;
  final printBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return MultiPage(
    pageFormat: PdfPageFormat.a4.portrait,
    margin: const EdgeInsets.all(15),
    build: (Context context) {
      return [
        Container(
          child: Column(
            children: [
              _buildTitle(payment,paymentDetail),
              SizedBox(height: 9),
              Center(
                child: Text(
                  'VOUCHER PENGELUARAN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.7,
                    fontSize: fontSize16,
                  ),
                ),
              ),
              SizedBox(height: 9),
              //First Box
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(children: [
                    Container(
                      width: 565,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          'DIBAYAR KEPADA :  ${pettyCash.recipient}',
                          style: TextStyle(fontSize: fontSize10),
                        ),
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(),
                          bottom: BorderSide(),
                          left: BorderSide(),
                          top: BorderSide(),
                        ),
                      ),
                    ),
                    Container(
                      width: 565,
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          'KETERANGAN :  ${pettyCash.description}',
                          style: TextStyle(fontSize: fontSize10),
                        ),
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(),
                          bottom: BorderSide(),
                          left: BorderSide(),
                          top: BorderSide(),
                        ),
                      ),
                    ),
                  ])
                ],
              ),
              SizedBox(height: 5),

              //Second Row
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(),
                        right: BorderSide(),
                        bottom: BorderSide(),
                        left: BorderSide(),
                      ),
                    ),
                    width: 40,
                    height: 32,
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        Text('NO', style: TextStyle(fontSize: fontSize10)),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(),
                        right: BorderSide(),
                        bottom: BorderSide(),
                        left: BorderSide(),
                      ),
                    ),
                    width: 80,
                    height: 32,
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        Text('COA', style: TextStyle(fontSize: fontSize10)),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(),
                        right: BorderSide(),
                        bottom: BorderSide(),
                        left: BorderSide(),
                      ),
                    ),
                    width: 60,
                    height: 32,
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        Text('DEPT', style: TextStyle(fontSize: fontSize10)),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(),
                        right: BorderSide(),
                        bottom: BorderSide(),
                        left: BorderSide(),
                      ),
                    ),
                    width: 175,
                    height: 32,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Text('URAIAN',
                              style: TextStyle(fontSize: fontSize10)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(),
                        right: BorderSide(),
                        bottom: BorderSide(),
                        left: BorderSide(),
                      ),
                    ),
                    width: 60,
                    height: 32,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Text(
                            'D/K',
                            style: TextStyle(fontSize: fontSize10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(),
                        right: BorderSide(),
                        bottom: BorderSide(),
                        left: BorderSide(),
                      ),
                    ),
                    width: 150,
                    height: 32,
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        Text('JUMLAH(IDR)',
                            style: TextStyle(fontSize: fontSize10)),
                      ],
                    ),
                  ),
                ],
              ),

              //Third Row
              for (var i = 0; i < paymentDetail.length; i++)
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(),
                          right: BorderSide(),
                          bottom: BorderSide(),
                          left: BorderSide(),
                        ),
                      ),
                      width: 40,
                      height: 32,
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Text((i + 1).toString(),
                              style: TextStyle(fontSize: fontSize10)),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(),
                          right: BorderSide(),
                          bottom: BorderSide(),
                          left: BorderSide(),
                        ),
                      ),
                      width: 80,
                      height: 32,
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Text(paymentDetail[i].chartOfAccount.id,
                              style: TextStyle(fontSize: fontSize10)),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(),
                          right: BorderSide(),
                          bottom: BorderSide(),
                          left: BorderSide(),
                        ),
                      ),
                      width: 60,
                      height: 32,
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Text(payment.department!.id,
                              style: TextStyle(fontSize: fontSize10)),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(),
                          right: BorderSide(),
                          bottom: BorderSide(),
                          left: BorderSide(),
                        ),
                      ),
                      width: 175,
                      height: 32,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            Text(paymentDetail[i].description,
                                style: TextStyle(fontSize: fontSize10)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(),
                          right: BorderSide(),
                          bottom: BorderSide(),
                          left: BorderSide(),
                        ),
                      ),
                      width: 60,
                      height: 32,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            Text(
                              paymentDetail[i].amount < 0 ? 'D' : 'K',
                              style: TextStyle(fontSize: fontSize10),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(),
                          right: BorderSide(),
                          bottom: BorderSide(),
                          left: BorderSide(),
                        ),
                      ),
                      width: 150,
                      height: 32,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 5),
                              Text(
                                paymentDetail[i].amount.format(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: fontSize10),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              //Total Row
              Row(
                children: [
                  Container(
                    width: 295,
                    height: 20,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(),
                        bottom: BorderSide(),
                        left: BorderSide(),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Row(
                        children: [
                          Text(
                            'PAYMENT NOTE : .....................................................',
                            style: TextStyle(fontSize: fontSize10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 20,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(),
                        bottom: BorderSide(),
                        left: BorderSide(),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'TOTAL',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: fontSize10),
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 20,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(),
                        bottom: BorderSide(),
                        left: BorderSide(),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'K',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: fontSize10),
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 20,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(),
                        bottom: BorderSide(),
                        left: BorderSide(),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              totalAmount.format(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSize10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 565,
                    height: 20,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(),
                        bottom: BorderSide(),
                        left: BorderSide(),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 200),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${DateFormat('MMMM dd, yyyy').format(DateTime.now())}',
                          style: TextStyle(fontSize: fontSize10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _leftFooter(),
                  _midFooter(),
                  _rightFooter(),
                ],
              ),
              Container(
                width: 565,
                height: 14,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(),
                    bottom: BorderSide(),
                    left: BorderSide(),
                    top: BorderSide(),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 35),
                      child: Text(
                        'Page 1 of 1',
                        style: TextStyle(fontSize: fontSize8),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        'Print By $printBy at ${DateTime.now().yMMMMd}',
                        style: TextStyle(fontSize: fontSize8),
                      ),
                    ),
                    SizedBox(width: 150),
                    Container(
                      child: Text(''),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ];
    },
  );
}

Widget _buildTitle(Payment payment,List<PaymentDetail> paymentDetail) {
  final fontSize15 = 11.0;
  final fontSize11 = 9.0;

  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PT. METISKA FARMA',
          style: TextStyle(
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
            fontSize: fontSize15,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NO    : ${payment.id}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize11,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'No. Inv    : ${paymentDetail[0].invoiceNo}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize11,
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date    : ${payment.createdAt}',
                  style: TextStyle(
                    fontSize: fontSize11,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'No.Reject    : ',
                  style: TextStyle(
                    fontSize: fontSize11,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget buildRows(String title, String value) {
  final fontSize10 = 9.0;

  return Row(
    children: [
      Container(
        width: 80,
        height: 16,
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(),
            bottom: BorderSide(),
            left: BorderSide(),
          ),
        ),
        child: Center(
          child: Text(''),
        ),
      ),
      Container(
        width: 80,
        height: 16,
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(),
            bottom: BorderSide(),
            left: BorderSide(),
          ),
        ),
        child: Center(
          child: Text(
            '',
            style: TextStyle(fontSize: fontSize10),
          ),
        ),
      ),
      Container(
        width: 255,
        height: 16,
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(),
            bottom: BorderSide(),
            left: BorderSide(),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Row(
            children: [
              SizedBox(width: 40),
              Text(
                title,
                style: TextStyle(fontSize: fontSize10),
              ),
            ],
          ),
        ),
      ),
      Container(
        width: 150,
        height: 16,
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(),
            bottom: BorderSide(),
            left: BorderSide(),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: TextStyle(fontSize: fontSize10),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _leftFooter() {
  final fontSize9 = 8.0;
  // final fontSize7 = 5.0;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        child: Column(
          children: [
            Container(
              width: 141,
              height: 18,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(),
                  bottom: BorderSide(),
                  left: BorderSide(),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Text(
                    'PREPARED',
                    style: TextStyle(fontSize: fontSize9),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 141,
            height: 52,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(),
                bottom: BorderSide(),
                left: BorderSide(),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(''),
                SizedBox(height: 3),
              ],
            ),
          ),
        ],
      ),
      Container(
        child: Column(
          children: [
            Container(
              width: 141,
              height: 18,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(),
                  bottom: BorderSide(),
                  left: BorderSide(),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _midFooter() {
  final fontSize9 = 8.0;
  final fontSize7 = 5.0;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        child: Column(
          children: [
            Container(
              width: 282,
              height: 18,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(),
                  bottom: BorderSide(),
                  left: BorderSide(),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Text(
                    'CHECKED',
                    style: TextStyle(fontSize: fontSize9),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 141,
            height: 52,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(),
                bottom: BorderSide(),
                left: BorderSide(),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '(Accounting)',
                  style: TextStyle(fontSize: fontSize7),
                ),
                SizedBox(height: 3),
              ],
            ),
          ),
          Container(
            width: 141,
            height: 52,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(),
                bottom: BorderSide(),
                left: BorderSide(),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '(Finance)',
                  style: TextStyle(fontSize: fontSize7),
                ),
                SizedBox(height: 3),
              ],
            ),
          ),
        ],
      ),
      Row(children: [
        Container(
          child: Column(
            children: [
              Container(
                width: 141,
                height: 18,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(),
                    bottom: BorderSide(),
                    left: BorderSide(),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                width: 141,
                height: 18,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(),
                    bottom: BorderSide(),
                    left: BorderSide(),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    ],
  );
}

Widget _rightFooter() {
  final fontSize9 = 8.0;
  // final fontSize7 = 5.0;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        child: Column(
          children: [
            Container(
              width: 141,
              height: 18,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(),
                  bottom: BorderSide(),
                  left: BorderSide(),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Text(
                    'APPROVED',
                    style: TextStyle(fontSize: fontSize9),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 141,
            height: 52,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(),
                bottom: BorderSide(),
                left: BorderSide(),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '',
                ),
                SizedBox(height: 3),
              ],
            ),
          ),
        ],
      ),
      Container(
        child: Column(
          children: [
            Container(
              width: 141,
              height: 18,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(),
                  bottom: BorderSide(),
                  left: BorderSide(),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
