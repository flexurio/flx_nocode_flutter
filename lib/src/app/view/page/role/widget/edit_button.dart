import 'package:appointment/src/app/view/page/role_create/role_create_page.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({required this.role, super.key});

  final Role role;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.roleEdit,
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = context.read<RoleQueryBloc>();
        final success = await Navigator.push(
          context,
          RoleCreatePage.route(role: role),
        );
        if (success ?? false) {
          queryBloc.add(const RoleQueryEvent.fetch());
        }
      },
    );
  }
}
