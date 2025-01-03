import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionLineCreateButton extends StatelessWidget {
  const ProductionLineCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      permission: PermissionProduction.productionLineCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<ProductionLineQueryBloc>();
        final success = await Navigator.push(
          context,
          ProductionLineCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const ProductionLineQueryEvent.get());
        }
      },
    );
  }
}
