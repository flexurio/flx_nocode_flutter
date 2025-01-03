import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/model/payment_settlement_return.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/widgets.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);

Future<Page> pdfPaymentSettlementReturn({
  required List<PaymentSettlementReturn> data,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  return pdfTemplate(
    orientation: PageOrientation.landscape,
    printedBy: printedBy,
    headerTitle: 'payment_settlement_return'.tr(),
    build: (context) => [
      Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 36,
        ),
        child: simpleTablePdf<PaymentSettlementReturn>(
          data: data,
          columns: [
            PColumn(
              title: 'invoice'.tr(),
              primary: true,
              contentBuilder: (data, index) => data.invoiceId,
            ),
            PColumn(
              title: 'batch'.tr(),
              contentBuilder: (data, index) => data.batchNoId,
            ),
            PColumn(
              title: 'tax_invoice_number'.tr(),
              contentBuilder: (data, index) => data.taxInvoiceNo,
            ),
            PColumn(
              title: 'customer_id'.tr(),
              contentBuilder: (data, index) => data.customerId,
            ),
            PColumn(
              title: 'product'.tr(),
              contentBuilder: (data, index) => data.productName,
            ),
            PColumn(
              title: 'price'.tr(),
              contentBuilder: (data, index) => data.price.toString(),
            ),
            PColumn(
              title: 'quantity'.tr(),
              contentBuilder: (data, index) => data.quantity.toString(),
            ),
            PColumn(
              title: 'discount'.tr(),
              contentBuilder: (data, index) => data.discountPercent.toString(),
            ),
          ],
        ),
      ),
    ],
  );
}
