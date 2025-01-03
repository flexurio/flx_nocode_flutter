import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/model/entity.dart';
import 'package:flexurio_chiron_finance/src/app/model/payment_settlement.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/widgets.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);

Future<Page> pdfPaymentSettlement({
  required List<PaymentSettlement> data,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: EntityFinance.paymentSettlement.title,
    build: (context) => [
      simpleTablePdf<PaymentSettlement>(
        data: data,
        columns: [
          PColumn(
            title: 'transaction'.tr(),
            primary: true,
            contentBuilder: (data, index) => data.transactionNo,
          ),
          PColumn(
            title: 'payment'.tr(),
            contentBuilder: (data, index) => data.paymentNo,
          ),
          PColumn(
            title: 'total'.tr(),
            contentBuilder: (data, index) =>
                data.valueTransactionType.toString(),
          ),
          PColumn(
            title: 'transaction_date'.tr(),
            contentBuilder: (data, index) => data.transactionDate.ddMMyyyy,
          ),
          PColumn(
            title: 'customer'.tr(),
            contentBuilder: (data, index) => data.customerName,
          ),
        ],
      ),
    ],
  );
}
