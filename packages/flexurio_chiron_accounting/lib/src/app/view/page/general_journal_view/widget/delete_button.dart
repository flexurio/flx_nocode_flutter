import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralJournalDeleteButton extends StatelessWidget {
  const GeneralJournalDeleteButton._({
    required this.generalJournal,
    required this.onSuccess,
  });

  final void Function() onSuccess;

  static Widget prepare({
    required TransactionJournalAccounting generalJournal,
    required void Function() onSuccess,
  }) {
    return BlocProvider(
      create: (context) => TransactionJournalAccountingBloc(),
      child: GeneralJournalDeleteButton._(
        generalJournal: generalJournal,
        onSuccess: onSuccess,
      ),
    );
  }

  final TransactionJournalAccounting generalJournal;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<TransactionJournalAccountingBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          onSuccess();
        }
      },
      permission: PermissionAccounting.transactionJournalAccountingDelete,
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    TransactionJournalAccountingBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<TransactionJournalAccountingBloc,
            TransactionJournalAccountingState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context)
                    .dataChanged(action, Entity.transactionJournalAccounting);
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
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.transactionJournalAccounting,
                label: generalJournal.transactionNo,
                onConfirm: () {
                  bloc.add(
                    TransactionJournalAccountingEvent.deleteById(
                      transactionJournalAccounting: generalJournal,
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
