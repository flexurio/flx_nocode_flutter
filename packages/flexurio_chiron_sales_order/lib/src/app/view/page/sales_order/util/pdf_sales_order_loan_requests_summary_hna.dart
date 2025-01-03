import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_loan_requests_summary.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfSalesOrderLoanRequestsSummaryHna({
  required List<SalesOrderLoanRequestsSummary> data,
  DateTime? startDate,
  DateTime? endDate,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  final groupByTypeProduct = groupBy<SalesOrderLoanRequestsSummary>(
    data,
    (element) => element.productType,
  ).entries;

  final totalQtyAll = data.fold<double>(
    0,
    (sum, item) => sum + item.qty,
  );

  final totalQtyDeliveryAll = data.fold<double>(
    0,
    (sum, item) => sum + item.qtyDelivery,
  );

  final totalValueSalesOrderAll = data.fold<double>(
    0,
    (sum, item) => sum + item.valueSalesOrder,
  );

  final totalValueRealizationAll = data.fold<double>(
    0,
    (sum, item) => sum + item.valueRealization,
  );

  final totalRealizationPerTypeAll = (totalQtyAll / totalQtyDeliveryAll) * 100;
  final valueRealizationPerTypeAll =
      (totalValueSalesOrderAll / totalValueRealizationAll) * 100;

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle:
        'LAPORAN SALES ORDER HNA PERIODE : ${startDate?.ddMMyyyySlash ?? DateTime.now().ddMMyyyySlash} S/D ${endDate?.ddMMyyyySlash ?? DateTime.now().ddMMyyyySlash}',
    pageFormat: PdfPageFormat.a3.landscape.copyWith(
      width: 50 * PdfPageFormat.cm,
    ),
    orientation: PageOrientation.landscape,
    build: (context) => [
      Column(
        children: groupByTypeProduct.map((data) {
          final totalQty = data.value.fold<double>(
            0,
            (sum, item) => sum + item.qty,
          );
          final totalQtyDelivery = data.value.fold<double>(
            0,
            (sum, item) => sum + item.qtyDelivery,
          );
          final totalValueSalesOrder = data.value.fold<double>(
            0,
            (sum, item) => sum + item.valueSalesOrder,
          );
          final totalValueRealization = data.value.fold<double>(
            0,
            (sum, item) => sum + item.valueRealization,
          );

          final totalRealizationPerType = (totalQty / totalQtyDelivery) * 100;
          final valueRealizationPerType =
              (totalValueSalesOrder / totalValueRealization) * 100;

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
                        title: 'ORDER',
                        numeric: true,
                      ),
                      PColumnHeader(
                        title: 'KIRIM',
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
                return tableBody<SalesOrderLoanRequestsSummary>(
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
                          data.salesOrderDate.ddMMyyyySlash,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.salesOrderId,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) =>
                          data.batchNoId == '' ? '-' : data.batchNoId,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) =>
                          data.expiredDate.ddMMyyyySlash,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) =>
                          data.deliveryOrderDate.ddMMyyyySlash,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.customerName,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.productName,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.productId,
                    ),
                    PColumnBody(
                      flex: 2,
                      contentBuilder: (data, index) => data.qty.format(),
                    ),
                    PColumnBody(
                      flex: 2,
                      contentBuilder: (data, index) =>
                          data.qtyDelivery.format(),
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.unitId,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.price.format(),
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
              SizedBox(height: 10),
              tableFooter(
                columns: [
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(footer: 'TOTAL'),
                  PColumnFooter(flex: 2, footer: totalQty.format()),
                  PColumnFooter(
                    flex: 2,
                    footer: totalQtyDelivery.format(),
                  ),
                  PColumnFooter(),
                  PColumnFooter(
                    footer: 'TOTAL',
                  ),
                  PColumnFooter(
                    footer: totalValueSalesOrder.format(),
                  ),
                  PColumnFooter(
                    footer: totalValueRealization.format(),
                  ),
                ],
              ),
              tableFooter(
                columns: [
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(
                    footer: 'REALISASI',
                  ),
                  PColumnFooter(
                    flex: 2,
                  ),
                  PColumnFooter(
                    flex: 2,
                    footer: totalRealizationPerType.isNaN ||
                            totalRealizationPerType.isInfinite
                        ? '0'
                        : totalRealizationPerType.format(),
                  ),
                  PColumnFooter(),
                  PColumnFooter(
                    footer: 'REALISASI',
                  ),
                  PColumnFooter(),
                  PColumnFooter(
                    footer: valueRealizationPerType.isNaN ||
                            valueRealizationPerType.isInfinite
                        ? '0'
                        : valueRealizationPerType.format(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              tableFooter(
                columns: [
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(
                    flex: 2,
                    footer: 'TOTAL SELURUH',
                  ),
                  PColumnFooter(
                    flex: 2,
                    footer: totalQtyAll.format(),
                  ),
                  PColumnFooter(
                    flex: 2,
                    footer: totalQtyDeliveryAll.format(),
                  ),
                  PColumnFooter(
                    flex: 2,
                    footer: 'TOTAL SELURUH',
                  ),
                  PColumnFooter(
                    footer: totalValueSalesOrderAll.format(),
                  ),
                  PColumnFooter(
                    footer: totalValueRealizationAll.format(),
                  ),
                ],
              ),
              tableFooter(
                columns: [
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(
                    flex: 2,
                    footer: 'REALISASI SELURUH',
                  ),
                  PColumnFooter(
                    flex: 2,
                  ),
                  PColumnFooter(
                    flex: 2,
                    footer: totalRealizationPerTypeAll.isNaN ||
                            totalRealizationPerTypeAll.isInfinite
                        ? '0'
                        : totalRealizationPerTypeAll.format(),
                  ),
                  PColumnFooter(
                    flex: 2,
                    footer: 'REALISASI SELURUH',
                  ),
                  PColumnFooter(),
                  PColumnFooter(
                    footer: valueRealizationPerTypeAll.isNaN ||
                            valueRealizationPerTypeAll.isInfinite
                        ? '0'
                        : valueRealizationPerTypeAll.format(),
                  ),
                ],
              ),
            ],
          );
        }).toList(),
      ),
    ],
  );
}
