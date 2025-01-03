import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfPendingRequestsUnserved({
  required List<PendingRequestsUnserved> data,
  DateTime? startDate,
  DateTime? endDate,
}) async {

  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  final groupByTypeProduct = groupBy<PendingRequestsUnserved>(
    data,
    (element) => element.typeProduct,
  ).entries;

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'PENDINGAN YG TIDAK TERLAYANI HNA',
    pageFormat: PdfPageFormat.a3.landscape.copyWith(
      width: 50 * PdfPageFormat.cm,
    ),
    headerChild: Padding(
      padding: const EdgeInsets.only(right: 36, left: 36, bottom: 10),
      child: Text(
        'Periode : ${DateFormat('yyyyMMdd').format(startDate ?? DateTime.now())} S/D ${DateFormat('yyyyMMdd').format(endDate ?? DateTime.now())}',
      ),
    ),
    build: (context) => [
      Column(
        children: groupByTypeProduct.map((data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: PdfColors.blueGrey200),
              tableHeader(
                  hasChildren: true,
                  columns: [
                    PColumnHeader(
                      flex: 2,
                      primary: true,
                      title: 'Jenis'.tr(),
                    ),
                    PColumnHeader(
                      title: 'No Pending'.tr(),
                    ),
                    PColumnHeader(
                      title: 'Konsumen'.tr(),
                    ),
                    PColumnHeader(
                      title: 'Tgl Pend'.tr(),
                    ),
                    PColumnHeader(
                      title: 'Kode BRG'.tr(),
                    ),
                    PColumnHeader(
                      title: 'Qty'.tr(),
                    ),
                    PColumnHeader(
                      title: 'Qty Sisa'.tr(),
                    ),
                    PColumnHeader(
                      title: 'HNA'.tr(),
                    ),
                    PColumnHeader(
                      title: 'SO Awal'.tr(),
                    ),
                    PColumnHeader(
                      title: 'SO Susul'.tr(),
                    ),
                    PColumnHeader(
                      title: 'Tgl PPIC'.tr(),
                    ),
                    PColumnHeader(
                      title: 'Jum Hari'.tr(),
                    ),
                    PColumnHeader(
                      title: 'Nilai'.tr(),
                    ),
                  ],
                ),
              ...List.generate(data.value.length, (index) {
                return tableBody<PendingRequestsUnserved>(
                    data: data.value.sublist(0, 1).toList(),
                    columns: [
                      PColumnBody(
                        flex: 0.8,
                        contentBuilder: (data, index) => data.typeProduct,
                      ),
                      PColumnBody(
                        flex: 0.8,
                        contentBuilder: (data, index) => data.productRequestId,
                      ),
                      PColumnBody(
                        flex: 0.8,
                        contentBuilder: (data, index) => data.customerId,
                      ),
                      PColumnBody(
                        flex: 0.8,
                        contentBuilder: (data, index) {
                          return DateFormat().format(data.productRequestDate);
                        } ,
                      ),
                      PColumnBody(
                        flex: 0.8,
                        contentBuilder: (data, index) {
                          return data.productId + data.productName;
                        },
                      ),
                      PColumnBody(
                        flex: 0.8,
                        contentBuilder: (data, index) {
                          return data.productRequestQuantity.format();
                        },
                        numeric: true,
                      ),
                      PColumnBody(
                        flex: 0.8,
                        contentBuilder: (data, index) {
                          return data.quantityRemaining.format();
                        },
                        numeric: true,
                      ),
                      PColumnBody(
                        flex: 0.8,
                        contentBuilder: (data, index) => data.unitId,
                      ),
                      PColumnBody(
                        flex: 0.8,
                        contentBuilder: (data, index) {
                          return data.productPrice.format();
                        },
                        numeric: true,
                      ),
                      PColumnBody(
                        flex: 0.8,
                        contentBuilder: (data, index) {
                          return data.initialSalesOrderId ?? '-';
                        },
                      ),
                      PColumnBody(
                        flex: 0.8,
                        contentBuilder: (data, index) {
                          return data.finalSalesOrderId ?? '-';
                        },
                      ),
                      PColumnBody(
                        flex: 0.8,
                        contentBuilder: (data, index) {
                          if ( data.initialSalesOrderId != null && data.finalSalesOrderId != null) {
                            return DateFormat().format(data.finalSalesOrderDate!);
                          } else if (data.initialSalesOrderId != null) {
                            return DateFormat().format(data.initialSalesOrderate!);
                          } else if (data.finalSalesOrderId != null) {
                            return DateFormat().format(data.finalSalesOrderDate!);
                          } else {
                            return '-';
                          }
                        },
                      ),
                      PColumnBody(
                        flex: 0.8,
                        contentBuilder: (data, index) {
                          if (data.initialSalesOrderate != null && data.finalSalesOrderDate != null) {
                           final durationDays = data.initialSalesOrderate!.difference(data.finalSalesOrderDate!).inDays;
                            return durationDays.toString(); 
                          } else {
                            return '-';
                          }
                        },
                      ),
                      PColumnBody(
                        flex: 0.8,
                        contentBuilder: (data, index) {
                          return data.totalProductRequestPrice.format();
                          // return (data.productPrice * data.quantityRemaining).format();
                        },
                        numeric: true,
                      ),
                    ],
                  );
              }),
              Row(
                children: [
                    SizedBox(width: 1060),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          tileDataHorizontal(
                            label: 'total'.tr(),
                            child: Row(
                              children: [
                                Text(
                                  data.value.first.typeProduct,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  data.value.fold<double>(
                                    0, (sum, item) => sum + item.totalProductRequestPrice,
                                    // (item.productPrice * item.quantityRemaining),
                                  ).format(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
              ),
            ],
          );
        }).toList(),
      ),
      Row(
        children: [
          SizedBox(width: 1060),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                tileDataHorizontal(
                  label: 'Total All',
                  child:  Text(
                    data.fold<double>(
                      0, (sum, item) => sum + item.totalProductRequestPrice,
                      // (item.productPrice * item.quantityRemaining),
                    ).format(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),      
    ],
  );
}
