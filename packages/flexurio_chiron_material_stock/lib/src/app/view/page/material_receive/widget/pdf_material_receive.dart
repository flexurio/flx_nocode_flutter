import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Page> pdfMaterialReceive(
  MaterialReceiveDetail materialReceiveDetail,
  List<MaterialReceiveDetail> materialReceiveDetailss,
  List<MaterialReceiveDetail> originalList,
) async {
  final font = await PdfGoogleFonts.nunitoRegular();
  final fontBold = await PdfGoogleFonts.nunitoBold();
  final matGroupId =
      materialReceiveDetail.materialReceive.materialGroup.id.toLowerCase();
  String formatDate(DateTime? date) {
    return date != null ? DateFormat('dd MMMM yyyy').format(date) : '';
  }

  final children = <TableRow>[];
  return MultiPage(
    pageFormat: PdfPageFormat.a5.portrait,
    margin: const EdgeInsets.all(15),
    footer: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: PdfColor.fromHex('#000000'),
                ),
              ),
              child: Text(
                matGroupId == 'kemasan'
                    ? 'F-IK-S.5.1-006-2'
                    : 'F-IK-C.5.1-002-2',
                style: TextStyle(
                  font: font,
                  fontSize: 8,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: PdfColor.fromHex('#000000'),
                ),
              ),
              child: Text(
                materialReceiveDetail.materialReceive.materialGroup.id ==
                        'Kemasan'
                    ? 'Rev. No : 00'
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
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: PdfColor.fromHex('#000000'),
                ),
              ),
              child: Text(
                materialReceiveDetail.materialReceive.materialGroup.id ==
                        'Kemasan'
                    ? 'Issue Date : 01-11-2023'
                    : 'Issue Date : 01-11-2023',
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
              child: Text(
                'Jumlah',
                style: TextStyle(
                  fontSize: 8,
                  font: font,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              child: Text(
                'Nama Barang',
                style: TextStyle(
                  fontSize: 8,
                  font: font,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              child: Text(
                'NA',
                style: TextStyle(
                  fontSize: 8,
                  font: font,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              child: Text(
                'Keterangan',
                style: TextStyle(
                  fontSize: 8,
                  font: font,
                ),
              ),
            ),
          ],
        ),
      );
      List.generate(
        materialReceiveDetailss.length,
        (index) {
          final notes = [
            materialReceiveDetailss[index].expiredDate == null
                ? ''
                : 'Expired Date ' +
                    formatDate(materialReceiveDetailss[index].expiredDate!),
            materialReceiveDetailss[index].shelfLife == null
                ? ''
                : 'Shelf Life ' +
                    formatDate(materialReceiveDetailss[index].shelfLife!),
            materialReceiveDetailss[index].bestBefore == null
                ? ''
                : 'Best Before ' +
                    formatDate(materialReceiveDetailss[index].bestBefore!),
            materialReceiveDetailss[index].retestDate == null
                ? ''
                : 'Retest Date ' +
                    formatDate(materialReceiveDetailss[index].retestDate!),
            materialReceiveDetailss[index].manufacturingDate == null
                ? ''
                : 'Manufacturing Date ' +
                    formatDate(
                        materialReceiveDetailss[index].manufacturingDate!),
          ].where((text) => text.isNotEmpty).join(' / ');
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
                  child: Text(
                    '${originalList.where((item) => item.na == materialReceiveDetailss[index].na).fold<double>(
                          0,
                          (sum, item) => sum + item.quantity,
                        ).format()} ${materialReceiveDetailss[index].materialUnit.id}',
                    style: TextStyle(
                      fontSize: 8,
                      font: font,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                  child: Text(
                    materialReceiveDetailss[index].material.name,
                    style: TextStyle(
                      fontSize: 8,
                      font: font,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                  child: Text(
                    materialReceiveDetailss[index].na.isEmpty
                        ? '-'
                        : materialReceiveDetailss[index].na,
                    style: TextStyle(
                      fontSize: 8,
                      font: font,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                  child: Text(
                    '${materialReceiveDetailss[index].batchNo} $notes',
                    style: TextStyle(
                      fontSize: 8,
                      font: font,
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
          children: children,
        ),
      );
      return [
        Text(
          'PT. METISKA FARMA',
          style: TextStyle(
            font: fontBold,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 3.5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DKI Jakarta',
                  style: TextStyle(
                    font: fontBold,
                    fontSize: 10,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  'No Trans : ${materialReceiveDetail.materialReceive.id}',
                  style: TextStyle(
                    font: fontBold,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            SizedBox(width: 400),
            BarcodeWidget(
              barcode: Barcode.qrCode(),
              data: materialReceiveDetail.materialReceive.id,
              width: 40,
              height: 40,
            ),
          ],
        ),
        Center(
          child: Text(
            matGroupId == 'baku' || matGroupId == 'bantu'
                ? 'BON PENERIMAAN BAHAN AWAL'
                : matGroupId == 'kemasan'
                    ? 'BON PENERIMAAN BAHAN PENGEMAS'
                    : 'BON PENERIMAAN BAHAN ${matGroupId.toUpperCase()}',
            style: TextStyle(
              font: fontBold,
              fontSize: 12,
            ),
          ),
        ),
        SizedBox(
          width: 570,
          child: Divider(
            height: 1,
            thickness: 1,
            color: PdfColor.fromHex('#000000'),
          ),
        ),
        SizedBox(height: 10),
        Table(
          border: TableBorder.all(),
          children: children,
          columnWidths: {
            0: FlexColumnWidth(0.4),
            1: FlexColumnWidth(0.8),
            2: FlexColumnWidth(0.5),
            3: FlexColumnWidth(1),
          },
        ),
        SizedBox(height: 20),
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
                            'Supp.',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ': ${originalList[0].materialReceive.purchaseOrder.supplier.name != '' ? originalList[0].materialReceive.purchaseOrder.supplier.name : '-'}',
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
                            'No. DO',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ': ${originalList[0].materialReceive.deliveryOrderId}',
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
                            'No. PO',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ': ${originalList[0].materialReceive.purchaseOrder.id}',
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
                            'Kode Design',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ': ${originalList[0].materialDesign!.designCode != '' ? originalList[0].materialDesign!.designCode : '-'}',
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
        SizedBox(
          width: 570,
          child: Divider(
            height: 1,
            thickness: 1,
            color: PdfColor.fromHex('#000000'),
          ),
        ),
        SizedBox(height: 10),
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
              'Jakarta, ${DateFormat('dd MMM yyyy').format(DateTime.now())}',
              style: TextStyle(
                font: fontBold,
                fontSize: 9,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Mengetahui,',
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
                  'QC Manager',
                  style: TextStyle(
                    font: font,
                    fontSize: 8,
                  ),
                ),
              ],
            ),
            SizedBox(width: 100),
            Column(
              children: [
                Text(
                  'Diterima Oleh,',
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
                  'Bagian Gudang',
                  style: TextStyle(
                    font: font,
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ],
        ),
      ];
    },
  );
}
