import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_stock_card_batch.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfProductStockCardBatch({
  required List<ProductStockCardBatch> data,
  DateTime? startDate,
  DateTime? endDate,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'LAPORAN REKAPITULASI STOK BARANG JADI',
    pageFormat: PdfPageFormat.a3.landscape.copyWith(
      width: 50 * PdfPageFormat.cm,
    ),
    headerChild: Padding(
      padding: const EdgeInsets.only(right: 36, left: 36, bottom: 10),
      child: Column(
        children: [
          Text(
            'Periode : ${DateFormat('yyyyMMdd').format(startDate ?? DateTime.now())} S/D ${DateFormat('yyyyMMdd').format(endDate ?? DateTime.now())}',
          ),
          Text('ASAMNEX TABLET'),
        ],
      ),
    ),
    build: (context) => [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: [
            simpleTablePdf<ProductStockCardBatch>(
              data: data,
              columns: [
                PColumn(
                  title: 'date'.tr(),
                  contentBuilder: (data, index) => data.date.ddMMyyyySlash,
                ),
                PColumn(
                  title: 'transaction_no'.tr(),
                  contentBuilder: (data, index) => data.transactionId,
                ),
                PColumn(
                  title: 'batch'.tr(),
                  contentBuilder: (data, index) => data.batchNo,
                ),
                PColumn(
                  title: 'in'.tr(),
                  contentBuilder: (data, index) => data.beginningBalance.format(),
                  footer: 'SaldoAkhir',
                ),
                PColumn(
                  title: 'out'.tr(),
                  contentBuilder: (data, index) => data.debit.format(),
                ),
                PColumn(
                  title: 'remaining'.tr(),
                  contentBuilder: (data, index) => '${data.credit} ${data.unit}',
                  footer: '${data.fold<double>(
                    0, (sum, item) => sum + (item.credit),
                  ).format()} ${data.first.unit}',
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
