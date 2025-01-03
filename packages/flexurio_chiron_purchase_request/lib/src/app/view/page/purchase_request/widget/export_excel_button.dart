import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_purchase_request/flexurio_chiron_purchase_request.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_query/material_request_detail_query_bloc.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:appointment/src/app/util/picker_file.dart';

class MaterialRequestExportExcelButton extends StatefulWidget {
  const MaterialRequestExportExcelButton({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DepartmentQueryBloc()),
        BlocProvider(create: (context) => MaterialGroupQueryBloc()),
        BlocProvider(create: (context) => MaterialRequestDetailQueryBloc()),
      ],
      child: const MaterialRequestExportExcelButton(),
    );
  }

  @override
  State<MaterialRequestExportExcelButton> createState() =>
      _MaterialRequestExportExcelButtonState();
}

class _MaterialRequestExportExcelButtonState
    extends State<MaterialRequestExportExcelButton> {
  Department? _department;
  MaterialGroup? _materialGroup;
  @override
  Widget build(BuildContext context) {
    final departmentQuery = context.read<DepartmentQueryBloc>();
    final matGroupQuery = context.read<MaterialGroupQueryBloc>();
    final mrDetailQuery = context.read<MaterialRequestDetailQueryBloc>();
    return BlocListener<MaterialRequestDetailQueryBloc,
        MaterialRequestDetailQueryState>(
      bloc: mrDetailQuery,
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (materialRequest) {
            final bytes = excelMaterialRequest(materialRequest);
            saveFile(bytes, 'Material_Request_Report.xlsx');
          },
        );
      },
      child: LightButtonSmall(
        action: DataAction.exportExcel,
        permission: Permission.purchaseRequestExportExcel,
        onPressed: () async {
          departmentQuery.add(
            DepartmentQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            ),
          );
          matGroupQuery.add(
            MaterialGroupQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            ),
          );
          await _showFilter(
            context,
            departmentQuery,
            matGroupQuery,
            mrDetailQuery,
          );
        },
      ),
    );
  }

  Future<void> _showFilter(
    BuildContext context,
    DepartmentQueryBloc departmentQuery,
    MaterialGroupQueryBloc matGroupQuery,
    MaterialRequestDetailQueryBloc mrDetailQuery,
  ) async {
    await showDialog<bool?>(
      context: context,
      builder: (context) {
        return CardForm(
          popup: true,
          title: 'Filter',
          icon: FontAwesomeIcons.filter,
          actions: [
            Button(
              action: DataAction.cancel,
              isSecondary: true,
              permission: null,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Gap(12),
            BlocBuilder<MaterialRequestDetailQueryBloc,
                MaterialRequestDetailQueryState>(
              bloc: mrDetailQuery,
              builder: (context, state) {
                final isInProgress = state.maybeWhen(
                  orElse: () => false,
                  loading: () => true,
                );
                return Button(
                  action: DataAction.export,
                  permission: null,
                  isInProgress: isInProgress,
                  onPressed: () {
                    mrDetailQuery.add(
                      MaterialRequestDetailQueryEvent.fetchAll(
                        department: _department,
                        materialGroup: _materialGroup,
                      ),
                    );
                  },
                );
              },
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<MaterialGroupQueryBloc, MaterialGroupQueryState>(
                bloc: matGroupQuery,
                builder: (context, state) {
                  return FDropDownSearch<MaterialGroup>(
                    labelText: 'material_group'.tr(),
                    itemAsString: (group) => group.id,
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (groups) => groups.data,
                    ),
                    status: state.maybeWhen(
                      orElse: () => Status.error,
                      loading: (_) => Status.progress,
                      loaded: (_) => Status.loaded,
                    ),
                    onChanged: (groups) async {
                      if (groups != null) {
                        _materialGroup = groups;
                      }
                    },
                  );
                },
              ),
              const Gap(12),
              BlocBuilder<DepartmentQueryBloc, DepartmentQueryState>(
                bloc: departmentQuery,
                builder: (context, state) {
                  return FDropDownSearch<Department>(
                    labelText: 'department'.tr(),
                    itemAsString: (department) => department.name,
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (department) => department.data,
                    ),
                    status: state.maybeWhen(
                      orElse: () => Status.error,
                      loading: (_) => Status.progress,
                      loaded: (_) => Status.loaded,
                    ),
                    onChanged: (department) async {
                      if (department != null) {
                        _department = department;
                      }
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
