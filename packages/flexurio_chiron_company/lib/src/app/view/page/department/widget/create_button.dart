import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      permission: Permission.departmentCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<DepartmentQueryBloc>();
        final success = await Navigator.push(
          context,
          DepartmentCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const DepartmentQueryEvent.fetch());
        }
      },
    );
  }
}
