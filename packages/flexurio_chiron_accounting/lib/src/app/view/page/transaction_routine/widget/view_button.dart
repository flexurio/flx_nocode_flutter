import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_routine_query/transaction_routine_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_routine.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_routine/widget/transaction_routine_view.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionRoutineViewButton extends StatelessWidget {
  const TransactionRoutineViewButton({
    required this.transactionRoutine,
    super.key,
  });

  final TransactionRoutine transactionRoutine;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.view;
    return IconButtonSmall(
      permission: Permission.transactionRoutineViewMenu,
      action: action,
      onPressed: () async {
        final queryBloc = context.read<TransactionRoutineQueryBloc>();
        const queryEvent = TransactionRoutineQueryEvent.fetch(active: '1');
        final success = await Navigator.push(
          context,
          TransactionRoutineViewPage.route(
            transactionRoutine: transactionRoutine,
          ),
        );
        if (success ?? false) {
          queryBloc.add(queryEvent);
        }
      },
    );
  }
}
