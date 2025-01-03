import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:appointment/src/app/view/page/role/widget/create_button.dart';
import 'package:appointment/src/app/view/page/role/widget/delete_button.dart';
import 'package:appointment/src/app/view/page/role/widget/edit_button.dart';
import 'package:appointment/src/app/view/page/role/widget/permission_edit_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoleDataTable extends StatelessWidget {
  const RoleDataTable._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              RoleQueryBloc(accessToken: UserRepositoryApp.instance.token!)
              ..add(const RoleQueryEvent.fetch()),
        ),
      ],
      child: const RoleDataTable._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoleQueryBloc, RoleQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<Role>(
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onRefresh: () => context
                .read<RoleQueryBloc>()
                .add(RoleQueryEvent.fetch()),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              refreshButton,
              CreateButton(),
            ],
            onChanged: (pageOptions) {
              context.read<RoleQueryBloc>().add(
                    RoleQueryEvent.fetch(pageOptions: pageOptions),
                  );
            },
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'name'.tr(),
                  backendColumn: 'name',
                ),
                body: (role) => DataCell(
                  Text(role.name),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'description'.tr(),
                  backendColumn: 'description',
                ),
                body: (role) => DataCell(
                  Text(role.description),
                ),
              ),
              DTColumn(
                widthFlex: 10,
                head: DTHead(
                  label: 'actions'.tr(),
                  backendColumn: null,
                ),
                body: (role) => DataCell(
                  Row(
                    children: [
                      // UsersButton.prepare(role: role),
                      PermissionEditButton(role: role),
                      UpdateButton(role: role),
                      DeleteButton.prepare(role: role),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
