import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepartmentDataTable extends StatelessWidget {
  const DepartmentDataTable._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              DepartmentQueryBloc()..add(const DepartmentQueryEvent.fetch()),
        ),
      ],
      child: const DepartmentDataTable._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentQueryBloc, DepartmentQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<Department>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onRefresh: () => context
                .read<DepartmentQueryBloc>()
                .add(const DepartmentQueryEvent.fetch()),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              refreshButton,
              const CreateButton(),
            ],
            onChanged: (pageOptions) {
              context.read<DepartmentQueryBloc>().add(
                    DepartmentQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            columns: [
              DTColumn(
                widthFlex: 4,
                head: const DTHead(
                  label: 'ID',
                  backendColumn: 'id',
                ),
                body: (department) => DataCell(
                  Text(department.id),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'name'.tr(),
                  backendColumn: 'id',
                ),
                body: (department) => DataCell(
                  Text(department.name),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'group'.tr(),
                  backendColumn: 'department_group.name',
                ),
                body: (department) => DataCell(
                  Text(department.departmentGroup.name),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'type'.tr(),
                  backendColumn: 'department_type.name',
                ),
                body: (department) => DataCell(
                  Text(department.departmentType.name),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_by'.tr(),
                  backendColumn: 'created_by_id',
                ),
                body: (assetLocation) => DataCell(
                  GetNameUser(userId: assetLocation.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (assetLocation) => DataCell(
                  Text(assetLocation.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Updated At',
                  backendColumn: 'updated_at',
                ),
                body: (assetLocation) => DataCell(
                  Text(assetLocation.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Actions',
                  backendColumn: null,
                ),
                body: (department) => DataCell(
                  Row(
                    children: [
                      UsersButton.prepare(department: department),
                      UpdateButton(department: department),
                      DeleteButton.prepare(department: department),
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
