import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/model/entity.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_recap_by_sales_global_special.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfInvoiceRecapBySalesGlobalSpecial({
  required List<InvoiceRecapBySalesGlobalSpecial> data,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  return pdfTemplate(
    printedBy: printedBy,
    headerTitle:
        '${EntityFinance.invoiceRecapByType.title} - ${'sales_global_special'.tr()}',
    build: (context) => [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: simpleTablePdf<InvoiceRecapBySalesGlobalSpecial>(
          data: data,
          columns: [
            PColumn(
              primary: true,
              title: 'debtor'.tr(),
              contentBuilder: (data, index) => data.customer,
              footer: 'total'.tr(),
            ),
            PColumn(
              title: 'sale'.tr(),
              numeric: true,
              contentBuilder: (data, index) => data.subtotal.format(),
              footer: data.first.subtotalSummary.format(),
            ),
            PColumn(
              title: 'discount'.tr(),
              numeric: true,
              contentBuilder: (data, index) => data.discountValue.format(),
              footer: data.first.discountValueSummary.format(),
            ),
            PColumn(
              title: 'special_discount'.tr(),
              numeric: true,
              contentBuilder: (data, index) =>
                  data.additionalDiscountValue.format(),
              footer: data.first.additionalDiscountValueSummary.format(),
            ),
            PColumn(
              title: 'ppn'.tr(),
              numeric: true,
              contentBuilder: (data, index) => data.ppnValue.format(),
              footer: data.first.ppnValueSummary.format(),
            ),
            PColumn(
              title: 'pph22'.tr(),
              numeric: true,
              contentBuilder: (data, index) => data.pph22Value.format(),
              footer: data.first.pph22ValueSummary.format(),
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
