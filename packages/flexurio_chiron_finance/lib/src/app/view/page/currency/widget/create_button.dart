import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionFinance.currencyCreate,
      action: DataAction.create,
      onPressed: () {
        Navigator.push(
          context,
          CurrencyCreatePage.route(),
        ).then((currency) {
          final queryBloc = context.read<CurrencyQueryBloc>();
          if (currency?.offline != null) {
            queryBloc.add(const CurrencyQueryEvent.fetch());
          } else {
            queryBloc.add(const CurrencyQueryEvent.fetch());
          }
        });
      },
    );
  }
}
