import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionStageUpdateButton extends StatelessWidget {
  const ProductionStageUpdateButton({required this.productionStage, super.key});

  final ProductionStage productionStage;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProduction.productionStageEdit,
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = context.read<ProductionStageQueryBloc>();
        final success = await Navigator.push(
          context,
          ProductionStageCreatePage.route(productionStage: productionStage),
        );
        if (success ?? false) {
          queryBloc.add(const ProductionStageQueryEvent.fetch());
        }
      },
    );
  }
}
