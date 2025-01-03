import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartOfAccountGroupCreateButton extends StatelessWidget {
  const ChartOfAccountGroupCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionAccounting.chartOfAccountGroupCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<ChartOfAccountGroupQueryBloc>();
        final event = ChartOfAccountGroupQueryEvent.fetch();
        final success = await Navigator.push(
          context,
          ChartOfAccountGroupCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(event);
        }
      },
    );
  }
}
