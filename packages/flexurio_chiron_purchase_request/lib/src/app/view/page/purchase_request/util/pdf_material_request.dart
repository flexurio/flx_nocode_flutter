import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

Future<Page> pdfMaterialRequest(
  MaterialRequest materialRequest,
  List<PurchaseRequestDetail> materialRequestDetail,
  List<PurchaseOrderDetail> purchaseOrderDetails, {
  required int chunkIndex,
}) async {
  final font = await PdfGoogleFonts.nunitoRegular();
  final fontBold = await PdfGoogleFonts.nunitoBold();
  final createdBy = await EmployeeRepository.findById(
    UserRepositoryApp.instance.token!,
    materialRequest.createdById == 0
        ? '1'
        : materialRequest.createdById.toString(),
  );
  final createdByName = materialRequest.createdById == 0
      ? '(                           )'
      : '(  ${createdBy?.name ?? '-'}  )';

  final children = <TableRow>[];
  final number = (chunkIndex * 3) + 1;
  return MultiPage(
    pageFormat: PdfPageFormat.a5.landscape,
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
                'Form No. : F-SOP-C.2.2-001',
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
                'Rev No. : 01',
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
                'Issue Date : 01-February-2024',
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
            border: Border.symmetric(
              horizontal: BorderSide(
                color: PdfColor.fromHex('#000000'),
              ),
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5, top: 4, bottom: 4),
              child: Text(
                'No',
                style: TextStyle(
                  fontSize: 8,
                  font: font,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 4, bottom: 4),
              child: Text(
                'Nama Material',
                style: TextStyle(
                  fontSize: 8,
                  font: font,
                ),
              ),
            ),
            if (['PRODUCT'].contains(materialRequest.materialGroup.id))
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 4, bottom: 4),
                child: Text(
                  'Nomor Batch',
                  style: TextStyle(
                    fontSize: 8,
                    font: font,
                  ),
                ),
              ),
            if (['KEMASAN'].contains(materialRequest.materialGroup.id))
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 4, bottom: 4),
                child: Text(
                  'Design Kemasan',
                  style: TextStyle(
                    fontSize: 8,
                    font: font,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 4, bottom: 4),
              child: Text(
                'Jumlah',
                style: TextStyle(
                  fontSize: 8,
                  font: font,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 4, bottom: 4),
              child: Text(
                'Unit',
                style: TextStyle(
                  fontSize: 8,
                  font: font,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 4, bottom: 4),
              child: Text(
                'Produsen',
                style: TextStyle(
                  fontSize: 8,
                  font: font,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 4, bottom: 4),
              child: Text(
                'Stok Akhir',
                style: TextStyle(
                  fontSize: 8,
                  font: font,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: Text(
                'Tgl.Tempo',
                style: TextStyle(
                  fontSize: 8,
                  font: font,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: Text(
                'Pack Size',
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
        materialRequestDetail.length,
        (index) {
          return children.add(
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5, top: 3),
                  child: Text(
                    (index + number).toString(),
                    style: TextStyle(
                      fontSize: 8,
                      font: font,
                    ),
                  ),
                ),
                if (materialRequestDetail[index].material != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 3),
                    child: Text(
                      '${materialRequestDetail[index].material?.id} - ${materialRequestDetail[index].material?.name}',
                      style: TextStyle(
                        fontSize: 8,
                        font: font,
                      ),
                    ),
                  ),
                if (materialRequestDetail[index].product != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 3),
                    child: Text(
                      '${materialRequestDetail[index].product?.id} - ${materialRequestDetail[index].product?.name}',
                      style: TextStyle(
                        fontSize: 8,
                        font: font,
                      ),
                    ),
                  ),
                if (['PRODUCT'].contains(materialRequest.materialGroup.id))
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 3),
                    child: Text(
                      materialRequestDetail[index].batchNo ?? '-',
                      style: TextStyle(
                        fontSize: 8,
                        font: font,
                      ),
                    ),
                  ),
                if (['KEMASAN'].contains(materialRequest.materialGroup.id))
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 3),
                    child: Text(
                      materialRequestDetail[index].materialDesign?.designCode ??
                          '-',
                      style: TextStyle(
                        fontSize: 8,
                        font: font,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 3),
                  child: Text(
                    materialRequestDetail[index].quantity.toString(),
                    style: TextStyle(
                      fontSize: 8,
                      font: font,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 3),
                  child: Text(
                    materialRequestDetail[index].unit.id,
                    style: TextStyle(
                      fontSize: 8,
                      font: font,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 3),
                  child: Text(
                    materialRequest.vendor?.name ?? '-',
                    style: TextStyle(
                      fontSize: 8,
                      font: font,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 3),
                  child: Text(
                    '-',
                    style: TextStyle(
                      fontSize: 8,
                      font: font,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    materialRequestDetail[index].dueDate.yyyyMMdd,
                    style: TextStyle(
                      fontSize: 8,
                      font: font,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    (materialRequestDetail[index].material?.packSize ?? 0) == 0
                        ? '-'
                        : (materialRequestDetail[index].material?.packSize ?? 0)
                            .toString(),
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
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'PURCHASE REQUEST',
                  style: TextStyle(
                    font: fontBold,
                    fontSize: 9,
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 105,
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: PdfColor.fromHex('#000000'),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'PERMINTAAN PEMBELIAN',
                  style: TextStyle(
                    font: fontBold,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
            SizedBox(width: 100),
            BarcodeWidget(
              barcode: Barcode.qrCode(),
              data: materialRequest.id,
              width: 40,
              height: 40,
            ),
          ],
        ),
        SizedBox(height: 25),
        Container(
          height: 90,
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
                            'Jenis',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ': ${materialRequest.materialGroup.id}',
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
                            'Nomor Pesan',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ': ${materialRequest.id}',
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
                            'Tanggal Pesan',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ': ${materialRequest.createdAt.yyyyMMdd}',
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
                            'Tanggal Dibutuhkan',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ': ${materialRequest.dateOfNeed.yyyyMMdd}',
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
                            'Tanggal Cetak',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ': ${materialRequest.isPrintAt?.yyyyMMdd ?? '-'}',
                          style: TextStyle(
                            font: font,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                    if (!['BAKU', 'BANTU', 'KEMASAN', 'BAKU / BANTU']
                        .contains(materialRequest.materialGroup.id))
                      Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: Text(
                              'Tanggal Disetujui',
                              style: TextStyle(
                                font: font,
                                fontSize: 8,
                              ),
                            ),
                          ),
                          Text(
                            ': ${materialRequest.isPrintAt?.yyyyMMdd ?? '-'}',
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
                            'Permintaan Dari',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Text(
                          ': ${materialRequest.department.name}',
                          style: TextStyle(
                            font: font,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 80,
                          child: Text(
                            'Keterangan',
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
                        Expanded(
                          child: Text(
                            materialRequest.description == ''
                                ? '-'
                                : formatString(materialRequest.description, 40),
                            style: TextStyle(
                              font: font,
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
        SizedBox(height: 10),
        Table(
          children: children,
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Dibuat Oleh :',
                  style: TextStyle(
                    font: font,
                    fontSize: 8,
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  createdByName,
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
                  'Staff ${materialRequest.department.name}',
                  style: TextStyle(
                    font: font,
                    fontSize: 8,
                  ),
                ),
              ],
            ),
            SizedBox(width: 20),
            Column(
              children: [
                Text(
                  'Diperiksa Oleh :',
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
                  'SPV ${materialRequest.department.name}',
                  style: TextStyle(
                    font: font,
                    fontSize: 8,
                  ),
                ),
              ],
            ),
            SizedBox(width: 20),
            Column(
              children: [
                Text(
                  'Disetujui Oleh :',
                  style: TextStyle(
                    font: font,
                    fontSize: 8,
                  ),
                ),
                SizedBox(height: 35),
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
                  'Manager ${materialRequest.department.name}',
                  style: TextStyle(
                    font: font,
                    fontSize: 8,
                  ),
                ),
              ],
            ),
            SizedBox(width: 20),
            Column(
              children: [
                Text(
                  'Diterima Oleh :',
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
                  'Dept. Procurement',
                  style: TextStyle(
                    font: font,
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 5),
        for (final purchase in purchaseOrderDetails)
          Container(
            child: Text(
              'No.PO: ${purchase.purchaseOrder.id}, Tgl.PO: ${purchase.purchaseOrder.deliveryDate.yMMMMd}, Supplier: ${purchase.purchaseOrder.supplier.name}, Unit: ${purchase.unit.id} ,Qty: ${purchase.quantity}, Harga: ${purchase.price}',
              style: const TextStyle(fontSize: 8),
            ),
          ),
      ];
    },
  );
}

String formatString(String str, int chunkSize) {
  final result = StringBuffer();
  for (var i = 0; i < str.length; i += chunkSize) {
    if (i + chunkSize < str.length) {
      result.write('${str.substring(i, i + chunkSize)}\n');
    } else {
      result.write(str.substring(i));
    }
  }
  print(result);
  return result.toString();
}
