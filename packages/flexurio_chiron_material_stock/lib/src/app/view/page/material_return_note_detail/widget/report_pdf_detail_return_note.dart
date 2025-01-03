import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Page> printMaterialReturnNote({
  required MaterialReturnNote materialReturnNote,
  required List<MaterialReturnNoteDetail> materialReturnNoteDetail,
}) async {
  const pageFormat =
      PdfPageFormat(210 * PdfPageFormat.mm, 330 * PdfPageFormat.mm);
  int index = 0;
  List<Widget> serialNumber = [];
  late List<Widget> products = [];
  List<Widget> kuantums = [];
  List<Widget> unitPrice = [];
  List<Widget> bkpPrice = [];

  for (var detail in materialReturnNoteDetail) {
    serialNumber.add(
      Text(
        '${index += 1}.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 8),
      ),
    );
    products.add(
      Text(
        '${detail.description}',
        style: TextStyle(fontSize: 8),
      ),
    );
    kuantums.add(
      Text(
        '${detail.quantity.format()} ${detail.unit}',
        textAlign: TextAlign.right,
        style: const TextStyle(fontSize: 8),
      ),
    );
    unitPrice.add(
      Text(
        '${detail.price.format()}',
        textAlign: TextAlign.right,
        style: const TextStyle(fontSize: 8),
      ),
    );
    bkpPrice.add(
      Text(
        '${detail.subtotal.format()}',
        textAlign: TextAlign.right,
        style: const TextStyle(fontSize: 8),
      ),
    );
  }

  return MultiPage(
    pageFormat: pageFormat,
    build: (Context context) {
      return [
        Center(
          child: Container(
            width: 800,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: ListView(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),

                    //Header 1
                    child: Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              'NOTA RETUR',
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Container(
                                  width: 120,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Tanggal'),
                                      Text('Atas Faktur Pajak No'),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        ': ${DateFormat('dd MMM yyyy').format(materialReturnNote.taxInvoiceDate)}'),
                                    Text(
                                        ': ${materialReturnNote.taxInvoiceNo}'),
                                  ],
                                ),
                              ),
                              SizedBox(width: 50),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  width: 50,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Nomor :'),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${materialReturnNote.id}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ]),
                      ),
                    ]),
                  ),

                  //Header 2
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(),
                        left: BorderSide(),
                        bottom: BorderSide(),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'PEMBELI',
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Container(
                                width: 110,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama'),
                                    Text('Alamat'),
                                    Text('NPWP'),
                                    Text('NPPKP'),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ': ${materialReturnNote.supplier.name}',
                                  ),
                                  Text(
                                    ': ${materialReturnNote.supplier.address}',
                                  ),
                                  Text(
                                    ': ${materialReturnNote.supplier.npwp == '' ? '-' : materialReturnNote.supplier.npwp}',
                                  ),
                                  Text(
                                    ': ${materialReturnNote.supplier.npwp == '' ? '-' : materialReturnNote.supplier.npwp}',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                      ],
                    ),
                  ),

                  // Table
                  Row(
                    children: [
                      Container(
                        width: 47,
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(),
                            right: BorderSide(),
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(9),
                            child: Text(
                              'No Urut',
                              style: const TextStyle(fontSize: 8),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 157.5,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(),
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(9),
                            child: Text(
                              'Macam Dan Jenis Barang Kena Pajak',
                              style: const TextStyle(fontSize: 8),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 95.5,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(),
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(9),
                            child: Text(
                              'Kuantum',
                              style: const TextStyle(fontSize: 8),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 111.5,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(),
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(9),
                            child: Text(
                              'Harga Satuan',
                              style: const TextStyle(fontSize: 8),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 147.5,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(),
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(9),
                            child: Text(
                              'Harga BKP Yang Dikembalikan',
                              style: const TextStyle(fontSize: 8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 370,
                        width: 47,
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(),
                            right: BorderSide(),
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Column(children: serialNumber),
                      ),
                      Container(
                        height: 370,
                        width: 157.5,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(),
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Column(children: products),
                        ),
                      ),
                      Container(
                        height: 370,
                        width: 95.5,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(),
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Column(children: kuantums),
                        ),
                      ),
                      Container(
                        height: 370,
                        width: 111.5,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(),
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Column(children: unitPrice),
                        ),
                      ),
                      Container(
                        height: 370,
                        width: 147.5,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(),
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Column(children: bkpPrice),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 411.5,
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(),
                            right: BorderSide(),
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 3),
                          child: Text(
                            'Dasar Pengenaan PPN Yang Dikembalikan',
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 147.5,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(),
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, top: 3),
                          child: Text(
                            '${materialReturnNote.purchaseOrder.subtotal.format()}',
                            textAlign: TextAlign.right,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 411.5,
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(),
                            right: BorderSide(),
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Potongan Harga',
                                style: const TextStyle(fontSize: 10),
                              ),
                              Text(
                                '${materialReturnNote.purchaseOrder.discountPercent.format()} %',
                                style: const TextStyle(fontSize: 10),
                              ),
                              SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 147.5,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(),
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, top: 3),
                          child: Text(
                            '${materialReturnNote.purchaseOrder.discountValue.format()}',
                            textAlign: TextAlign.right,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 411.5,
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(),
                            right: BorderSide(),
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 3),
                          child: Text(
                            'Pajak Pertambahan Nilai Yang Diminta Kembali',
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 147.5,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(),
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, top: 3),
                          child: Text(
                            '${materialReturnNote.purchaseOrder.ppnValue.format()}',
                            textAlign: TextAlign.right,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 411.5,
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(),
                            right: BorderSide(),
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 3),
                          child: Text(
                            'Jumlah Harga BKP Yang Dikembalikan',
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 147.5,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(),
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, top: 3),
                          child: Text(
                            '${materialReturnNote.purchaseOrder.total.format()}',
                            textAlign: TextAlign.right,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    width: 800,
                    height: 220,
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(),
                        right: BorderSide(),
                        bottom: BorderSide(),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 576),
                            _signature(),
                          ],
                        ),
                        SizedBox(height: 10),
                        _footer(),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ];
    },
  );
}

Widget _signature() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text('Jakarta, ${DateTime.now().yyyyMMdd}'),
            SizedBox(height: 80),
            Text(
              'RIZA SUKMA PERMANA',
              style: const TextStyle(fontSize: 10.5),
            ),
            _buildCustomDivider(),
            Text(
              'Accounting Manager',
              style: const TextStyle(fontSize: 10.5),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildCustomDivider() {
  return Container(
    height: 1,
    width: 125,
    color: PdfColor.fromHex('#000000'),
    margin: const EdgeInsets.symmetric(vertical: 5),
  );
}

Widget _footer() {
  return Expanded(
    child: DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide()),
      ),
      child: Column(children: [
        SizedBox(height: 10),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                width: 110,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Lembar ke-1'),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ': Untuk Pengusaha Kena Pajak Yang Menerbitkan Faktur Pajak',
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                width: 110,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Lembar ke-2'),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ': Untuk Pembeli',
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    ),
  );
}
