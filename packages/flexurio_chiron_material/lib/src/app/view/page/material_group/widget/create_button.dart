import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_group_create/material_group_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: Permission.materialGroupCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<MaterialGroupQueryBloc>();
        final success = await Navigator.push(
          context,
          MaterialGroupCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const MaterialGroupQueryEvent.fetch());
        }
      },
    );
  }
}
