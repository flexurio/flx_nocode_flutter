import 'package:flexurio_chiron_material/src/app/bloc/material_design_query/material_design_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_design_create/material_design_create_page.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialDesignCreateButton extends StatelessWidget {
  const MaterialDesignCreateButton({super.key, required this.isExternal});
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission:
          PermissionMaterial.materialDesignCreate(isExternal: isExternal),
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<MaterialDesignQueryBloc>();
        final success = await Navigator.push(
          context,
          MaterialDesignCreatePage.route(isExternal: isExternal),
        );
        if (success ?? false) {
          queryBloc.add(const MaterialDesignQueryEvent.fetch());
        }
      },
    );
  }
}
