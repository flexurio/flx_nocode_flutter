import 'package:flexurio_chiron_production/src/app/bloc/production_stage_process_query/production_stage_process_query_bloc.dart';
import 'package:flexurio_chiron_production/src/app/model/permission.dart';
import 'package:flexurio_chiron_production/src/app/view/page/production_stage_process_create/production_stage_process_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionStageProcessCreateButton extends StatelessWidget {
  const ProductionStageProcessCreateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionProduction.productionStageProcessCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<ProductionStageProcessQueryBloc>();
        final success = await Navigator.push(
          context,
          ProductionStageProcessCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const ProductionStageProcessQueryEvent.fetch());
        }
      },
    );
  }
}
