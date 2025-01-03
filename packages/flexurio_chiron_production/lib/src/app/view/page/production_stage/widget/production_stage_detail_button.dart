import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_production/src/app/view/page/production_sub_stage/production_sub_stage_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductionStageDetailButton extends StatelessWidget {
  const ProductionStageDetailButton({
    required this.productionStage,
    super.key,
  });

  final ProductionStage productionStage;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProduction.productionStageEdit,
      action: DataAction.viewDetail,
      onPressed: () async {
        await Navigator.push(
          context,
          ProductionSubStagePage.route(productionStage: productionStage),
        );
      },
    );
  }
}
