import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionOrderUpdateButton extends StatelessWidget {
  const ProductionOrderUpdateButton(
      {required this.productionOrder, required this.isExternal, super.key,});
  final bool isExternal;
  final ProductionOrder productionOrder;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProduction.productionOrderEdit(isExternal: isExternal),
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = context.read<ProductionOrderQueryBloc>();
        final success = await Navigator.push(
          context,
          ProductionOrderCreatePage.route(
            productOrder: productionOrder,
            isExternal: isExternal,
          ),
        );
        if (success ?? false) {
          queryBloc.add(const ProductionOrderQueryEvent.fetch());
        }
      },
    );
  }
}
