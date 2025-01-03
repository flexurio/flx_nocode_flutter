import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_sub_stage_query/production_sub_stage_query_bloc.dart';
import 'package:flexurio_chiron_production/src/app/model/production_sub_stage.dart';
import 'package:flexurio_chiron_production/src/app/view/page/production_sub_stage_create/production_sub_stage_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionSubStageUpdateButton extends StatelessWidget {
  const ProductionSubStageUpdateButton({
    required this.productionSubStage,
    required this.productionStage,
    super.key,
  });

  final ProductionSubStage productionSubStage;
  final ProductionStage productionStage;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProduction.productionSubStageEdit,
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = context.read<ProductionSubStageQueryBloc>();
        final success = await Navigator.push(
          context,
          ProductionSubStageCreatePage.route(
            productionSubStage: productionSubStage,
            productionStage: productionStage,
          ),
        );
        if (success ?? false) {
          queryBloc.add(const ProductionSubStageQueryEvent.fetch());
        }
      },
    );
  }
}
