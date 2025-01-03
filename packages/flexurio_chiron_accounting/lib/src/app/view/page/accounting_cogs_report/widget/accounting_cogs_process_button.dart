import 'package:flexurio_chiron_accounting/src/app/view/page/accounting_cogs_report/widget/accounting_cogs_process_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class AccountingCogsProcessButton extends StatelessWidget {
  const AccountingCogsProcessButton({super.key});

  @override
  Widget build(BuildContext context) {
    const action = DataAction.reprocess;
    final entity = Entity.cogs;
    return IconButton(
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return AccountingCogsProcessForm.prepare();
          },
        ).then((value) {
          if (value ?? false) {
            Toast(context).dataChanged(action, entity);
          }
        });
      },
      icon: Icon(action.icon),
      tooltip: entity.title,
    );
  }
}
