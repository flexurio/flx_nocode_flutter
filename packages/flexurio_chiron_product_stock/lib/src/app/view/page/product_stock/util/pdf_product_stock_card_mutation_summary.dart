import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfProductStockCardMutationSummary({
  required List<ProductStock> data,
  DateTime? startDate,
  DateTime? endDate,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

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
            'PERIODE : ${DateFormat('yyyyMMdd').format(startDate ?? DateTime.now())} S/D ${DateFormat('yyyyMMdd').format(endDate ?? DateTime.now())}',
          ),
        ],
      ),
    ),
    build: (context) => [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: [
            simpleTablePdf<ProductStock>(
              data: data,
              columns: [
                PColumn(
                  title: 'product'.tr(),
                  contentBuilder: (data, index) => data.product.name,
                ),
                PColumn(
                  title: 'unit'.tr(),
                  contentBuilder: (data, index) => data.unit.id,
                ),
                PColumn(
                  title: 'beginning_balance'.tr(),
                  contentBuilder: (data, index) => data.beginningBalance.format(),
                ),
                PColumn(
                  title: 'qty_in'.tr(),
                  contentBuilder: (data, index) => data.qtyIn.format(),
                ),
                PColumn(
                  title: 'qty_out'.tr(),
                  contentBuilder: (data, index) => data.qtyOut.format(),
                ),
                PColumn(
                  title: 'qty_remaining'.tr(),
                  contentBuilder: (data, index) => data.qtyOutMarketing.format(),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
