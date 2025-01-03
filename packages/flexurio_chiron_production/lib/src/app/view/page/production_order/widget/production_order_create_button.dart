import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionOrderCreateButton extends StatelessWidget {
  const ProductionOrderCreateButton({required this.isExternal, super.key});
  final bool isExternal;


  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionProduction.productionOrderCreate(isExternal: isExternal),
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<ProductionOrderQueryBloc>();
        final success = await Navigator.push(
          context,
          ProductionOrderCreatePage.route(isExternal: isExternal),
        );
        if (success ?? false) {
          queryBloc.add(const ProductionOrderQueryEvent.fetch());
        }
      },
    );
  }
}
