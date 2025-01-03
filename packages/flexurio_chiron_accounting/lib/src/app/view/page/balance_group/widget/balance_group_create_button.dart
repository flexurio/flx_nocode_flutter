import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BalanceGroupCreateButton extends StatelessWidget {
  const BalanceGroupCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionAccounting.balanceGroupCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<BalanceGroupQueryBloc>();
        final success = await Navigator.push(
          context,
          BalanceGroupCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const BalanceGroupQueryEvent.fetch());
        }
      },
    );
  }
}
