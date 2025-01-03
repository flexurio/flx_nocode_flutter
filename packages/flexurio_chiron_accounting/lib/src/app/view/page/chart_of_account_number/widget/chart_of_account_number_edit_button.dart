import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartOfAccountNumberEditButton extends StatelessWidget {
  const ChartOfAccountNumberEditButton({
    required this.chartOfAccountNumber,
    super.key,
  });

  final ChartOfAccountNumber chartOfAccountNumber;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionAccounting.chartOfAccountEdit,
      action: DataAction.edit,
      onPressed: () {
        Navigator.push(
          context,
          ChartOfAccountNumberCreatePage.route(
            chartOfAccountNumber: chartOfAccountNumber,
          ),
        ).then((value) {
          if (value ?? false) {
            context
                .read<ChartOfAccountNumberQueryBloc>()
                .add(ChartOfAccountNumberQueryEvent.fetch());
          }
        });
      },
    );
  }
}
