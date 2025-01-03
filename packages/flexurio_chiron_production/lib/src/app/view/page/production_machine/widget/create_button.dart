import 'package:flexurio_chiron_production/src/app/bloc/production_machine_query/production_machine_query_bloc.dart';
import 'package:flexurio_chiron_production/src/app/model/permission.dart';
import 'package:flexurio_chiron_production/src/app/view/page/production_machine_create/production_machine_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionMachineCreateButton extends StatelessWidget {
  const ProductionMachineCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionProduction.productionMachineCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<ProductionMachineQueryBloc>();
        final success = await Navigator.push(
          context,
          ProductionMachineCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const ProductionMachineQueryEvent.get());
        }
      },
    );
  }
}
