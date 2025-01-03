import 'package:flexurio_chiron_material_stock/src/app/bloc/material_rates_query/material_retest_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_retest.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_retest_create/material_retest_edit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialRetestsUpdateButton extends StatelessWidget {
  const MaterialRetestsUpdateButton({required this.materialRetests, super.key});

  final MaterialRetest materialRetests;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.materialRetestEdit,
      action: DataAction.updateDate,
      onPressed: () async {
        final queryBloc = context.read<MaterialRetestQueryBloc>();
        final success = await Navigator.push(
          context,
          MaterialRetestsUpdatePage.route(materialRetests: materialRetests),
        );
        if (success ?? false) {
          queryBloc.add(const MaterialRetestQueryEvent.fetch());
        }
      },
    );
  }
}
