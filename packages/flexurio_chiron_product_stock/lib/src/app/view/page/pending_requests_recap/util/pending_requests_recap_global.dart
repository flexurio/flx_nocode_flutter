import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/pending_requests_recap_global.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfPendingRequestsRecapGlobal({
  required List<PendingRequestsRecapGlobal> data,
  DateTime? startDate,
  DateTime? endDate,
}) async {

  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  final groupByProduct = groupBy<PendingRequestsRecapGlobal>(
    data,
    (element) => element.productId,
  ).entries;

  final totalQuantityRemainingProductAll = data.fold<double>(
    0, (sum, item) => sum + item.quantityRemainingSummary,
  );

  final totalPriceProductAll = data.fold<double>(
    0, (sum, item) => sum + item.totalPriceSummary,
  );

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'REKAPITULASI PENDINGAN GLOBAL - PERIODE : ${startDate?.ddMMyyyySlash ?? DateTime.now().ddMMyyyySlash} S/D ${endDate?.ddMMyyyySlash ?? DateTime.now().ddMMyyyySlash}',
    pageFormat: PdfPageFormat.a3.landscape.copyWith(
      width: 50 * PdfPageFormat.cm,
    ),
    orientation: PageOrientation.landscape,
    build: (context) => [
      Column(
        children: groupByProduct.map((data) {
          final totalQuantityRemainingProduct = data.value.fold<double>(
            0, (sum, item) => sum + (item.quantityRemainingProduct ?? 0),
          );
          final totalPriceProduct = data.value.fold<double>(
            0, (sum, item) => sum + (item.totalPriceProduct ?? 0),
          );
          
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: PdfColors.blueGrey200),
              tableHeader(
                  hasChildren: true,
                  columns: [
                    PColumnHeader(
                      title: 'Nama Obat'.tr(),
                      primary: true,
                    ),
                    PColumnHeader(
                      title: 'PBF'.tr(),
                    ),
                    PColumnHeader(
                      title: 'Pendingan'.tr(),
                    ),
                    PColumnHeader(
                      title: 'Sisa Stok'.tr(),
                    ),
                    PColumnHeader(
                      title: 'Nilai'.tr(),
                    ),
                  ],
                ),
              ...List.generate(data.value.length, (index) {
                return tableBody<PendingRequestsRecapGlobal>(
                  data: data.value.sublist(0, 1).toList(),
                  columns: [
                    PColumnBody(
                      contentBuilder: (data, index) => data.productName,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.customerId,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.quantityStock.format(),
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.quantityRemaining.format(),
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.totalPrice.format(),
                    ),
                  ],
                );
              }),
              SizedBox(height: 10),
              tableFooter(
                columns: [
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(
                    footer: 'SUBTOTAL: '
                  ),
                  PColumnFooter(
                    flex: 2,
                    footer: totalQuantityRemainingProduct.format(),
                  ),
                  PColumnFooter(borderTransparent: true),
                  PColumnFooter(
                    footer: totalPriceProduct.format(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              tableFooter(
                columns: [
                  PColumnFooter(
                    borderTransparent: true
                  ),
                  PColumnFooter(
                    footer: 'REALISASI SELURUH',
                  ),
                  PColumnFooter(
                    flex: 2,
                  ),
                  PColumnFooter(
                    flex: 2,
                    footer: totalQuantityRemainingProductAll.format(),
                  ),
                  PColumnFooter(),
                  PColumnFooter(
                    footer: totalPriceProductAll.format(),
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
