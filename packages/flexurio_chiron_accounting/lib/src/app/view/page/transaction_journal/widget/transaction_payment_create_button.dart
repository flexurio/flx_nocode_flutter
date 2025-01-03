import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class TransactionPaymentCreateButton extends StatelessWidget {
  const TransactionPaymentCreateButton({
    required this.payment,
    required this.onSuccess,
    this.paymentType,
    super.key,
  });

  final TransactionPayment payment;
  final void Function() onSuccess;
  final PaymentType? paymentType;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.paymentCreate,
      action: DataAction.paymentPayable,
      onPressed: () async {
        final success = await Navigator.push(
          context,
          PaymentCreatePage.route(
            transactionType: TransactionJournalType.payable,
            payment: payment,
            paymentType: paymentType,
          ),
        );
        if (success ?? false) {
          onSuccess();
        }
      },
    );
  }
}
