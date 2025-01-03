import 'package:flexurio_chiron_accounting/src/app/model/payment_detail_receivable.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ReviewFormPaymentsTable extends StatelessWidget {
  const ReviewFormPaymentsTable({
    required this.paymentDetail,
    super.key,
  });

  final List<PaymentDetailReceivable> paymentDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YuhuTable<PaymentDetailReceivable>(
          columns: [
            TableColumn(
              title: 'transaction_id'.tr(),
              builder: (transaction, _) {
                return Text(transaction.transactionId);
              },
            ),
            TableColumn(
              title: 'id'.tr(),
              builder: (transaction, _) {
                return Text(transaction.chartOfAccountName ?? '');
              },
            ),
            TableColumn(
              title: 'amount'.tr(),
              alignment: Alignment.centerRight,
              builder: (transaction, _) {
                return Text(transaction.amount.format());
              },
            ),
          ],
          data: paymentDetail,
        ),
      ],
    );
  }
}
