import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_routine/transaction_routine_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_routine_query/transaction_routine_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_routine.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionRouteNotActiveButton extends StatelessWidget {
  const TransactionRouteNotActiveButton({
    required this.transactionRoutine,
    super.key,
  });

  static Widget prepare({
    required TransactionRoutine transactionRoutine,
  }) {
    return BlocProvider(
      create: (context) => TransactionRoutineBloc(),
      child: TransactionRouteNotActiveButton(
        transactionRoutine: transactionRoutine,
      ),
    );
  }

  final TransactionRoutine transactionRoutine;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.notActive;
    final entity = Entity.transactionRoutine;
    final deleteBloc = context.read<TransactionRoutineBloc>();
    final queryBloc = context.read<TransactionRoutineQueryBloc>();
    const queryEvent = TransactionRoutineQueryEvent.fetch();
    return IconButtonSmall(
      permission: Permission.transactionRoutineEdit,
      action: action,
      onPressed: () {
        _showDeleteDialog(context, deleteBloc).then((value) {
          if (value ?? false) {
            Toast(context).success(Message.successDeleted(entity));
            queryBloc.add(queryEvent);
          }
        });
      },
    );
  }

  Future<bool?> _showDeleteDialog(
    BuildContext context,
    TransactionRoutineBloc bloc,
  ) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.notActive;
        final entity = Entity.transactionRoutine;
        return BlocListener<TransactionRoutineBloc, TransactionRoutineState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              error: (error) => Toast(context).fail(error),
              success: () {
                Navigator.pop(context, true);
              },
            );
          },
          child: BlocBuilder<TransactionRoutineBloc, TransactionRoutineState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                orElse: () => false,
                loading: () => true,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: entity,
                label: transactionRoutine.title,
                onConfirm: () {
                  bloc.add(
                    TransactionRoutineEvent.delete(
                      transactionRoutine: transactionRoutine,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
