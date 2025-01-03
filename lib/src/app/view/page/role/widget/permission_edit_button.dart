import 'package:appointment/src/app/view/page/role_permission/role_permission_page.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class PermissionEditButton extends StatelessWidget {
  const PermissionEditButton({required this.role, super.key});

  final Role role;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.rolePermissionEdit,
      action: DataAction.showPermission,
      onPressed: () async {
        await Navigator.push(
          context,
          RolePermissionPage.route(role: role),
        );
      },
    );
  }
}
