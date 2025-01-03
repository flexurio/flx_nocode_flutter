import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_routine_query/transaction_routine_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_routine_create/transaction_routine_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionRoutineCreateButton extends StatelessWidget {
  const TransactionRoutineCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    return Button.small(
      permission: Permission.transactionRoutineCreate,
      action: action,
      onPressed: () async {
        final queryBloc = context.read<TransactionRoutineQueryBloc>();
        const queryEvent = TransactionRoutineQueryEvent.fetch(active: '1');
        final success = await Navigator.push(
          context,
          TransactionRoutineCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(queryEvent);
        }
      },
    );
  }
}
