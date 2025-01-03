import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_stock_mutation_product_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfProductStockMutationProductDetail({
  required List<ProductStockMutationProductDetail> data,
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
            'Tanggal : ${DateFormat('yyyyMMdd').format(startDate ?? DateTime.now())} S/D ${DateFormat('yyyyMMdd').format(endDate ?? DateTime.now())}',
          ),
        ],
      ),
    ),
    build: (context) => [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: [
            simpleTablePdf<ProductStockMutationProductDetail>(
              data: data,
              columns: [
                PColumn(
                  title: 'product'.tr(),
                  contentBuilder: (data, index) => data.productId + '-' + data.productName,
                ),
                PColumn(
                  title: 'Saldo'.tr(),
                  contentBuilder: (data, index) => data.beginningBalance.format(),
                ),
                PColumn(
                  title: 'Unit'.tr(),
                  contentBuilder: (data, index) => data.unit,
                ),
                PColumn(
                  title: 'Masuk'.tr(),
                  contentBuilder: (data, index) => data.qtyIn.format(),
                ),
                PColumn(
                  title: 'Jual'.tr(),
                  contentBuilder: (data, index) => data.qtyOut.format(),
                ),
                PColumn(
                  title: 'Ganti'.tr(),
                  contentBuilder: (data, index) => data.qtyOutReturn.format(),
                ),
                PColumn(
                  title: 'Lain-Lain'.tr(),
                  contentBuilder: (data, index) => data.qtyOutAnother.format(),
                ),
                PColumn(
                  title: 'Sisa'.tr(),
                  contentBuilder: (data, index) => data.endingBalance.format(),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
