import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_group/widget/create_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_group/widget/delete_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialGroupDataTable extends StatelessWidget {
  const MaterialGroupDataTable._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(const MaterialGroupQueryEvent.fetch()),
        ),
      ],
      child: const MaterialGroupDataTable._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialGroupQueryBloc, MaterialGroupQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<MaterialGroup>(
            onChanged: (pageOptions) {
              context.read<MaterialGroupQueryBloc>().add(
                    MaterialGroupQueryEvent.fetch(),
                  );
            },
            pageOptions: state.maybeWhen(
              orElse: PageOptions.empty,
              loading: (pageOptions) => pageOptions,
              loaded: (pageOptions) => pageOptions,
            ),
            status: state.maybeWhen(
              orElse: () => Status.error,
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
            ),
            onRefresh: () => context
                .read<MaterialGroupQueryBloc>()
                .add(const MaterialGroupQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
            actionRight: (refreshButton) => [
              refreshButton,
              const CreateButton(),
            ],
            columns: [
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'id',
                  label: 'ID',
                ),
                body: (materialGroup) => DataCell(
                  Text(materialGroup.id),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'category',
                  label: 'category'.tr(),
                ),
                body: (materialGroup) =>
                    DataCell(ChipType(materialGroup.category)),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'created_at',
                  label: 'created_at'.tr(),
                ),
                body: (materialGroup) => DataCell(
                  Text(
                    materialGroup.createdAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'updated_at',
                  label: 'updated_at'.tr(),
                ),
                body: (materialGroup) => DataCell(
                  Text(
                    materialGroup.updatedAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'has_vendor',
                  label: 'vendor'.tr(),
                ),
                body: (materialGroup) => DataCell(
                  BoolIcon(materialGroup.hasVendor),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: null,
                  label: 'actions'.tr(),
                ),
                body: (materialGroup) => DataCell(
                  Row(
                    children: [
                      DeleteButton.prepare(id: materialGroup.id),
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
