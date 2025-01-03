import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialUpdateButton extends StatelessWidget {
  const MaterialUpdateButton(
      {required this.material, required this.isExternal, super.key});

  final bool isExternal;
  final model.Material material;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionMaterial.materialEdit(isExternal: isExternal),
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = context.read<MaterialQueryBloc>();
        final success = await Navigator.push(
          context,
          MaterialCreatePage.route(material: material, isExternal: isExternal),
        );
        if (success ?? false) {
          queryBloc.add(const MaterialQueryEvent.fetch());
        }
      },
    );
  }
}
