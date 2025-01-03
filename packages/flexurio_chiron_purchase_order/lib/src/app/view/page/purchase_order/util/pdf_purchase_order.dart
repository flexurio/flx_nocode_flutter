import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Page> pdfPurchaseOrder(
  PurchaseOrder purchaseOrder,
  List<PurchaseOrderDetail> purchaseOrderDetails,
) async {
  final font = await PdfGoogleFonts.nunitoRegular();
  final fontItalic = await PdfGoogleFonts.nunitoItalic();
  final fontBold = await PdfGoogleFonts.nunitoBold();
  final dateFormat = DateFormat('dd MMM yyyy');
  final subtotal = purchaseOrderDetails.fold<double>(0, (sum, detail) {
    return sum + (detail.price * detail.quantity);
  });
  final tableRows = <TableRow>[];

  Widget buildCell({
    required String name,
    EdgeInsets? padding,
    PdfColor? color,
    bool? isNumber,
    double? minWidth,
  }) {
    return Container(
      constraints: BoxConstraints(minHeight: 21, minWidth: minWidth ?? 70),
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: PdfColor.fromHex('#000000')),
      ),
      child: Text(
        name,
        textAlign: isNumber ?? false ? TextAlign.right : null,
        style: TextStyle(
          fontSize: 8,
          font: font,
        ),
      ),
    );
  }

  Widget buildTableTotal({required String title, required String value}) {
    final isGroup = purchaseOrder.materialGroup!.id == 'BAKU' ||
        purchaseOrder.materialGroup!.id == 'BANTU';
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(
                color: PdfColor.fromHex('#000000'),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 5,
            ),
            child: Text(
              title,
              style: TextStyle(font: font, fontSize: 9),
              textAlign: TextAlign.right,
            ),
          ),
        ),
        Container(
          width: isGroup ? 104.5 : 118.5,
          height: 20,
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 5,
          ),
          child: Text(
            value,
            style: TextStyle(font: font, fontSize: 9),
            textAlign: TextAlign.right,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: PdfColor.fromHex('#000000'),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildValue(String name, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2),
          width: 98,
          child: Text(
            name,
            style: TextStyle(font: font, fontSize: 11),
          ),
        ),
        Text(': '),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.justify,
            style: TextStyle(
              font: font,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSign({required String label, required String nameSign}) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            font: font,
            fontSize: 11,
          ),
        ),
        SizedBox(height: 25),
        Text(
          '(                           )',
          style: TextStyle(
            font: font,
            fontSize: 11,
          ),
        ),
        SizedBox(height: 10),
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
          nameSign,
          style: TextStyle(
            font: font,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 1.5),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 220,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PT. METISKA FARMA',
                      style: TextStyle(font: fontBold, fontSize: 20),
                    ),
                    SizedBox(height: 2.5),
                    Text(
                      'Jl. Raya Kebayoran Lama 557 Grogol Selatan - Kebayoran Lama Jakarta Selatan DKI Jakarta 12220 Telp : 021-7202351 Fax : 021-7207202379 NPWP : 01.000.891.0-062.000',
                      textAlign: TextAlign.justify,
                      style: TextStyle(font: font, fontSize: 9),
                    ),
                  ],
                ),
              ),
              BarcodeWidget(
                barcode: Barcode.qrCode(),
                data: purchaseOrder.id,
                width: 40,
                height: 40,
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 210,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  buildValue('No. PO', purchaseOrder.id),
                  buildValue(
                    'No. Ref',
                    purchaseOrder.materialRequest.id,
                  ),
                  buildValue(
                    'date'.tr(),
                    dateFormat.format(
                      purchaseOrder.createdAt,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'PURCHASE ORDER - PO',
            style: TextStyle(fontBold: fontBold, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget buildSubHeader() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    buildValue('Name', purchaseOrder.supplier.name),
                    buildValue('Attn', purchaseOrder.supplier.pic),
                    buildValue(
                      'address'.tr(),
                      purchaseOrder.supplier.address,
                    ),
                    buildValue('Phone', purchaseOrder.supplier.phone),
                    buildValue('Fax', purchaseOrder.supplier.fax),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    buildValue(
                      'delivery_date'.tr(),
                      dateFormat.format(purchaseOrder.deliveryDate),
                    ),
                    buildValue(
                      'Payment Terms',
                      '${purchaseOrder.termOfPayment} hari setelah tukar faktur',
                    ),
                    buildValue(
                      'To Be Delivered',
                      'PT. Metiska Farma',
                    ),
                    buildValue(
                      'Quotation No',
                      purchaseOrder.quotationNo == ''
                          ? '-'
                          : purchaseOrder.quotationNo,
                    ),
                    buildValue(
                      'Description',
                      purchaseOrder.description,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'We would like to order the following item(s) : ',
            style: TextStyle(font: font, fontSize: 11),
          ),
        ],
      ),
    );
  }

  return MultiPage(
    pageFormat: PdfPageFormat.a4.portrait,
    margin: const EdgeInsets.all(15),
    build: (Context context) {
      tableRows.add(
        TableRow(
          verticalAlignment: TableCellVerticalAlignment.full,
          children: [
            buildCell(
              name: 'Nama dan Spesifikasi Barang/ Jasa',
              padding:
                  const EdgeInsets.only(right: 5, top: 4, bottom: 4, left: 5),
              color: const PdfColor.fromInt(0xffD3D3D3),
            ),
            if (purchaseOrder.materialGroup!.id == 'BAKU' ||
                purchaseOrder.materialGroup!.id == 'BANTU')
              buildCell(
                name: 'Vendor',
                padding:
                    const EdgeInsets.only(right: 5, top: 4, bottom: 4, left: 5),
                color: const PdfColor.fromInt(0xffD3D3D3),
              ),
            buildCell(
              name: 'Quantity',
              padding:
                  const EdgeInsets.only(right: 5, top: 4, bottom: 4, left: 5),
              color: const PdfColor.fromInt(0xffD3D3D3),
            ),
            buildCell(
              name: 'Unit',
              padding:
                  const EdgeInsets.only(right: 5, top: 4, bottom: 4, left: 5),
              color: const PdfColor.fromInt(0xffD3D3D3),
            ),
            buildCell(
              name: 'Price',
              padding:
                  const EdgeInsets.only(right: 5, top: 4, bottom: 4, left: 5),
              color: const PdfColor.fromInt(0xffD3D3D3),
            ),
            buildCell(
              name: 'currency'.tr(),
              padding:
                  const EdgeInsets.only(right: 5, top: 4, bottom: 4, left: 5),
              color: const PdfColor.fromInt(0xffD3D3D3),
            ),
            buildCell(
              name: 'Total',
              padding:
                  const EdgeInsets.only(right: 5, top: 4, bottom: 4, left: 5),
              color: const PdfColor.fromInt(0xffD3D3D3),
              minWidth: 110,
            ),
          ],
        ),
      );
      for (final purchaseOrderDetail in purchaseOrderDetails) {
        tableRows.add(
          TableRow(
            verticalAlignment: TableCellVerticalAlignment.full,
            children: [
              buildCell(
                name: purchaseOrderDetail.isProduct
                    ? purchaseOrderDetail.product?.name ?? ''
                    : purchaseOrderDetail.material?.name ?? '',
                padding:
                    const EdgeInsets.only(right: 5, top: 4, bottom: 4, left: 5),
              ),
              if (purchaseOrder.materialGroup!.id == 'BAKU' ||
                  purchaseOrder.materialGroup!.id == 'BANTU')
                buildCell(
                  name: purchaseOrder.materialRequest.vendor?.name ?? '-',
                  padding: const EdgeInsets.only(
                    right: 5,
                    top: 4,
                    bottom: 4,
                    left: 5,
                  ),
                ),
              buildCell(
                name: purchaseOrderDetail.quantity.thousandSeparator(),
                padding:
                    const EdgeInsets.only(right: 5, top: 4, bottom: 4, left: 5),
                isNumber: true,
              ),
              buildCell(
                name: purchaseOrderDetail.unit.id,
                padding:
                    const EdgeInsets.only(right: 5, top: 4, bottom: 4, left: 5),
              ),
              buildCell(
                name: purchaseOrderDetail.price.thousandSeparator(),
                padding:
                    const EdgeInsets.only(right: 5, top: 4, bottom: 4, left: 5),
                isNumber: true,
              ),
              buildCell(
                name: purchaseOrder.currency.id,
                padding:
                    const EdgeInsets.only(right: 5, top: 4, bottom: 4, left: 5),
              ),
              buildCell(
                name: purchaseOrderDetail.subtotal.thousandSeparator(),
                padding:
                    const EdgeInsets.only(right: 5, top: 4, bottom: 4, left: 5),
                isNumber: true,
                minWidth: 110,
              ),
            ],
          ),
        );
      }
      return [
        buildHeader(),
        buildSubHeader(),
        Table(children: tableRows),
        Column(
          children: [
            buildTableTotal(
              title: 'Subtotal',
              value: subtotal.thousandSeparator(),
            ),
            buildTableTotal(
              title: 'Discount (${purchaseOrder.discountPercent}%)',
              value: purchaseOrder.discountValue.thousandSeparator(),
            ),
            buildTableTotal(
              title: 'PPN (${purchaseOrder.ppn.id}%)',
              value: purchaseOrder.ppnValue.thousandSeparator(),
            ),
            if (purchaseOrder.taxType == TaxType.taxFinal ||
                purchaseOrder.taxType == TaxType.taxNone)
              buildTableTotal(
                title: 'PPH (${purchaseOrder.taxPercent}%)',
                value: purchaseOrder.taxValue.thousandSeparator(),
              )
            else if (purchaseOrder.taxType == TaxType.tax22Sale)
              buildTableTotal(
                title:
                    'PPH ${purchaseOrder.taxType.type} (${purchaseOrder.pph22Percent}%)',
                value: purchaseOrder.pph22Value.thousandSeparator(),
              )
            else
              buildTableTotal(
                title:
                    'PPH ${purchaseOrder.taxType.type} (${purchaseOrder.taxPercent}%)',
                value: purchaseOrder.taxValue.thousandSeparator(),
              ),
            buildTableTotal(
              title: 'Total',
              value: purchaseOrder.total.thousandSeparator(),
            ),
            buildTableTotal(
              title: 'DP (${purchaseOrder.dpPercent}%)',
              value: purchaseOrder.dpValue.thousandSeparator(),
            ),
            buildTableTotal(
              title: 'Amount Balance',
              value: purchaseOrder.total.thousandSeparator(),
            ),
          ],
        ),
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5),
                ),
                child: Text(
                  'Lampirkan Copy PO saat pengiriman Barang. Ket. Akuntan : ',
                  style: TextStyle(
                    font: font,
                    fontItalic: fontItalic,
                    fontSize: 11,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ];
    },
    footer: (context) {
      return Column(
        children: [
          if (context.pageNumber == context.pagesCount)
            if (purchaseOrder.materialGroup!.id == 'BAKU' ||
                purchaseOrder.materialGroup!.id == 'BANTU')
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Disiapkan Oleh,\nProcurement Staff\n',
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
                        '   ',
                        style: TextStyle(
                          font: font,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Text(
                        'Diperiksa Oleh,\nProcurement Head\n',
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
                        '   ',
                        style: TextStyle(
                          font: font,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: Text(
                          'Disetujui Oleh,\nApoteker Penanggung\nJawab Produksi',
                          style: TextStyle(
                            font: font,
                            fontSize: 8,
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        '\n\n\n(apt. Akhmad Ridwan Firli, S.Farm)',
                        style: TextStyle(
                          font: font,
                          fontSize: 8,
                        ),
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                        width: 140,
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: PdfColor.fromHex('#000000'),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'No. SIPA : 21/B.19/31.74.05.1005.06.001.C.\n1/3/-1.779.3/e/2022',
                        style: TextStyle(
                          font: font,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Text(
                        '\nDiketahui Oleh,\n',
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
                        '   ',
                        style: TextStyle(
                          font: font,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Disiapkan Oleh, :',
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
                        'Procurement Staff',
                        style: TextStyle(
                          font: font,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 40),
                  Column(
                    children: [
                      Text(
                        'Diperiksa Oleh, :',
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
                        'Procurement Head',
                        style: TextStyle(
                          font: font,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 40),
                  Column(
                    children: [
                      Text(
                        'Disetujui Oleh, :',
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
                        '',
                        style: TextStyle(
                          font: font,
                          fontSize: 8,
                          color: PdfColor.fromHex('#00000000'),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
          if (context.pageNumber == context.pagesCount) SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'F-SOP-S.4.1-002 Rev.02 (10 Nov 2023)   page ${context.pageNumber} of ${context.pagesCount}',
              style: TextStyle(font: font, fontSize: 12),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(
                color: PdfColor.fromHex('#000000'),
              ),
            ),
            child: Text(
              'PO ini hanya berlaku Max 60 hari setelah Delivery Date yang tercantum. Bila melewati maka PO ini tidak berlaku (Batal),',
              style: TextStyle(font: fontBold, fontSize: 12),
            ),
          ),
        ],
      );
    },
  );
}
