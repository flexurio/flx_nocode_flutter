import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive_detail_query/material_receive_detail_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReceiveExportExcelButton extends StatefulWidget {
  const MaterialReceiveExportExcelButton({super.key});

  static Widget prepare({
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                MaterialReceiveDetailQueryBloc(isExternal: isExternal)),
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: isExternal)
            ..add(
              ProductQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
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
      child: const MaterialReceiveExportExcelButton(),
    );
  }

  @override
  State<MaterialReceiveExportExcelButton> createState() =>
      _MaterialReceiveExportExcelButtonState();
}

class _MaterialReceiveExportExcelButtonState
    extends State<MaterialReceiveExportExcelButton> {
  final _requiredObjectValidator = RequiredObjectValidator<dynamic>(
    errorText: pleaseFillOutThisField.tr(),
  );
  DateTime? _startDate;
  DateTime? _endDate;

  List<MaterialGroup> _listMaterialGroup = [];
  List<WarehouseMaterialReceive> _listWarehouse = [];

  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  // final userDepartment = UserRepositoryApp.instance.department;
  // final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  @override
  void initState() {
    _startDateController.text = _startDate?.yyyyMMdd ?? '';
    _endDateController.text = _endDate?.yyyyMMdd ?? '';
    // _warehouse = _warehouse;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<MaterialReceiveDetailQueryBloc>();
    final materialGroupBloc = context.read<MaterialGroupQueryBloc>();

    return LightButtonSmall(
      action: DataAction.exportExcel,
      title: 'Release Material',
      permission: null,
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
    MaterialReceiveDetailQueryBloc queryBloc,
    MaterialGroupQueryBloc materialGroupBloc,
  ) async {
    await showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CardForm(
          popup: true,
          title: 'Select Period',
          icon: Icons.calendar_month_rounded,
          actions: [
            Button(
              action: DataAction.cancel,
              permission: null,
              isSecondary: true,
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(width: 12),
            UsersBuilder(
              builder: (users) {
                return BlocListener<MaterialReceiveDetailQueryBloc,
                    MaterialReceiveDetailQueryState>(
                  bloc: queryBloc,
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      error: (error) => Toast(context).fail(error),
                      loaded: (materialRequest) {
                        final bytes = simpleExcel<MaterialReceiveDetail>(
                          context: context,
                          data: materialRequest.data,
                          columns: [
                            TColumn(
                              title: 'material_name'.tr(),
                              builder: (data, index) => data.material.name,
                            ),
                            TColumn(
                              title: 'na'.tr(),
                              builder: (data, index) => data.na,
                            ),
                            TColumn(
                              title: 'tgl_barang_datang'.tr(),
                              builder: (data, index) {
                                return data.materialReceive.createdAt.yyyyMMdd;
                              },
                            ),
                            TColumn(
                              title: 'tgl_lpb_datang'.tr(),
                              builder: (data, index) => '-',
                            ),
                            TColumn(
                              title: 'tgl_sample'.tr(),
                              builder: (data, index) => '-',
                            ),
                            TColumn(
                              title: 'release_date'.tr(),
                              builder: (data, index) {
                                return data.releaseDate?.yyyyMMdd ?? '-';
                              },
                            ),
                            TColumn(
                              title: 'status'.tr(),
                              builder: (data, index) => data.materialStatus.id,
                            ),
                            TColumn(
                              title: 'leadtime_qc'.tr(),
                              builder: (data, index) => '-',
                            ),
                            TColumn(
                              title: 'keterangan_leadtime'.tr(),
                              builder: (data, index) => '-',
                              // release date - tanggal sample <= leadtime_qc -> ok // not ok
                            ),
                          ],
                        );
                        saveFile(bytes, 'report_release_materials.xlsx');
                      },
                    );
                  },
                  child: BlocBuilder<MaterialReceiveDetailQueryBloc,
                      MaterialReceiveDetailQueryState>(
                    bloc: queryBloc,
                    builder: (context, state) {
                      return LightButtonSmall(
                        action: DataAction.exportExcel,
                        permission: null,
                        status: state.maybeWhen(
                          loading: (_) => Status.progress,
                          orElse: () => null,
                        ),
                        onPressed: () async {
                          if (_startDate != null &&
                              _endDate != null &&
                              _listMaterialGroup.isNotEmpty &&
                              _listWarehouse.isNotEmpty) {
                            queryBloc.add(
                              MaterialReceiveDetailQueryEvent.print(
                                pageOptions: PageOptions.emptyNoLimit(),
                                createdAtGte: _startDate,
                                createdAtLte: _endDate,
                                warehouseIn: _listWarehouse,
                                materialGroupIn: _listMaterialGroup,
                              ),
                            );
                          } else {
                            Toast(context).fail(
                                'You must insert the Date, Material Group & Warehouse');
                          }
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldDatePicker(
                labelText: 'Period Start',
                controller: _startDateController,
                onChanged: (value) {
                  _startDate = value;
                },
              ),
              const SizedBox(height: 12),
              FieldDatePicker(
                labelText: 'Period End',
                controller: _endDateController,
                onChanged: (value) {
                  _endDate = value;
                },
              ),
              const SizedBox(height: 12),
              FDropDownSearchMultiple<WarehouseMaterialReceive>(
                validator: _requiredObjectValidator.call,
                labelText: 'warehouse'.tr(),
                onChanged: (listWarehouse) => _listWarehouse = listWarehouse,
                itemAsString: (warehouse) => warehouse.id,
                selectedItems: _listWarehouse,
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
                                  _listWarehouse.remove(e);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                },
                status: Status.loaded,
                items: WarehouseMaterialReceive.list,
              ),
              const SizedBox(height: 12),
              BlocBuilder<MaterialGroupQueryBloc, MaterialGroupQueryState>(
                bloc: materialGroupBloc,
                builder: (context, state) {
                  return FDropDownSearchMultiple<MaterialGroup>(
                    validator: _requiredObjectValidator.call,
                    labelText: 'material_group'.tr(),
                    items: state.maybeWhen(
                      orElse: () => <MaterialGroup>[],
                      loaded: (materialGroup) => materialGroup.data,
                    ),
                    status: state.maybeWhen(
                      orElse: () => Status.error,
                      loading: (_) => Status.progress,
                      loaded: (_) => Status.loaded,
                    ),
                    onChanged: (listMaterialGroup) {
                      _listMaterialGroup = listMaterialGroup;
                    },
                    itemAsString: (materialGroup) => materialGroup.id,
                    selectedItems: _listMaterialGroup,
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
                                      _listMaterialGroup.remove(e);
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
            ],
          ),
        );
      },
    );
  }
}
