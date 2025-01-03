import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionStageCreateButton extends StatelessWidget {
  const ProductionStageCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionProduction.productionStageCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<ProductionStageQueryBloc>();
        final success = await Navigator.push(
          context,
          ProductionStageCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const ProductionStageQueryEvent.fetch());
        }
      },
    );
  }
}
