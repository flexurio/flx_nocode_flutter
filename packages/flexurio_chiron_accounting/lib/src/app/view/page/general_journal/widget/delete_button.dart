import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionJournalAccountingDeleteButton extends StatelessWidget {
  const TransactionJournalAccountingDeleteButton({
    required this.transactionJournalAccounting,
    super.key,
  });

  final TransactionJournalAccounting transactionJournalAccounting;

  static Widget prepare({
    required TransactionJournalAccounting transactionJournalAccounting,
  }) {
    return BlocProvider(
      create: (context) => TransactionJournalAccountingBloc(),
      child: TransactionJournalAccountingDeleteButton(
        transactionJournalAccounting: transactionJournalAccounting,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.delete;
    return IconButtonSmall(
      permission: PermissionAccounting.transactionJournalAccountingDelete,
      action: action,
      onPressed: () async {
        final bloc = context.read<TransactionJournalAccountingBloc>();
        final queryBloc = context.read<TransactionJournalAccountingQueryBloc>();
        await _showDeleteDialog(
          context: context,
          bloc: bloc,
          action: action,
        ).then((value) {
          if (value ?? false) {
            queryBloc.add(const TransactionJournalAccountingQueryEvent.fetch(
                generals: true));
          }
        });
      },
    );
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required TransactionJournalAccountingBloc bloc,
    required DataAction action,
  }) {
    final entity = Entity.transactionJournalAccounting;
    return showDialog<bool?>(
      context: context,
      builder: (context) {
        return BlocListener<TransactionJournalAccountingBloc,
            TransactionJournalAccountingState>(
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
          child: BlocBuilder<TransactionJournalAccountingBloc,
              TransactionJournalAccountingState>(
            bloc: bloc,
            builder: (context, state) {
              return CardConfirmation(
                isProgress: state.maybeWhen(
                  orElse: () => false,
                  loading: () => true,
                ),
                action: action,
                data: entity,
                label: transactionJournalAccounting.transactionNo,
                onConfirm: () => bloc.add(
                  TransactionJournalAccountingEvent.deleteByTransactionNo(
                    transactionJournalAccounting: transactionJournalAccounting,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
