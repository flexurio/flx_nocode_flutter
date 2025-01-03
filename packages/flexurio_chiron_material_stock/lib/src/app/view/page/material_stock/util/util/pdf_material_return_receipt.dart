import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Page> pdfMaterialReturnReceipt(
  MaterialReceiveDetail materialReceiveDetail,
  List<MaterialReceiveDetail> listMaterialReceiveDetail,
) async {
  final font = await PdfGoogleFonts.nunitoRegular();
  final fontBold = await PdfGoogleFonts.nunitoBold();

  return MultiPage(
    pageFormat: PdfPageFormat.a5.portrait,
    margin: const EdgeInsets.all(15),
    footer: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Print By : ${UserRepositoryApp.instance.userApp?.name ?? '-'}',
            style: TextStyle(
              font: font,
              fontSize: 8,
            ),
          ),
        ],
      );
    },
    build: (Context context) {
      return [
        Text(
          'PT. METISKA FARMA',
          style: TextStyle(
            font: fontBold,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Jl. Raya Kebayoran Lama 557\nGrogol Selatan - Kebayoran Lama\nJakarta Selatan - DKI Jakarta 12220\nPhone 021-7202351',
          style: TextStyle(
            font: font,
            fontSize: 8,
          ),
        ),
        SizedBox(height: 30),
        Center(
          child: Text(
            'TANDA TERIMA RETUR MATERIAL',
            style: TextStyle(
              font: fontBold,
              fontSize: 12,
            ),
          ),
        ),
        SizedBox(height: 30),
        SizedBox(
          height: 200,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 60,
                          child: Text(
                            'Telah terima',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        SizedBox(width: 70),
                        Text(
                          ': PT. METISKA FARMA',
                          style: TextStyle(
                            font: font,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 40,
                          child: Text(
                            'Berupa,',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: Text(
                                    'Nama Material',
                                    style: TextStyle(
                                      font: font,
                                      fontSize: 8,
                                    ),
                                  ),
                                ),
                                Text(
                                  ': ${materialReceiveDetail.material.name}',
                                  style: TextStyle(
                                    font: font,
                                    fontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: Text(
                                    'No PO',
                                    style: TextStyle(
                                      font: font,
                                      fontSize: 8,
                                    ),
                                  ),
                                ),
                                Text(
                                  ': ${materialReceiveDetail.materialReceive.purchaseOrder.id}',
                                  style: TextStyle(
                                    font: font,
                                    fontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: Text(
                                    'No Surat Jalan',
                                    style: TextStyle(
                                      font: font,
                                      fontSize: 8,
                                    ),
                                  ),
                                ),
                                Text(
                                  ': ${materialReceiveDetail.materialReceive.deliveryOrderId}',
                                  style: TextStyle(
                                    font: font,
                                    fontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: Text(
                                    'No Batch / Lot',
                                    style: TextStyle(
                                      font: font,
                                      fontSize: 8,
                                    ),
                                  ),
                                ),
                                Text(
                                  ': ${materialReceiveDetail.batchNo}',
                                  style: TextStyle(
                                    font: font,
                                    fontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: Text(
                                    'Jumlah',
                                    style: TextStyle(
                                      font: font,
                                      fontSize: 8,
                                    ),
                                  ),
                                ),
                                Text(
                                  ': ${materialReceiveDetail.totalQuantity.format()} ${materialReceiveDetail.materialUnit.id}',
                                  style: TextStyle(
                                    font: font,
                                    fontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: Text(
                                    'Supplier',
                                    style: TextStyle(
                                      font: font,
                                      fontSize: 8,
                                    ),
                                  ),
                                ),
                                Text(
                                  ': ${materialReceiveDetail.materialReceive.purchaseOrder.supplier.name}',
                                  style: TextStyle(
                                    font: font,
                                    fontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                          child: Text(
                            'Keterangan',
                            style: TextStyle(
                              font: font,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        SizedBox(width: 80),
                        Text(
                          ': ${materialReceiveDetail.materialReceive.description}',
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
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Jakarta, .......................... 20..............',
              style: TextStyle(
                font: font,
                fontSize: 8,
              ),
            ),
            SizedBox(width: 17),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Yang Menyerahkan,',
                  style: TextStyle(
                    font: font,
                    fontSize: 8,
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  '(                                                   )',
                  style: TextStyle(
                    font: font,
                    fontSize: 8,
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
            SizedBox(width: 100),
            Column(
              children: [
                Text(
                  'Yang Menerima,',
                  style: TextStyle(
                    font: font,
                    fontSize: 8,
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  '(                                                   )',
                  style: TextStyle(
                    font: font,
                    fontSize: 8,
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
          ],
        ),
      ];
    },
  );
}
