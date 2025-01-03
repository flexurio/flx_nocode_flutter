import 'package:flexurio_chiron_accounting/src/app/view/page/general_journal_view/view_page.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class TransactionJournalAccountingViewButton extends StatelessWidget {
  const TransactionJournalAccountingViewButton({
    required this.transactionJournalAccounting,
    super.key,
  });

  final TransactionJournalAccounting transactionJournalAccounting;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      action: DataAction.view,
      permission: PermissionAccounting.transactionJournalAccountingViewMenu,
      onPressed: () {
        Navigator.push(
          context,
          TransactionJournalAccountingViewPage.route(
            transactionJournalAccounting: transactionJournalAccounting,
          ),
        );
      },
    );
  }
}
