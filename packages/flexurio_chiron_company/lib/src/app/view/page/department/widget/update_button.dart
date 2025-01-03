import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({required this.department, super.key});

  final Department department;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.departmentEdit,
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = context.read<DepartmentQueryBloc>();
        final success = await Navigator.push(
          context,
          DepartmentCreatePage.route(department: department),
        );
        if (success ?? false) {
          queryBloc.add(const DepartmentQueryEvent.fetch());
        }
      },
    );
  }
}
