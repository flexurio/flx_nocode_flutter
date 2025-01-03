import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartOfAccountGroupEditButton extends StatelessWidget {
  const ChartOfAccountGroupEditButton({
    required this.chartOfAccountGroup,
    super.key,
  });

  final ChartOfAccountGroup chartOfAccountGroup;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionAccounting.chartOfAccountGroupEdit,
      action: DataAction.edit,
      onPressed: () {
        Navigator.push(
          context,
          ChartOfAccountGroupCreatePage.route(
            chartOfAccountGroup: chartOfAccountGroup,
          ),
        ).then((value) {
          if (value ?? false) {
            context
                .read<ChartOfAccountGroupQueryBloc>()
                .add(ChartOfAccountGroupQueryEvent.fetch());
          }
        });
      },
    );
  }
}
