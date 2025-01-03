import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionStageProcessEditButton extends StatelessWidget {
  const ProductionStageProcessEditButton({
    required this.stageProcess,
    super.key,
  });

  final ProductionStageProcessGroup stageProcess;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      onPressed: () {
        Navigator.push(
          context,
          ProductionStageProcessEditPage.route(
            stageProcessGroup: stageProcess,
          ),
        ).then((value) {
          if (value ?? false) {
            context
                .read<ProductionStageProcessQueryBloc>()
                .add(const ProductionStageProcessQueryEvent.fetch());
          }
        });
      },
      action: DataAction.edit,
      permission: PermissionProduction.productionStageProcessEdit,
    );
  }
}
