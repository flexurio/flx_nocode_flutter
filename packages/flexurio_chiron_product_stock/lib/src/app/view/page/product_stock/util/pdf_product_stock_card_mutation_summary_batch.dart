import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfProductStockCardMutationSummaryBatch({
  required List<ProductStock> data,
  DateTime? startDate,
  DateTime? endDate,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  final groupByTypeProduct = groupBy<ProductStock>(
    data,
    (element) => element.product.id,
  ).entries;

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'LAPORAN MUTASI STOK BARANG JADI',
    pageFormat: PdfPageFormat.a3.landscape.copyWith(
      width: 50 * PdfPageFormat.cm,
    ),
    headerChild: Padding(
      padding: const EdgeInsets.only(right: 36, left: 36, bottom: 10),
      child: Column(
        children: [
          Text(
            'Tanggal : ${DateFormat('yyyyMMdd').format(startDate ?? DateTime.now())}',
          ),
        ],
      ),
    ),
    build: (context) => [
      Column(
        children: groupByTypeProduct.map((data) {
          final totalQtyOutMarketing = data.value.fold<double>(
            0,
            (sum, item) => sum + item.qtyOutMarketing,
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: PdfColors.blueGrey200),
              tableHeader(
                hasChildren: true,
                columns: [
                  PColumnHeader(
                    title: 'product'.tr(),
                    primary: true,
                  ),
                  PColumnHeader(
                    title: 'expired_date'.tr(),
                  ),
                  PColumnHeader(
                    title: 'unit'.tr(),
                  ),
                  PColumnHeader(
                    title: 'beginning_balance'.tr(),
                  ),
                  PColumnHeader(title: 'qty_in'.tr()),
                  PColumnHeader(
                    title: 'qty_out'.tr(),
                  ),
                  PColumnHeader(
                    title: 'qty_remaining'.tr(),
                  ),
                  PColumnHeader(
                    title: 'no_batch'.tr(),
                  ),
                ],
              ),
              ...List.generate(data.value.length, (index) {
                return tableBody<ProductStock>(
                  data: data.value.sublist(0, 1).toList(),
                  columns: [
                    PColumnBody(
                      contentBuilder: (data, index) =>
                          data.product.id + ' - ' + data.product.name,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.expiredDate.yMMMM,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.unit.id,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) =>
                          data.beginningBalance.format(),
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.qtyIn.format(),
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.qtyOut.format(),
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) =>
                          data.qtyOutMarketing.format(),
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.batch.id,
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
                  PColumnFooter(
                    footer: 'TOTAL',
                  ),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(
                    footer: totalQtyOutMarketing.format(),
                  ),
                  PColumnFooter(
                    footer: data.value.first.unit.id,
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
