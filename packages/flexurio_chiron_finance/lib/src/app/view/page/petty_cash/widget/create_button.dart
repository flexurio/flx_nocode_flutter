import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PettyCashCreateButton extends StatelessWidget {
  const PettyCashCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionFinance.pettyCashCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<PettyCashQueryBloc>();
        final success = await Navigator.push(
          context,
          PettyCashCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const PettyCashQueryEvent.fetch());
        }
      },
    );
  }
}
