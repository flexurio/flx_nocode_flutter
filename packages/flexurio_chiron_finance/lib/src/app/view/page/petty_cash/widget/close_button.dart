import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PettyCashCloseButton extends StatelessWidget {
  const PettyCashCloseButton._({
    required this.pettyCash,
  });

  static Widget prepare(PettyCash pettyCash) {
    return BlocProvider(
      create: (context) => PettyCashBloc(),
      child: PettyCashCloseButton._(pettyCash: pettyCash),
    );
  }

  final PettyCash pettyCash;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.close;
    return LightButton(
      permission: PermissionFinance.pettyCashClose,
      action: action,
      onPressed: () async {
        final queryBloc = context.read<PettyCashQueryBloc>();
        final success = await Navigator.push(
          context,
          PettyCashClosePage.route(pettyCash: pettyCash),
        );
        if (success ?? false) {
          queryBloc.add(PettyCashQueryEvent.fetchById(pettyCash.id));
        }
      },
    );
  }
}
