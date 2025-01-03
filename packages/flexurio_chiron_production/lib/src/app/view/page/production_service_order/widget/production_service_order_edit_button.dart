import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionServiceOrderEditButton extends StatelessWidget {
  const ProductionServiceOrderEditButton({
    required this.productionServiceOrder,
    super.key,
  });

  final ProductionServiceOrder productionServiceOrder;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProduction.productionServiceOrderEdit,
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = context.read<ProductionServiceOrderQueryBloc>();
        final success = await Navigator.push(
          context,
          ProductionServiceOrderCreatePage.route(
            productionServiceOrder: productionServiceOrder,
          ),
        );
        if (success ?? false) {
          queryBloc.add(const ProductionServiceOrderQueryEvent.fetch());
        }
      },
    );
  }
}
