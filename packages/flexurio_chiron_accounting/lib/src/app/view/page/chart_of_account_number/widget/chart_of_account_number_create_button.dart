import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartOfAccountNumberCreateButton extends StatelessWidget {
  const ChartOfAccountNumberCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      permission: PermissionAccounting.chartOfAccountCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<ChartOfAccountNumberQueryBloc>();
        final event = ChartOfAccountNumberQueryEvent.fetch();
        final success = await Navigator.push(
          context,
          ChartOfAccountNumberCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(event);
        }
      },
    );
  }
}
