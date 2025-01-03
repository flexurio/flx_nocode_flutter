import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionViewButton extends StatelessWidget {
  const TransactionViewButton({
    required this.payment,
    super.key,
  });

  final TransactionPayment payment;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.paymentViewMenu,
      action: DataAction.viewJournal,
      onPressed: () {
        Navigator.push(
          context,
          TransactionViewPage.route(payment: payment),
        ).then((value) {
          if (value ?? false) {
            context.read<TransactionPaymentQueryBloc>().add(
                  const TransactionPaymentQueryEvent.fetch(),
                );
          }
        });
      },
    );
  }
}
