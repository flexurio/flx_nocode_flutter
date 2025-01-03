import 'package:flexurio_chiron_material/src/app/bloc/material_design_query/material_design_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_design_create/material_design_create_page.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    required this.materialDesign,
    super.key,
    required this.isExternal,
  });
  final bool isExternal;

  final MaterialDesign materialDesign;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionMaterial.materialDesignEdit(isExternal: isExternal),
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = context.read<MaterialDesignQueryBloc>();
        final success = await Navigator.push(
          context,
          MaterialDesignCreatePage.route(
              materialDesign: materialDesign, isExternal: isExternal),
        );
        if (success ?? false) {
          queryBloc.add(const MaterialDesignQueryEvent.fetch());
        }
      },
    );
  }
}
