import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:terbilang_id/terbilang_id.dart';

Future<Page> printInvoiceSalesOrder({
  required SalesOrder salesOrder,
  required List<SalesOrderDetail> salesOrderDetail,
  required String taxInvoiceNumber,
}) async {
  const pageFormat =
      PdfPageFormat(210 * PdfPageFormat.mm, 330 * PdfPageFormat.mm);
  final subtotal = salesOrder.subtotal -
      salesOrder.discountValue -
      salesOrder.additionalDiscountValue;
  final termOfPayment = salesOrder.productRequest?.termOfPayment ?? 0;
  final invoiceDate = salesOrder.createdAt;
  final termOfPaymentDate = invoiceDate.add(Duration(days: termOfPayment));
  final isYearMoreThan2024 = invoiceDate.year > 2024;

  List<MapEntry<String, List<SalesOrderDetail>>> groupByProduct() {
    return groupBy<SalesOrderDetail>(
      salesOrderDetail,
      (salesOrderDetail) => salesOrderDetail.product?.name ?? '-',
    ).entries.toList();
  }

  Widget buildTableBody({
    required String no,
    required String name,
    required int quantity,
    required double price,
    required double unitPrice,
    required double discount,
    required double subtotal,
  }) {
    Widget buildCell({
      required String text,
      required double width,
      TextAlign textAlign = TextAlign.left,
      bool hasLeftBorder = false,
    }) {
      return Container(
        width: width,
        decoration: BoxDecoration(
          border: Border(
            left: hasLeftBorder ? BorderSide() : BorderSide.none,
            right: BorderSide(),
          ),
        ),
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              text,
              textAlign: textAlign,
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        buildCell(
          text: no,
          width: 20,
          textAlign: TextAlign.center,
          hasLeftBorder: true,
        ),
        buildCell(
          text: name,
          width: 160.2,
        ),
        buildCell(
          text: quantity.toString(),
          width: 50,
          textAlign: TextAlign.right,
        ),
        buildCell(
          text: unitPrice.format(),
          width: 74.9,
          textAlign: TextAlign.right,
        ),
        buildCell(
          text: discount.format(),
          width: 70,
          textAlign: TextAlign.right,
        ),
        buildCell(
          text: price.format(),
          width: 80,
          textAlign: TextAlign.right,
        ),
        buildCell(
          text: subtotal.format(),
          width: 103.6,
          textAlign: TextAlign.right,
        ),
      ],
    );
  }

  Widget signature() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Jakarta, ${invoiceDate.ddMMyyyySlash}',
              ),
              SizedBox(height: 50),
              Text(
                'RIZA SUKMA PERMANA',
              ),
              _buildCustomDivider(),
              Text(
                'Accounting Manager',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeaderCell(
    String text,
    double fontSize, {
    double? width,
  }) {
    return Container(
      width: width,
      height: 22,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(),
          bottom: BorderSide(),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 11,
      ),
    );
  }

  Widget buildLabelValueRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 110,
            child: Text(
              label,
            ),
          ),
          Text(': '),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget buildHeaderTaxableEmployer() {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle('PENGUSAHA KENA PAJAK'),
            SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildLabelValueRow('Nama', 'PT. METISKA FARMA'),
                      buildLabelValueRow('Alamat',
                          'Jl. Raya Kebayoran Lama 557 Grogol Selatan Kebayoran Lama'),
                      buildLabelValueRow('NPWP', '01.000.891.0-062.000'),
                      buildLabelValueRow('NPPKP', '01.000.891.0-062.000'),
                      buildLabelValueRow('Tgl. Pengukuhan', '07/04/2008')
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildLabelValueRow(
                          'No. Invoice', '${salesOrder.invoiceId}'),
                      buildLabelValueRow(
                          'Tgl. Invoice', '${invoiceDate.ddMMyyyySlash}'),
                      buildLabelValueRow('No. PO',
                          '${salesOrder.productRequest?.purchaseOrderDistributor ?? '-'}'),
                      buildLabelValueRow(
                          'No. SPB', '${salesOrder.deliveryOrderId}'),
                      buildLabelValueRow(
                          'Jatuh Tempo', '${termOfPaymentDate.ddMMyyyySlash}'),
                      buildLabelValueRow('No. Seri Faktur',
                          isYearMoreThan2024 ? '-' : taxInvoiceNumber),
                      buildLabelValueRow('Tanggal Faktur',
                          isYearMoreThan2024 ? '-' : invoiceDate.ddMMyyyySlash),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeaderCustomer() {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle('PEMBELI BPK / PENERIMA JKP'),
            SizedBox(height: 6),
            Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildLabelValueRow(
                      'Nama',
                      '${salesOrder.productRequest?.customer.name ?? '-'}',
                    ),
                    buildLabelValueRow(
                      'Alamat',
                      '${salesOrder.productRequest?.customer.address ?? '-'}',
                    ),
                    buildLabelValueRow(
                      'NPWP',
                      '${salesOrder.productRequest?.customer.npwp ?? '-'}',
                    ),
                    buildLabelValueRow(
                      'NPPKP',
                      '${salesOrder.productRequest?.customer.nppkp ?? '-'}',
                    ),
                  ],
                ),
              ),
            ]),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget buildTableHeader() {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(),
              bottom: BorderSide(),
            ),
          ),
          child: buildHeaderCell('No Urut', 9, width: 20),
        ),
        buildHeaderCell('NAMA BARANG / JASA KENA PAJAK', 9, width: 160),
        buildHeaderCell('KUANTUM', 9, width: 50),
        buildHeaderCell('HARGA SATUAN', 9, width: 75),
        buildHeaderCell('DISKON DISTRIBUSI', 9, width: 70),
        buildHeaderCell('HARGA', 9, width: 80),
        buildHeaderCell('HARGA JUAL / PENGGANTIAN', 9, width: 104.3),
      ],
    );
  }

  Widget buildTableBodyData() {
    final children = <Widget>[];
    final data = groupByProduct()..sort((a, b) => (a.key).compareTo(b.key));

    for (var i = 0; i < data.length; i++) {
      final salesOrderDetail = data[i].value.first;
      final quantitySum = data[i].value.fold<int>(
          0, (previousValue, element) => previousValue + element.quantity);
      final subtotalSum = data[i].value.fold<double>(0,
          (previousValue, element) => previousValue + (element.subtotal ?? 0));
      children.add(
        buildTableBody(
          no: (i + 1).toString(),
          name: salesOrderDetail.product?.name ?? '',
          quantity: quantitySum,
          unitPrice: salesOrderDetail.price ?? 0,
          discount: salesOrderDetail.discountValue,
          price: salesOrderDetail.priceAfterDiscount,
          subtotal: subtotalSum,
        ),
      );
    }

    return Column(children: children);
  }

  Widget buildTerms() {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(
              '* Syarat Pembayaran $termOfPayment Hari',
            ),
            SizedBox(height: 8),
            Text(
              '* Pembayaran dengan Cheque/Giro harap diisi atas nama PT. METISKA FARMA dan dianggap Lunas setelah dana tersebut diterima di rekening PT. METISKA FARMA',
              softWrap: true,
            ),
            SizedBox(height: 8),
            Text(
              '* Pembayaran melalui transfer BCA - Pasar Kebayoran Lama - Jakarta REK.319-3606128 (Account Rp.)',
              softWrap: true,
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget total() {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        width: 180,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(),
                      bottom: BorderSide(),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      'TARIF',
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(),
                      bottom: BorderSide(),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      'DPP',
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      'PPN BM',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 60,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(),
                      bottom: BorderSide(),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(
                      '%',
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(),
                      bottom: BorderSide(),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(
                      'Rp.',
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(
                      'Rp.',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 60,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(),
                      bottom: BorderSide(),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(
                      '%',
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(),
                      bottom: BorderSide(),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(
                      'Rp.',
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(
                      'Rp.',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 60,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(),
                      bottom: BorderSide(),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(
                      '%',
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(),
                      bottom: BorderSide(),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(
                      'Rp.',
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(
                      'Rp.',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ' TOTAL',
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Text(
                    'Rp.',
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }

  Widget footer() {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
        width: 180,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              children: [
                Text(
                  'Bentuk Faktur Pajak dengan persetujuan',
                  softWrap: true,
                ),
                Text(
                  'Direktur Jenderal Pajak KPP Madya',
                  softWrap: true,
                ),
                Text(
                  'NO. S-329/WPJ.04/KP.1107/2011',
                  softWrap: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAmountDetails() {
    const _borderStyle = BoxDecoration(
      border: Border(
        left: BorderSide(),
        right: BorderSide(),
        bottom: BorderSide(),
        top: BorderSide(),
      ),
    );

    Widget _buildLabelCell(String text) {
      return Container(
        width: 455.5,
        decoration: _borderStyle,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: Text(text),
        ),
      );
    }

    Widget _buildValueCell(String text) {
      return Container(
        width: 103.5,
        decoration: _borderStyle,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: Text(
            text,
            textAlign: TextAlign.right,
          ),
        ),
      );
    }

    Widget _buildRow(String label, String value) {
      return Row(
        children: [
          _buildLabelCell(label),
          _buildValueCell(value),
        ],
      );
    }

    return Column(
      children: [
        _buildRow(
            'JUMLAH HARGA JUAL',
            salesOrderDetail.isNotEmpty
                ? salesOrderDetail
                    .fold(0.0, (total, product) => total + product.subtotal!)
                    .format()
                : ''),
        _buildRow(
          'DIKURANGI POTONGAN PENJUALAN                                                           ${salesOrder.discountPercent.format()} %',
          salesOrder.discountValue.format(),
        ),
        _buildRow(
            'DISKON TAMBAHAN:                                                                                       ${salesOrder.additionalDiscountPercent.format(3)} %',
            salesOrder.additionalDiscountValue.format()),
        _buildRow(
            'DASAR PENGENAAN PAJAK (DPP) PPN:', salesOrder.taxBasePpn.format()),
        _buildRow('TOTAL HARGA JUAL / PENGGANTIAN / UANG MUKA / TERMIJN',
            subtotal.format()),
        _buildRow('PPN = 12% X DASAR PENGENAAN PAJAK (DPP) PPN',
            salesOrder.ppnValue.format()),
        _buildRow('PPh 22 = 0.3% x DASAR PENGENAAN PAJAK',
            salesOrder.pph22Value.format()),
        _buildRow('JUMLAH TAGIHAN = TOTAL HARGA JUAL + PPN + PPH22',
            salesOrder.total.format()),
      ],
    );
  }

  return MultiPage(
      pageFormat: pageFormat,
      build: (Context context) {
        return [
          DefaultTextStyle(
            style: TextStyle(fontSize: 10),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    SizedBox(height: 65),
                    buildHeaderTaxableEmployer(),
                    buildHeaderCustomer(),

                    // Table
                    buildTableHeader(),
                    buildTableBodyData(),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                SizedBox(width: 17.5),
                Container(color: PdfColors.black, width: 1),
                SizedBox(width: 19),
                Container(color: PdfColors.black, width: 1),
                SizedBox(width: 159.4),
                Container(color: PdfColors.black, width: 1),
                SizedBox(width: 49),
                Container(color: PdfColors.black, width: 1),
                SizedBox(width: 73.8),
                Container(color: PdfColors.black, width: 1),
                SizedBox(width: 69),
                Container(color: PdfColors.black, width: 1),
                SizedBox(width: 79),
                Container(color: PdfColors.black, width: 1),
                SizedBox(width: 102.4),
                Container(color: PdfColors.black, width: 1),
              ],
            ),
          ),
        ];
      },
      footer: (context) {
        return DefaultTextStyle(
          style: TextStyle(fontSize: 9),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 18,
              right: 18,
              bottom: 45,
            ),
            child: Column(
              children: [
                buildAmountDetails(),
                Container(
                  width: 800,
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
                      SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'TERBILANG : ${Terbilang().terbilang(salesOrder.total).toUpperCase()}',
                        ),
                      ),
                      SizedBox(height: 2),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                footer(),
                                SizedBox(height: 2),
                                Text(
                                  'Pajak Penjualan Atas Barang Mewah',
                                ),
                                SizedBox(height: 2),
                                total(),
                              ],
                            ),
                          ),
                          SizedBox(width: 8),
                          buildTerms(),
                          SizedBox(width: 8),
                          signature(),
                        ],
                      ),
                      SizedBox(height: 3),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        decoration: const BoxDecoration(
                          border: Border(top: BorderSide()),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox.shrink(),
                            Padding(
                              padding: const EdgeInsets.only(left: 140),
                              child: Text(
                                'Page 1 of 1',
                              ),
                            ),
                            Text(
                              'F-C.5.1-001 Rev.00 (16 Aug 2011) ',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

Widget _buildCustomDivider() {
  return Container(
    height: 1,
    width: 125,
    color: PdfColor.fromHex('#000000'),
    margin: const EdgeInsets.symmetric(vertical: 5),
  );
}
