import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionJournalAccountingCreateButton extends StatelessWidget {
  const TransactionJournalAccountingCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button.small(
      action: DataAction.create,
      permission: PermissionAccounting.transactionJournalAccountingCreate,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) =>
                TransactionJournalAccountingCreatePage.prepare(),
          ),
        ).then((value) {
          if (value ?? false) {
            context.read<TransactionJournalAccountingQueryBloc>().add(
                const TransactionJournalAccountingQueryEvent.fetch(
                    generals: true));
          }
        });
      },
    );
  }
}
