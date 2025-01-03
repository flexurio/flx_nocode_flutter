import 'package:flexurio_chiron_finance/src/app/model/petty_cash.dart';
import 'package:flexurio_chiron_finance/src/app/model/petty_cash_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:terbilang_id/terbilang_id.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';

Future<Page> printReportFormPettyCash({
  required PettyCash pettyCash,
  required List<PettyCashDetail> pettyCashDetail,
}) async {
  final totalAmount = pettyCashDetail.fold<double>(
    0,
    (subtotal, data) => subtotal + data.subtotal,
  );
  
  final total = totalAmount - (pettyCash.discountAmount) + (pettyCash.ppnAmount) - (pettyCash.pphAmount) + (pettyCash.shippingCost) + (pettyCash.rounding);

  final fontSize13  = 10.0;
  final fontSize10  = 8.0;
  final fontSize9  = 7.0;
  final fontSize8  = 6.0;
  final printBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return MultiPage(
    pageFormat: PdfPageFormat.a4.portrait,
    margin: const EdgeInsets.all(15),
    build: (Context context) {
      return [
        Container(
          child: Column(
            children: [
              _buildTitle(pettyCash),
              SizedBox(height: 9),
              Center(
                child: Text(
                  'BUKTI PENGELUARAN KAS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.7,
                    fontSize: fontSize13,
                  ),
                ),
              ),
              SizedBox(height: 9),
              //First Box
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                ],
              ),

              //Second Row
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(),
                        bottom: BorderSide(),
                        left: BorderSide(),
                      ),
                    ),
                    width: 80,
                    height: 32,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'No.',
                            style: TextStyle(fontSize: fontSize10),
                          ),
                          Text(
                            'Perkiraan',
                            style: TextStyle(fontSize: fontSize10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
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
                        Text('Dept', style: TextStyle(fontSize: fontSize10)),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
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
                          Text('Uraian', style: TextStyle(fontSize: fontSize10)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(),
                        bottom: BorderSide(),
                        left: BorderSide(),
                      ),
                    ),
                    width: 80,
                    height: 32,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Text(
                            'Quantity',
                            style: TextStyle(fontSize: fontSize10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
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
                        Text('Jumlah', style: TextStyle(fontSize: fontSize10)),
                      ],
                    ),
                  ),
                ],
              ),

              //Third Row
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(),
                    right: BorderSide(),
                    left: BorderSide(),
                    top: BorderSide(),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(),
                          left: BorderSide(),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 2, top: 2, left: 2, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PEMBAYARAN ATAS :',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: fontSize9,
                                color: PdfColor.fromHex("#FFFFFF"),
                              ),
                            ),
                            for (var i = 0; i < pettyCashDetail.length; i++)
                              Container(
                                margin: i == 0 ? EdgeInsets.only(top: 10) : EdgeInsets.zero,
                                child: Text(
                                  pettyCashDetail[i].pettyCash.department.id != ''
                                    ? pettyCashDetail[i].pettyCash.department.id
                                    : '-',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: fontSize9,
                                    color: PdfColor.fromHex("#FFFFFF"),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(),
                          left: BorderSide(),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 2, top: 2, left: 2, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PEMBAYARAN ATAS :',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: fontSize9,
                                color: PdfColor.fromHex("#FFFFFF"),
                              ),
                            ),
                            for (var i = 0; i < pettyCashDetail.length; i++)
                              Container(
                                margin: i == 0 ? EdgeInsets.only(top: 10) : EdgeInsets.zero,
                                child: Text(
                                  pettyCashDetail[i].pettyCash.department.id != ''
                                    ? pettyCashDetail[i].pettyCash.department.id
                                    : '-',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: fontSize9,
                                    color: i == 0 ? PdfColors.black : PdfColor.fromHex("#FFFFFF"),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 175,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(),
                          left: BorderSide(),
                        ),
                      ),
                      child: Padding(
                        // padding: const EdgeInsets.all(2),
                        padding: EdgeInsets.only(top: 2, left: 5, bottom: 5, right: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PEMBAYARAN ATAS :',
                              style: TextStyle(
                                fontSize: fontSize9,
                              ),
                            ),
                            for (var i = 0; i < pettyCashDetail.length; i++)
                              Container(
                                margin: i == 0 ? EdgeInsets.only(top: 10) : EdgeInsets.zero,
                                child: Text(
                                  pettyCashDetail[i].material.name == ''
                                    ? pettyCashDetail[i].pettyCash.description ?? '-'
                                    : pettyCashDetail[i].material.name,
                                  style: TextStyle(
                                    fontSize: fontSize9,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(),
                          left: BorderSide(),
                        ),
                      ),
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 2, top: 2, left: 2, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PEMBAYARAN ATAS :',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: fontSize9,
                                color: PdfColor.fromHex("#FFFFFF"),
                              ),
                            ),
                            for (var i = 0; i < pettyCashDetail.length; i++)
                              Container(
                                margin: i == 0 ? EdgeInsets.only(top: 10) : EdgeInsets.zero,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  pettyCashDetail[i].quantity.format(),
                                  style: TextStyle(
                                    fontSize: fontSize9,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(),
                          left: BorderSide(),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 2, top: 2, left: 2, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'PEMBAYARAN ATAS :',
                              style: TextStyle(
                                fontSize: fontSize9,
                                color: PdfColor.fromHex("#FFFFFF"),
                              ),
                            ),
                            for (var i = 0; i < pettyCashDetail.length; i++)
                              Container(
                                margin: i == 0 ? EdgeInsets.only(top: 10, right: 15) : EdgeInsets.only(right: 15),
                                child: Text(
                                  totalAmount.format(),
                                  style: TextStyle(
                                    fontSize: fontSize9,
                                    color: i == 0 ? PdfColors.black : PdfColor.fromHex("#FFFFFF"),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              buildRows(
                'Discount',
                pettyCash.discountAmount.format(),
              ),
              buildRows('PPN', pettyCash.ppnAmount.format()),
              buildRows('PPH', pettyCash.pphAmount.format()),
              buildRows('Shipping Cost', pettyCash.shippingCost.format()),
              //Total Row
              Row(
                children: [
                  Container(
                    width: 335,
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
                            'Bank : ............................ No. Cek/Giro : ............................ Tgl ...............',
                            style: TextStyle(fontSize: fontSize10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
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
                        'Jumlah',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize10),
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
                              total.format(),
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize10),
                            ),
                          ],
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
                  _rightFooter(total),
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

Widget _buildTitle(PettyCash pettyCash) {
  final fontSize13  = 10.0;
  final fontSize11  = 9.0;

  return Container(
    child: Row(
      children: [
        Container(
          child: Text(
            'PT. METISKA FARMA',
            style: TextStyle(
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold,
              fontSize: fontSize13,
            ),
          ),
        ),
        SizedBox(width: 150),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NO    : ${pettyCash.id}  |  ${pettyCash.realizationNo ?? '-'}',
                style: TextStyle(
                  fontSize: fontSize11,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Tgl    : ${DateFormat('dd/MM/yyyy').format(pettyCash.createdAt)}',
                style: TextStyle(
                  fontSize: fontSize11,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildRows(String title, String value) {
    
  final fontSize10  = 9.0;

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

  final fontSize9  = 8.0;
  final fontSize7  = 5.0;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        child: Column(
          children: [
            Container(
              width: 180,
              height: 50,
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
                    'Dibuat Oleh :',
                    style: TextStyle(fontSize: fontSize9),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 180,
        height: 18,
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(),
            bottom: BorderSide(),
            left: BorderSide(),
          ),
        ),
        child: Center(
          child: Text(
            'Dibukukan Oleh :',
            style: TextStyle(fontSize: fontSize9),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 90,
            height: 47,
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
                  'B.Harian',
                  style: TextStyle(fontSize: fontSize7),
                ),
                SizedBox(height: 3),
              ],
            ),
          ),
          Container(
            width: 90,
            height: 47,
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
                  'B.Tambahan',
                  style: TextStyle(fontSize: fontSize7),
                ),
                SizedBox(height: 3),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _midFooter() {

  final fontSize9  = 8.0;

  return Column(
    children: [
      Container(
        width: 140,
        height: 50,
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(),
            bottom: BorderSide(),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 3),
            Text(
              'Diperiksa Oleh :',
              style: TextStyle(fontSize: fontSize9),
            ),
            Spacer(),
            Text(
              'Kabag. Keuangan',
              style: TextStyle(fontSize: fontSize9),
            ),
            SizedBox(height: 3),
          ],
        ),
      ),
      Container(
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(),
            bottom: BorderSide(),
          ),
        ),
        width: 140,
        height: 65,
        child: Column(
          children: [
            SizedBox(height: 3),
            Text(
              'Disetujui Oleh :',
              style: TextStyle(fontSize: fontSize9),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _rightFooter(double total) {

  final fontSize9  = 8.0;

  return Container(
    decoration: const BoxDecoration(
      border: Border(
        right: BorderSide(),
      ),
    ),
    width: 245,
    height: 115,
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Telah diterima dari PT. METISKA FARMA Uang',
            style: TextStyle(fontSize: fontSize9),
          ),
          Container(
            child: Text(
              'Sejumlah : ${Terbilang().terbilang(total).toUpperCase()} RUPIAH. (Rp.${total.format()}) Untuk pembayaran di atas',
              style: TextStyle(fontSize: fontSize9),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Penerima',
                style: TextStyle(fontSize: fontSize9),
              ),
              SizedBox(width: 20),
            ],
          ),
        ],
      ),
    ),
  );
}
