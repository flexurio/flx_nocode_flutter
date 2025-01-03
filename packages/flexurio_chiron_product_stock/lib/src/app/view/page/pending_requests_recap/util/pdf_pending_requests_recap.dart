import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfPendingRequestsRecap({
  required List<PendingRequestsRecap> data,
  DateTime? startDate,
  DateTime? endDate,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'REKAPITULASI PENDING PER KODE OBAT',
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
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: [
            simpleTablePdf<PendingRequestsRecap>(
              data: data,
              columns: [
                PColumn(
                  title: 'drug_name'.tr(),
                  contentBuilder: (data, index) => data.productName,
                  footer: 'Total',
                ),
                PColumn(
                  title: 'petting'.tr(),
                  contentBuilder: (data, index) {
                    return data.quantityRemaining.format();
                  },
                  footer: data.fold<double>(
                    0, (sum, item) => sum + (item.quantityRemaining),
                  ).format(),
                ),
                PColumn(
                  title: 'remaining_stock'.tr(),
                  contentBuilder: (data, index) {
                    return data.productStockQuantityRemaining.format();
                  },
                ),
                PColumn(
                  title: 'value'.tr(),
                  contentBuilder: (data, index) {
                    return data.totalProductRequestPrice.format();
                  },
                  footer: data.fold<double>(
                    0, (sum, item) => sum + (item.totalProductRequestPrice),
                  ).format(),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
