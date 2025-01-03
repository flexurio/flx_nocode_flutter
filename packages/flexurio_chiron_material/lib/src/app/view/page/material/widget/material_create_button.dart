import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialCreateButton extends StatelessWidget {
  const MaterialCreateButton({
    super.key,
    required this.isExternal,
  });

  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionMaterial.materialCreate(isExternal: isExternal),
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<MaterialQueryBloc>();
        final success = await Navigator.push(
          context,
          MaterialCreatePage.route(isExternal: isExternal),
        );
        if (success ?? false) {
          queryBloc.add(const MaterialQueryEvent.fetch());
        }
      },
    );
  }
}
