import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentViewButton extends StatelessWidget {
  const PaymentViewButton({
    required this.payment,
    super.key,
  });

  final TransactionPayment payment;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.paymentViewMenu,
      action: DataAction.viewPayment,
      onPressed: () {
        if (payment.paymentId != null && payment.paymentId != '') {
          Navigator.push(
            context,
            PaymentViewPage.route(payment: payment),
          ).then((value) {
            if (value ?? false) {
              context.read<TransactionPaymentQueryBloc>().add(
                    const TransactionPaymentQueryEvent.fetch(),
                  );
            }
          });
        } else {
          Toast(context).fail('Payment ID is Empty');
        }
      },
    );
  }
}
