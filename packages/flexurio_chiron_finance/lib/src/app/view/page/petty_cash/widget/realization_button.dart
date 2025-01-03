import 'package:flexurio_chiron_finance/src/app/bloc/petty_cash/petty_cash_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/petty_cash_query/petty_cash_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_chiron_finance/src/app/model/petty_cash.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/petty_cash_realization/petty_cash_realization_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PettyCashRealizationButton extends StatelessWidget {
  const PettyCashRealizationButton._({
    required this.pettyCash,
    required this.pettyCashBloc,
  });

  static Widget prepare({
    required PettyCash pettyCash,
    required PettyCashBloc pettyCashBloc,
  }) {
    return BlocProvider(
      create: (context) => PettyCashBloc(),
      child: PettyCashRealizationButton._(
        pettyCash: pettyCash,
        pettyCashBloc: pettyCashBloc,
      ),
    );
  }

  final PettyCash pettyCash;
  final PettyCashBloc pettyCashBloc;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.realization;
    return LightButton(
      permission: PermissionFinance.pettyCashRealization,
      action: action,
      onPressed: () async {
        final pettyCashQueryBloc = context.read<PettyCashQueryBloc>();
        final success = await Navigator.push(
          context,
          PettyCashRealizationPage.route(pettyCash: pettyCash),
        );
        if (success ?? false) {
          pettyCashQueryBloc.add(PettyCashQueryEvent.fetchById(pettyCash.id));
          pettyCashBloc.add(PettyCashEvent.initialize(pettyCash));
        }
      },
    );
  }
}
