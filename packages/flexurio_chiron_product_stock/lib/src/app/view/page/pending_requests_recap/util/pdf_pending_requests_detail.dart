import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfPendingRequestsDetail({
  required List<PendingRequestsDetail> data,
  DateTime? startDate,
  DateTime? endDate,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'REKAPITULASI PENDINGAN DETAIL',
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
            simpleTablePdf<PendingRequestsDetail>(
              data: data,
              columns: [
                PColumn(
                  title: 'No.PO Internal'.tr(),
                  contentBuilder: (data, index) => data.productRequestId,
                ),
                PColumn(
                  title: 'Nama Obat'.tr(),
                  contentBuilder: (data, index) => data.productName,
                ),
                PColumn(
                  title: 'Pendingan'.tr(),
                  contentBuilder: (data, index) {
                    return data.quantityRemaining.format();
                  },
                  footer: data.fold<double>(
                    0, (sum, item) => sum + item.quantityRemaining,
                  ).format(),
                ),
                PColumn(
                  title: 'NoSO'.tr(),
                  contentBuilder: (data, index) => data.salesOrderId ?? '-',
                ),
                PColumn(
                  title: 'Nilai'.tr(),
                  contentBuilder: (data, index) {
                    // data.totalProductRequestPrice * data.quantityRemaining
                    return data.totalProductRequestPrice.format();
                  },
                  footer: data.fold<double>(
                    // 0, (sum, item) => sum + (item.totalProductRequestPrice * item.quantityRemaining),
                    0, (sum, item) => sum + item.totalProductRequestPrice,
                  ).format(),
                ),
                PColumn(
                  title: 'PBF'.tr(),
                  contentBuilder: (data, index) => data.customerId,
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
