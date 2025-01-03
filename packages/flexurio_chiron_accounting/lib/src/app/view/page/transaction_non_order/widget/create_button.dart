import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_non_order_query/transaction_non_order_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_non_order_create/transaction_non_order_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionNonOrderCreateButton extends StatelessWidget {
  const TransactionNonOrderCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      action: DataAction.create,
      onPressed: () {
        Navigator.push(
          context,
          TransactionNonOrderCreatePage.route(),
        ).then((value) {
          if (value ?? false) {
            context
                .read<TransactionNonOrderQueryBloc>()
                .add(const TransactionNonOrderQueryEvent.fetch());
          }
        });
      },
      permission: Permission.transactionNonOrderCreate,
    );
  }
}
