import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_type_query/material_type_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_type.dart'
    as model;
import 'package:flexurio_chiron_material/src/app/view/page/material_type/widget/material_type_create_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_type/widget/material_type_delete_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialTypeDataTable extends StatelessWidget {
  const MaterialTypeDataTable._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialTypeQueryBloc()
            ..add(const MaterialTypeQueryEvent.fetch()),
        ),
      ],
      child: const MaterialTypeDataTable._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    return BlocBuilder<MaterialTypeQueryBloc, MaterialTypeQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<model.MaterialType>(
            pageOptions: state.maybeWhen(
              orElse: () => PageOptions.empty(sortBy: 'id'),
              loading: (pageOptions) => pageOptions,
              loaded: (pageOptions) => pageOptions,
            ),
            onChanged: (pageOptions) {
              context.read<MaterialTypeQueryBloc>().add(
                    MaterialTypeQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            onRefresh: () => context
                .read<MaterialTypeQueryBloc>()
                .add(const MaterialTypeQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              orElse: () => Status.error,
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
            ),
            actionRight: (refreshButton) => [
              refreshButton,
              const MaterialTypeCreateButton(),
            ],
            columns: [
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'id',
                  label: 'ID',
                ),
                body: (materialType) => DataCell(Text(materialType.id)),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'MaterialGroup.id',
                  label: 'type_group'.tr(),
                ),
                body: (materialType) => DataCell(
                  Text(materialType.materialGroup!.id),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(label: 'actions'.tr(), backendColumn: null),
                body: (materialType) => DataCell(
                  Row(
                    children: [
                      MaterialTypeDeleteButton.prepare(
                        materialType: materialType,
                      ),
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
