import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_unit_query/material_unit_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_unit/widget/convert_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_unit/widget/create_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_unit/widget/delete_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialUnitDataTable extends StatelessWidget {
  const MaterialUnitDataTable._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialUnitQueryBloc()
            ..add(const MaterialUnitQueryEvent.fetch()),
        ),
      ],
      child: const MaterialUnitDataTable._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialUnitQueryBloc, MaterialUnitQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<MaterialUnit>(
            onChanged: (pageOptions) {
              context.read<MaterialUnitQueryBloc>().add(
                    MaterialUnitQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            pageOptions: state.maybeWhen(
              orElse: PageOptions.empty,
              loading: (pageOptions) => pageOptions,
              loaded: (pageOptions) => pageOptions,
            ),
            status: state.maybeWhen(
              orElse: () => Status.progress,
              error: (_) => Status.error,
              loaded: (_) => Status.loaded,
            ),
            onRefresh: () => context
                .read<MaterialUnitQueryBloc>()
                .add(const MaterialUnitQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
            actionRight: (refresh) => [
              refresh,
              CreateButton(),
            ],
            columns: [
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'id',
                  label: 'ID',
                ),
                body: (materialUnit) => DataCell(
                  Text(
                    materialUnit.id,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'type',
                  label: 'type'.tr(),
                ),
                body: (materialUnit) => DataCell(
                  ChipType(materialUnit.type),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'created_at',
                  label: 'created_at'.tr(),
                ),
                body: (materialUnit) => DataCell(
                  Text(materialUnit.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'updated_at',
                  label: 'updated_at'.tr(),
                ),
                body: (materialUnit) => DataCell(
                  Text(materialUnit.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(label: 'actions'.tr(), backendColumn: null),
                body: (materialUnit) => DataCell(
                  Row(
                    children: [
                      MaterialUnitConvertButton(
                        unit: materialUnit,
                      ),
                      DeleteButton.prepare(id: materialUnit.id),
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
