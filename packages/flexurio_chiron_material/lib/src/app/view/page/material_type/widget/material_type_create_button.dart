import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialTypeCreateButton extends StatelessWidget {
  const MaterialTypeCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionMaterial.materialTypeCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<MaterialTypeQueryBloc>();
        final success = await Navigator.push(
          context,
          MaterialTypeCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const MaterialTypeQueryEvent.fetch());
        }
      },
    );
  }
}
