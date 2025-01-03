import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/model/entity.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receipt.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/widgets.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);

Future<Page> pdfInvoiceReceipt({
  required List<InvoiceReceipt> data,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: EntityFinance.invoiceReceipt.title,
    build: (context) => [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: simpleTablePdf<InvoiceReceipt>(
          data: data,
          columns: [
            PColumn(
              title: 'tax_invoice_number'.tr(),
              primary: true,
              contentBuilder: (data, index) => data.taxInvoiceNumber,
            ),
            PColumn(
              title: 'date'.tr(),
              contentBuilder: (data, index) => data.date.ddMMyyyy,
            ),
            PColumn(
              title: 'sales_order'.tr(),
              contentBuilder: (data, index) => data.orderId,
            ),
            PColumn(
              title: 'invoice'.tr(),
              contentBuilder: (data, index) => data.taxInvoice ?? '',
            ),
            PColumn(
              title: 'pbf_name'.tr(),
              contentBuilder: (data, index) => data.deliveryAddress ?? '',
            ),
            PColumn(
              title: 'amount'.tr(),
              numeric: true,
              contentBuilder: (data, index) => data.total.format(),
            ),
          ],
        ),
      ),
    ],
  );
}
