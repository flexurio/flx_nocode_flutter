import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/model/entity.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_recap_by_sales_global.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfInvoiceRecapBySalesGlobal({
  required List<InvoiceRecapBySalesGlobal> data,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  return pdfTemplate(
    printedBy: printedBy,
    headerTitle:
        '${EntityFinance.invoiceRecapByType.title} - ${'sales_global'.tr()}',
    build: (context) => [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: simpleTablePdf<InvoiceRecapBySalesGlobal>(
          data: data,
          columns: [
            PColumn(
              primary: true,
              title: 'debtor'.tr(),
              contentBuilder: (data, index) => data.customerDeliveryAddress,
              footer: 'total'.tr(),
            ),
            PColumn(
              title: 'sale'.tr(),
              numeric: true,
              contentBuilder: (data, index) => data.subtotal.format(),
              footer: data.first.subtotalTransactionType.format(),
            ),
            PColumn(
              title: 'discount'.tr(),
              numeric: true,
              contentBuilder: (data, index) => data.discountValue.format(),
              footer: data.first.discountValueTransactionType.format(),
            ),
            PColumn(
              title: 'additional_discount'.tr(),
              numeric: true,
              contentBuilder: (data, index) =>
                  data.additionalDiscountValue.format(),
              footer:
                  data.first.additionalDiscountValueTransactionType.format(),
            ),
            PColumn(
              title: 'ppn'.tr(),
              numeric: true,
              contentBuilder: (data, index) => data.ppnValue.format(),
              footer: data.first.ppnValueSummary.format(),
            ),
            PColumn(
              title: 'receivables'.tr(),
              numeric: true,
              contentBuilder: (data, index) => data.total.format(),
              footer: data.first.totalSummary.format(),
            ),
          ],
        ),
      ),
    ],
  );
}
