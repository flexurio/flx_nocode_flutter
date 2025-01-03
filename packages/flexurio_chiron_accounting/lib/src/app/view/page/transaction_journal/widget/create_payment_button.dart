import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCreateButton extends StatelessWidget {
  const PaymentCreateButton({super.key, this.paymentType, this.customer});

  final PaymentType? paymentType;
  final Customer? customer;

  @override
  Widget build(BuildContext context) {
    return Button.small(
      key: ValueKey(DateTime.now().microsecondsSinceEpoch),
      permission: Permission.paymentCreate,
      action: DataAction.paymentReceivable,
      onPressed: () async {
        final queryBloc = context.read<TransactionPaymentQueryBloc>();
        final success = await Navigator.push(
          context,
          PaymentCreatePage.route(
            transactionType: TransactionJournalType.receivable,
            payment: TransactionPayment.empty(),
            paymentType: paymentType,
            customer: customer,
          ),
        );
        if (success ?? false) {
          queryBloc.add(const TransactionPaymentQueryEvent.fetch());
        }
      },
    );
  }
}
