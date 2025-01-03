import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_type/transaction_type_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_type_query/transaction_type_query_bloc.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionTypeDeleteButton extends StatelessWidget {
  const TransactionTypeDeleteButton({
    required this.id,
    super.key,
  });

  static Widget prepare({
    required String id,
  }) {
    return BlocProvider(
      create: (context) => TransactionTypeBloc(),
      child: TransactionTypeDeleteButton(
        id: id,
      ),
    );
  }

  final String id;
  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionFinance.transactionTypeDelete,
      action: DataAction.delete,
      onPressed: () {
        final bloc = context.read<TransactionTypeBloc>();
        final queryBloc = context.read<TransactionTypeQueryBloc>();
        _showDeleteDialog(context, bloc).then((value) {
          const action = DataAction.delete;
          final entity = Entity.transactionType;
          if (value ?? false) {
            queryBloc
                .add(const TransactionTypeQueryEvent.fetch(name: '', flag: ''));
          }
          return () {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          };
        });
      },
    );
  }

  Future<bool?> _showDeleteDialog(
    BuildContext context,
    TransactionTypeBloc bloc,
  ) {
    const action = DataAction.delete;
    final entity = Entity.transactionType;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<TransactionTypeBloc, TransactionTypeState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context)
                    .dataChanged(DataAction.delete, Entity.transactionType);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<TransactionTypeBloc, TransactionTypeState>(
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
                label: id,
                onConfirm: () {
                  bloc.add(TransactionTypeEvent.delete(id: id));
                },
              );
            },
          ),
        );
      },
    );
  }
}
