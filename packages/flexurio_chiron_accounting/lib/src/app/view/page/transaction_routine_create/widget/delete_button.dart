import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_routine/transaction_routine_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_routine.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class TransactionRoutineDetailFromLocalDeleteButton extends StatelessWidget {
  const TransactionRoutineDetailFromLocalDeleteButton({
    required this.detail,
    required this.bloc,
    super.key,
  });

  final TransactionRoutineDetail detail;
  final TransactionRoutineBloc bloc;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.transactionRoutineDelete,
      action: DataAction.delete,
      onPressed: () => _showConfirmationDialog(context),
    );
  }

  Future<bool?> _showConfirmationDialog(BuildContext context) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return CardConfirmation(
          isProgress: false,
          action: action,
          data: Entity.productRequestDetail,
          label: detail.unique,
          onConfirm: () {
            bloc.add(TransactionRoutineEvent.remove(detail.unique!));
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
