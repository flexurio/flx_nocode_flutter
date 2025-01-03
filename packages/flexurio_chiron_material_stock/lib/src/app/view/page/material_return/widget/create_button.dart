import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReturnCreateButton extends StatelessWidget {
  const MaterialReturnCreateButton({required this.isExternal, super.key});

  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionMaterialStock.materialReturnCreate(isExternal: isExternal),
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<MaterialReturnQueryBloc>();
        final success = await Navigator.push(
          context,
          MaterialReturnCreatePage.route(isExternal: isExternal),
        );
        if (success ?? false) {
          queryBloc.add(MaterialReturnQueryEvent.fetch(isExternal: isExternal));
        }
      },
    );
  }
}
