import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialLeadTimeExportExcelButton extends StatefulWidget {
  const MaterialLeadTimeExportExcelButton({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LeadtimeMaterialQueryBloc(),
        ),
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(
              MaterialGroupQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: const MaterialLeadTimeExportExcelButton(),
    );
  }

  @override
  State<MaterialLeadTimeExportExcelButton> createState() =>
      _MaterialLeadTimeExportExcelButtonState();
}

class _MaterialLeadTimeExportExcelButtonState
    extends State<MaterialLeadTimeExportExcelButton> {
  final _requiredObjectValidator = RequiredObjectValidator<dynamic>(
    errorText: pleaseFillOutThisField.tr(),
  );

  List<MaterialGroup>? _listMaterialGroup = [];
  String? _leadtime;

  final _leadtimeController = TextEditingController();

  final userDepartment = UserRepositoryApp.instance.department;
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  @override
  void initState() {
    _listMaterialGroup = null;
    _leadtime = 'With Leadtime';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<LeadtimeMaterialQueryBloc>();
    final materialGroupBloc = context.read<MaterialGroupQueryBloc>();

    return LightButtonSmall(
      action: DataAction.exportExcel,
      title: 'Export Material Leadtime',
      permission: PermissionMaterial.materialLeadtimeExportExcel,
      onPressed: () async {
        await _showPeriod(
          context,
          queryBloc,
          materialGroupBloc,
        );
      },
    );
  }

  Future<void> _showPeriod(
    BuildContext context,
    LeadtimeMaterialQueryBloc queryBloc,
    MaterialGroupQueryBloc materialGroupBloc,
  ) async {
    await showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CardForm(
          popup: true,
          title: 'filter'.tr(),
          icon: Icons.sort,
          actions: [
            Button(
              action: DataAction.cancel,
              permission: null,
              isSecondary: true,
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(width: 12),
            BlocListener<LeadtimeMaterialQueryBloc, LeadtimeMaterialQueryState>(
              bloc: queryBloc,
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (error) => Toast(context).fail(error),
                  loaded: (materialRequest) {
                    final bytes = simpleExcel<LeadtimeMaterial>(
                      context: context,
                      data: materialRequest,
                      columns: _leadtime == 'With Leadtime'
                          ? [
                              TColumn(
                                title: 'division'.tr(),
                                builder: (data, index) => 'PT. Metiska Farma',
                              ),
                              TColumn(
                                title: 'material_group'.tr(),
                                builder: (data, index) => data.materialGroupId,
                              ),
                              TColumn(
                                title: 'material_code'.tr(),
                                builder: (data, index) => data.materialId,
                              ),
                              TColumn(
                                title: 'material_name'.tr(),
                                builder: (data, index) => data.materialName,
                              ),
                              TColumn(
                                title: 'vendor_code'.tr(),
                                builder: (data, index) => data.vendorId,
                              ),
                              TColumn(
                                title: 'vendor_name'.tr(),
                                builder: (data, index) => data.vendorName,
                              ),
                              TColumn(
                                title: 'leadtime'.tr(),
                                builder: (data, index) =>
                                    data.leadTime.toString(),
                              ),
                              TColumn(
                                title: 'leadtime_unit'.tr(),
                                builder: (data, index) => data.stockUnitId,
                              ),
                              TColumn(
                                title: 'code'.tr(),
                                builder: (data, index) =>
                                    data.packSize.toString(),
                              ),
                              TColumn(
                                title: 'pack'.tr(),
                                builder: (data, index) =>
                                    data.packSize.toString(),
                              ),
                              TColumn(
                                title: 'unit'.tr(),
                                builder: (data, index) => data.materialUnitId,
                              ),
                            ]
                          : [
                              TColumn(
                                title: 'material_group'.tr(),
                                builder: (data, index) => data.materialGroupId,
                              ),
                              TColumn(
                                title: 'material_id'.tr(),
                                builder: (data, index) => data.materialId,
                              ),
                              TColumn(
                                title: 'material_name'.tr(),
                                builder: (data, index) => data.materialName,
                              ),
                              TColumn(
                                title: 'vendor_code'.tr(),
                                builder: (data, index) => data.vendorId,
                              ),
                              TColumn(
                                title: 'vendor_name'.tr(),
                                builder: (data, index) => data.vendorName,
                              ),
                              TColumn(
                                title: 'leadtime'.tr(),
                                builder: (data, index) =>
                                    data.leadTime.toString(),
                              ),
                            ],
                    );
                    saveFile(bytes, 'report_request_form.xlsx');
                  },
                );
              },
              child: BlocBuilder<LeadtimeMaterialQueryBloc,
                  LeadtimeMaterialQueryState>(
                bloc: queryBloc,
                builder: (context, state) {
                  return LightButtonSmall(
                    action: DataAction.exportExcel,
                    permission: null,
                    status: state.maybeWhen(
                      loading: () => Status.progress,
                      orElse: () => null,
                    ),
                    onPressed: () async {
                      if (_leadtime != null && _listMaterialGroup != null) {
                        queryBloc.add(
                          LeadtimeMaterialQueryEvent.fetch(
                            leadtime: _leadtime!,
                            listMaterialGroup: _listMaterialGroup!,
                          ),
                        );
                      } else {
                        Toast(context).fail(
                          'You must insert the Leadtime & Material Group',
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<MaterialGroupQueryBloc, MaterialGroupQueryState>(
                bloc: materialGroupBloc,
                builder: (context, state) {
                  return FDropDownSearchMultiple<MaterialGroup>(
                    validator: _requiredObjectValidator.call,
                    labelText: 'material_group'.tr(),
                    items: state.maybeWhen(
                      orElse: () => <MaterialGroup>[],
                      loaded: (materialGroup) {
                        final listMaterialGroup = <MaterialGroup>[
                          MaterialGroup.empty().copyWith(
                            id: 'ATK',
                          ),
                          MaterialGroup.empty().copyWith(
                            id: 'SAFETY',
                          ),
                          MaterialGroup.empty().copyWith(
                            id: 'ALAT DAPUR',
                          ),
                          MaterialGroup.empty().copyWith(
                            id: 'UMUM',
                          ),
                          MaterialGroup.empty().copyWith(
                            id: 'IT COMP',
                          ),
                        ];

                        final filterIds =
                            listMaterialGroup.map((group) => group.id).toSet();

                        final filteredMaterialGroups = materialGroup.data
                            .where((group) => filterIds.contains(group.id))
                            .toList();

                        return filteredMaterialGroups;
                      },
                    ),
                    status: state.maybeWhen(
                      orElse: () => Status.error,
                      loading: (_) => Status.progress,
                      loaded: (_) => Status.loaded,
                    ),
                    onChanged: (listMaterialGroup) {
                      setState(() {
                        _listMaterialGroup = listMaterialGroup;
                      });
                    },
                    itemAsString: (materialGroup) => materialGroup.id,
                    selectedItems: _listMaterialGroup ?? [],
                    dropdownBuilder: (context, selectedItems) {
                      final theme = Theme.of(context);
                      return Wrap(
                        spacing: 10,
                        children: selectedItems.map((e) {
                          return Container(
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.lighten(.33),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            margin: const EdgeInsets.only(top: 8),
                            padding: const EdgeInsets.only(left: 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  e.id,
                                  style: TextStyle(
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: theme.colorScheme.primary,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      selectedItems.remove(e);
                                      if (_listMaterialGroup!.isNotEmpty) {
                                        _listMaterialGroup!.remove(e);
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 12),
              SelectChipField<String>(
                label: 'With Leadtime / Without Leadtime',
                getLabel: (leadtime) => leadtime,
                controller: _leadtimeController,
                validator: requiredValidator.call,
                options: const [
                  'With Leadtime',
                  'Without Leadtime',
                ],
                onChanged: (value) {
                  _leadtime = value;
                  _leadtimeController.text = value;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
