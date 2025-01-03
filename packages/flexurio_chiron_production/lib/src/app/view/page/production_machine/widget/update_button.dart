import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionMachineUpdateButton extends StatelessWidget {
  const ProductionMachineUpdateButton({
    required this.productionMachine,
    super.key,
  });

  final ProductionMachine productionMachine;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProduction.productionMachineEdit,
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = context.read<ProductionMachineQueryBloc>();
        final success = await Navigator.push(
          context,
          ProductionMachineCreatePage.route(
            productionMachine: productionMachine,
          ),
        );
        if (success ?? false) {
          queryBloc.add(const ProductionMachineQueryEvent.get());
        }
      },
    );
  }
}
