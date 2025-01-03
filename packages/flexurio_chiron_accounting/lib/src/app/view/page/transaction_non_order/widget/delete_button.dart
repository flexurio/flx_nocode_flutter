import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_non_order/transaction_non_order_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_non_order_query/transaction_non_order_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_non_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionNonOrderDeleteButton extends StatelessWidget {
  const TransactionNonOrderDeleteButton({
    required this.transactionNonOrder,
    super.key,
  });

  final TransactionNonOrder transactionNonOrder;

  static Widget prepare({
    required TransactionNonOrder transactionNonOrder,
  }) {
    return BlocProvider(
      create: (context) => TransactionNonOrderBloc(),
      child: TransactionNonOrderDeleteButton(
        transactionNonOrder: transactionNonOrder,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.transactionNonOrderDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<TransactionNonOrderBloc>();
        final queryBloc = context.read<TransactionNonOrderQueryBloc>();
        final success = await _showDeleteDialog(
          context: context,
          bloc: bloc,
        );
        if (success ?? false) {
          queryBloc.add(const TransactionNonOrderQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required TransactionNonOrderBloc bloc,
  }) {
    final entity = Entity.transactionNonOrder;
    const action = DataAction.delete;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<TransactionNonOrderBloc, TransactionNonOrderState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, entity);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<TransactionNonOrderBloc, TransactionNonOrderState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: entity,
                label: transactionNonOrder.transactionNo,
                onConfirm: () {
                  bloc.add(
                    TransactionNonOrderEvent.delete(
                      transactionNonOrder: transactionNonOrder,
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
