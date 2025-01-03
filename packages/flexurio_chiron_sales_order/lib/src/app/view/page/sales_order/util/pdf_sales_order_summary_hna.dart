import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_summary.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfSalesOrderSummaryHna({
  required List<SalesOrderSummary> data,
  DateTime? startDate,
  DateTime? endDate,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  final groupByTypeProduct = groupBy<SalesOrderSummary>(
    data,
    (element) => element.productType,
  ).entries;

  // final totalOrderAll =  data.fold<double>(
  //   0, (sum, item) => sum + item.salesOrderQuantity,
  // );
  // final totalSendAll =  data.fold<double>(
  //   0, (sum, item) => sum + item.salesOrderQuantityDelivery,
  // );
  // final valueOrderAll =  data.fold<double>(
  //   0, (sum, item) => sum + item.valueSalesOrder,
  // );
  // final valueRealizationAll =  data.fold<double>(
  //   0, (sum, item) => sum + item.valueRealization,
  // );

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle:
        'LAPORAN SALES ORDER HNA PERIODE : ${DateFormat('dd/MM/yyyy').format(startDate ?? DateTime.now())} S/D ${DateFormat('dd/MM/yyyy').format(endDate ?? DateTime.now())}',
    pageFormat: PdfPageFormat.a3.landscape.copyWith(
      width: 50 * PdfPageFormat.cm,
    ),
    orientation: PageOrientation.landscape,
    // headerChild: Padding(
    //   padding: const EdgeInsets.only(left: 36, right: 36, top: 12),
    //   child: Text(
    //     'Periode : ${DateFormat('yyyyMMdd').format(startDate ?? DateTime.now())} S/D ${DateFormat('yyyyMMdd').format(endDate ?? DateTime.now())}',
    //   ),
    // ),
    build: (context) => [
      Column(
        children: groupByTypeProduct.map((data) {
          // final totalOrder =  data.value.fold<double>(
          //   0, (sum, item) => sum + item.salesOrderQuantity,
          // );
          // final totalSend =  data.value.fold<double>(
          //   0, (sum, item) => sum + item.salesOrderQuantityDelivery,
          // );
          // final valueOrder =  data.value.fold<double>(
          //   0, (sum, item) => sum + item.valueSalesOrder,
          // );
          // final valueRealization =  data.value.fold<double>(
          //   0, (sum, item) => sum + item.valueRealization,
          // );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: PdfColors.blueGrey200),
              tableHeader(
                hasChildren: true,
                columns: [
                  PColumnHeader(
                    title: 'Jenis'.tr(),
                    primary: true,
                  ),
                  PColumnHeader(
                    title: 'NO. PO'.tr(),
                  ),
                  PColumnHeader(
                    title: 'TGL. SO'.tr(),
                  ),
                  PColumnHeader(
                    title: 'NO. SO'.tr(),
                  ),
                  PColumnHeader(
                    title: 'NO. BATCH'.tr(),
                  ),
                  PColumnHeader(
                    title: 'EXP. DATE'.tr(),
                  ),
                  PColumnHeader(
                    title: 'TGL. KIRIM'.tr(),
                  ),
                  PColumnHeader(
                    title: 'KONSUMEN'.tr(),
                  ),
                  PColumnHeader(
                    title: 'NAMA BRG'.tr(),
                  ),
                  PColumnHeader(
                    title: 'KODE BRG'.tr(),
                  ),
                  PColumnHeader(
                    flex: 4,
                    title: 'JUMLAH'.tr(),
                    children: [
                      PColumnHeader(
                        title: 'Per 0902',
                        numeric: true,
                      ),
                      PColumnHeader(
                        title: 'Penambahan',
                        numeric: true,
                      ),
                    ],
                  ),
                  PColumnHeader(
                    title: 'SAT'.tr(),
                  ),
                  PColumnHeader(
                    title: 'HARGA'.tr(),
                  ),
                  PColumnHeader(
                    title: 'NILAI SALES ORDER'.tr(),
                  ),
                  PColumnHeader(
                    title: 'NILAI REALISASI'.tr(),
                  ),
                ],
              ),
              ...List.generate(data.value.length, (index) {
                return tableBody<SalesOrderSummary>(
                  data: data.value.sublist(0, 1).toList(),
                  columns: [
                    PColumnBody(
                      contentBuilder: (data, index) => data.productType,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) =>
                          data.purchaseOrderDistributor,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) =>
                          DateFormat('dd/MM/yyyy').format(data.salesOrderDate),
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.salesOrderId,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.batchNoId ?? '-',
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) {
                        return data.expiredDate != null
                            ? DateFormat('dd/MM/yyyy').format(data.expiredDate!)
                            : '-';
                      },
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) =>
                          data.deliveryOrderReceived != null
                              ? DateFormat('dd/MM/yyyy').format(
                                  DateTime.parse(data.deliveryOrderReceived!))
                              : '-',
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) =>
                          '${data.customerId} ${data.customerName}',
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.productName,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.productId,
                    ),
                    PColumnBody(
                      flex: 2,
                      contentBuilder: (data, index) =>
                          data.salesOrderQuantity.format(),
                    ),
                    PColumnBody(
                      flex: 2,
                      contentBuilder: (data, index) =>
                          data.salesOrderQuantityDelivery.format(),
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.unitId,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) =>
                          data.productPrice.format(),
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) =>
                          data.valueSalesOrder.format(),
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) =>
                          data.valueRealization.format(),
                    ),
                  ],
                );
              }),
              // Row(
              //   children: [
              //       SizedBox(width: 1060),
              //       Expanded(
              //         child: Column(
              //           children: [
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.end,
              //               children: [
              //                 tileDataHorizontal(
              //                   label: 'total'.tr(),
              //                   child: Row(
              //                     children: [
              //                       Text(
              //                         data.value.fold<double>(
              //                           0, (sum, item) => sum + item.salesOrderQuantity,
              //                         ).format(),
              //                         style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                         ),
              //                       ),
              //                       Text(
              //                         data.value.fold<double>(
              //                           0, (sum, item) => sum + item.salesOrderQuantityDelivery,
              //                         ).format(),
              //                         style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 tileDataHorizontal(
              //                   label: 'total'.tr(),
              //                   child: Row(
              //                     children: [
              //                       Text(
              //                         data.value.fold<double>(
              //                           0, (sum, item) => sum + item.valueSalesOrder,
              //                         ).format(),
              //                         style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                         ),
              //                       ),
              //                       Text(
              //                         data.value.fold<double>(
              //                           0, (sum, item) => sum + item.valueRealization,
              //                         ).format(),
              //                         style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.end,
              //               children: [
              //                 tileDataHorizontal(
              //                   label: 'REALISASI'.tr(),
              //                   child: Row(
              //                     children: [
              //                       Text(
              //                         '',
              //                         style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                         ),
              //                       ),
              //                       Text(
              //                         '${totalOrder / totalSend * 100}',
              //                         style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 tileDataHorizontal(
              //                   label: 'REALISASI'.tr(),
              //                   child: Row(
              //                     children: [
              //                       Text(
              //                         '',
              //                         style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                         ),
              //                       ),
              //                       Text(
              //                         '${valueOrder / valueRealization * 100}',
              //                         style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ]
              //         )
              //       ),
              //     ],
              // ),
            ],
          );
        }).toList(),
      ),
      // Expanded(
      //   child: SizedBox(
      //     child:
      // Row(
      //   children: [
      //     SizedBox(width: 1060),
      //     Expanded(
      //       child: Column(
      //         children: [
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.end,
      //             children: [
      //               tileDataHorizontal(
      //                 label: 'TOTAL SELURUH'.tr(),
      //                 child: Row(
      //                   children: [
      //                     Text(
      //                       data.fold<double>(
      //                         0, (sum, item) => sum + item.salesOrderQuantity,
      //                       ).format(),
      //                       style: TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                     Text(
      //                       data.fold<double>(
      //                         0, (sum, item) => sum + item.salesOrderQuantityDelivery,
      //                       ).format(),
      //                       style: TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               tileDataHorizontal(
      //                 label: 'TOTAL SELURUH'.tr(),
      //                 child: Row(
      //                   children: [
      //                     Text(
      //                       data.fold<double>(
      //                         0, (sum, item) => sum + item.valueSalesOrder,
      //                       ).format(),
      //                       style: TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                     Text(
      //                       data.fold<double>(
      //                         0, (sum, item) => sum + item.valueRealization,
      //                       ).format(),
      //                       style: TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.end,
      //             children: [
      //               tileDataHorizontal(
      //                 label: 'REALISASI SELURUH'.tr(),
      //                 child: Row(
      //                   children: [
      //                     Text(
      //                       '',
      //                       style: TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                     Text(
      //                       '${totalOrderAll / totalSendAll * 100}',
      //                       style: TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               tileDataHorizontal(
      //                 label: 'REALISASI SELURUH'.tr(),
      //                 child: Row(
      //                   children: [
      //                     Text(
      //                       '',
      //                       style: TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                     Text(
      //                       '${valueOrderAll / valueRealizationAll * 100}',
      //                       style: TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ],
      //       )
      //     ),
      //   ],
      // ),
      //   )
      // ),
    ],
  );
}
