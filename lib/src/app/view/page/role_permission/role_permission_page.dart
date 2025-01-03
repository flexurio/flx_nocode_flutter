import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:appointment/src/app/view/page/role_permission/widget/permission_panel.dart';
import 'package:appointment/src/app/view/page/role_permission/widget/role_employee.dart';

import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RolePermissionPage extends StatefulWidget {
  const RolePermissionPage({required this.role, super.key});

  final Role role;

  static Route<void> route({required Role role}) {
    return MaterialPageRoute(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RolePermissionQueryBloc(
              accessToken: UserRepositoryApp.instance.token!,
            )..add(RolePermissionQueryEvent.fetch(role: role)),
          ),
        ],
        child: RolePermissionPage(role: role),
      ),
    );
  }

  @override
  State<RolePermissionPage> createState() => _RolePermissionPageState();
}

class _RolePermissionPageState extends State<RolePermissionPage> {
  var _search = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ContentWithRightPanel(
        rightPanel: RoleEmployee.prepare(role: widget.role),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: FCard(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: BackButtonWithTitle(
                        title: 'Permission ${widget.role.name}',
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: SearchBox(
                        onChanged: (value) => setState(() => _search = value),
                      ),
                    ),
                  ],
                ),
                const Gap(24),
                PermissionPanel(role: widget.role, search: _search),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
