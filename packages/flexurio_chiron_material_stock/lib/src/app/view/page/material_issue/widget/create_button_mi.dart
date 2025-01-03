import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialIssueCreateButton extends StatelessWidget {
  const MaterialIssueCreateButton({
    super.key,
    required this.isExternal,
  });
  final bool isExternal;
  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    return Button.small(
      permission:
          PermissionMaterialStock.materialIssueCreate(isExternal: isExternal),
      action: action,
      onPressed: () async {
        final queryBloc = context.read<MaterialIssueQueryBloc>();
        const queryEvent = MaterialIssueQueryEvent.fetch();
        await Navigator.push(
          context,
          MaterialIssueCreatePage.route(
            createAdditional: false,
            isExternal: isExternal,
          ),
        ).then((value) {
          if (value ?? false) {
            queryBloc.add(queryEvent);
          }
        });
      },
    );
  }
}
