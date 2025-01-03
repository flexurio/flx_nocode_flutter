import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersButton extends StatelessWidget {
  const UsersButton._({
    required this.department,
  });

  static Widget prepare({
    required Department department,
  }) {
    return BlocProvider(
      create: (context) => DepartmentBloc(),
      child: UsersButton._(department: department),
    );
  }

  final Department department;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.departmentEmployeeEdit,
      action: DataAction.showEmployee,
      onPressed: () async {
        await showDialog<void>(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radiusPopup),
              ),
              content: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 600,
                  maxWidth: 500,
                  minWidth: 500,
                ),
                child: Users.prepare(department: department),
              ),
            );
          },
        );
      },
    );
  }
}
