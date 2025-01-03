import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionLineUpdateButton extends StatelessWidget {
  const ProductionLineUpdateButton({required this.productionLine, super.key});

  final ProductionLine productionLine;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProduction.productionLineEdit,
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = context.read<ProductionLineQueryBloc>();
        final success = await Navigator.push(
          context,
          ProductionLineCreatePage.route(productionLine: productionLine),
        );
        if (success ?? false) {
          queryBloc.add(const ProductionLineQueryEvent.get());
        }
      },
    );
  }
}
