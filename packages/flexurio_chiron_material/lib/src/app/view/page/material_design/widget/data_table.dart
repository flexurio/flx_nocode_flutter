import 'package:flexurio_chiron_material/src/app/bloc/material_design_query/material_design_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_design/widget/activation_switch_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_design/widget/create_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_design/widget/edit_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_design/widget/export_excel_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_design/widget/export_pdf_button.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialDesignDataTable extends StatelessWidget {
  const MaterialDesignDataTable._(this.isExternal);

  final bool isExternal;

  static Widget prepare({
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialDesignQueryBloc(isExternal: isExternal)
            ..add(const MaterialDesignQueryEvent.fetch()),
        ),
      ],
      child: MaterialDesignDataTable._(isExternal),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialDesignQueryBloc, MaterialDesignQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<MaterialDesign>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () => context
                .read<MaterialDesignQueryBloc>()
                .add(const MaterialDesignQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            onChanged: (pageOptions) {
              context.read<MaterialDesignQueryBloc>().add(
                    MaterialDesignQueryEvent.fetch(pageOptions: pageOptions),
                  );
            },
            actionRight: (refreshButton) => [
              MaterialDesignExportExcelButton(isExternal: isExternal),
              MaterialDesignExportPdfButton(isExternal: isExternal),
              refreshButton,
              MaterialDesignCreateButton(isExternal: isExternal),
            ],
            columns: [
              DTColumn(
                widthFlex: 4,
                head: const DTHead(
                  label: 'ID',
                  backendColumn: 'material_design_codes.design_code',
                ),
                body: (materialDesign) => DataCell(
                  Text(materialDesign.designCode),
                ),
              ),
              DTColumn(
                widthFlex: 10,
                head: const DTHead(
                  label: 'Material',
                  backendColumn: 'Material.name',
                ),
                body: (materialDesign) => DataCell(
                  Text(materialDesign.material.name),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'description'.tr(),
                  backendColumn: 'material_design_codes.description',
                ),
                body: (materialDesign) => DataCell(
                  Text(materialDesign.description),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'created_by'.tr(),
                  backendColumn: 'created_by_id',
                ),
                body: (materialDesign) => DataCell(
                  GetNameUser(userId: materialDesign.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (materialDesign) => DataCell(
                  Text(materialDesign.createAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'updated_by'.tr(),
                  backendColumn: 'updated_by_id',
                ),
                body: (materialDesign) => DataCell(
                  GetNameUser(userId: materialDesign.updateById),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'updated_at'.tr(),
                  backendColumn: 'updated_at',
                ),
                body: (materialDesign) => DataCell(
                  Text(materialDesign.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  label: 'active'.tr(),
                  backendColumn: 'material_design_codes.is_lock',
                ),
                body: (materialDesign) {
                  return DataCell(
                    ActivationSwitchButton.prepare(
                      materialDesign: materialDesign,
                      isExternal: isExternal,
                    ),
                  );
                },
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'actions'.tr(),
                  backendColumn: null,
                ),
                body: (materialDesign) => DataCell(
                  Row(
                    children: [
                      EditButton(
                        materialDesign: materialDesign,
                        isExternal: isExternal,
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
