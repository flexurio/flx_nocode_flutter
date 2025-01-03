import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionServiceOrderCreateButton extends StatelessWidget {
  const ProductionServiceOrderCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      permission: PermissionProduction.productionServiceOrderCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<ProductionServiceOrderQueryBloc>();
        final success = await Navigator.push(
          context,
          ProductionServiceOrderCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const ProductionServiceOrderQueryEvent.fetch());
        }
      },
    );
  }
}
