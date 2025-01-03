import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      permission: PermissionMaterial.materialUnitCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<MaterialUnitQueryBloc>();
        final success = await Navigator.push(
          context,
          MaterialUnitCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const MaterialUnitQueryEvent.fetch());
        }
      },
    );
  }
}
