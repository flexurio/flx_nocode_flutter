import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductionStageProcessDetailButton extends StatelessWidget {
  const ProductionStageProcessDetailButton({
    required this.stageProcessGroup,
    super.key,
  });

  final ProductionStageProcessGroup stageProcessGroup;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProduction.productionStageProcessEdit,
      action: DataAction.viewDetail,
      onPressed: () async {
        await Navigator.push(
          context,
          ProductionStageProcessDetailPage.route(
            stageProcessGroup: stageProcessGroup,
          ),
        );
      },
    );
  }
}
