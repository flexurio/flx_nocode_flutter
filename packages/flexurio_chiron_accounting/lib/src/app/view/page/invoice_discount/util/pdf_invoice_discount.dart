import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/model/invoice_discount.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/widgets.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);

Future<Page> pdfInvoiceDiscount({
  required List<InvoiceDiscount> data,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: EntityAccounting.invoiceDiscount.title,
    build: (context) => [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: simpleTablePdf<InvoiceDiscount>(
          data: data,
          columns: [
            PColumn(
              title: 'invoice'.tr(),
              contentBuilder: (data, index) => data.transactionId ?? '',
              footer: 'Total',
              primary: true,
            ),
            PColumn(
              title: 'transaction_date'.tr(),
              contentBuilder: (data, index) => data.transactionDate ?? '',
            ),
            PColumn(
              title: 'tax_invoice_number'.tr(),
              contentBuilder: (data, index) => data.taxInvoiceNumber ?? '',
            ),
            PColumn(
              title: 'sale'.tr(),
              footer: data.isEmpty ? null : data.first.subtotal?.format(),
              numeric: true,
              contentBuilder: (data, index) => data.subtotal?.format() ?? '',
            ),
            PColumn(
              title: 'discount_amount'.tr(),
              footer: data.isEmpty ? null : data.first.discountValue?.format(),
              numeric: true,
              contentBuilder: (data, index) =>
                  data.discountValue?.format() ?? '',
            ),
            PColumn(
              title: 'ppn_amount'.tr(),
              footer: data.isEmpty ? null : data.first.ppnValue?.format(),
              numeric: true,
              contentBuilder: (data, index) => data.ppnValue?.format() ?? '',
            ),
            PColumn(
              title: 'receivables'.tr(),
              footer: data.isEmpty ? null : data.first.total?.format(),
              numeric: true,
              contentBuilder: (data, index) => data.total?.format() ?? '',
            ),
          ],
        ),
      ),
    ],
  );
}
