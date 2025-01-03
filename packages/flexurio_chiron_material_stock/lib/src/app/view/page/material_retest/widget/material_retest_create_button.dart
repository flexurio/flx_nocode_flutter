import 'package:flexurio_chiron_material_stock/src/app/bloc/material_rates_query/material_retest_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_retest_create/material_retest_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialRetestsCreateButton extends StatelessWidget {
  const MaterialRetestsCreateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: Permission.materialRetestCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<MaterialRetestQueryBloc>();
        final success = await Navigator.push(
          context,
          MaterialRetestsCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const MaterialRetestQueryEvent.fetch());
        }
      },
    );
  }
}
