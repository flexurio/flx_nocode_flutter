import 'package:appointment/src/app/util/picker_file.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_material/src/app/model/permission.dart'
    as permission;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive_detail_query/material_receive_detail_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';

class MaterialReceiveDetailExportExcelButton extends StatefulWidget {
  const MaterialReceiveDetailExportExcelButton({super.key});

  static Widget prepare({
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              MaterialReceiveDetailQueryBloc(isExternal: isExternal),
        ),
      ],
      child: MaterialReceiveDetailExportExcelButton(),
    );
  }

  @override
  State<MaterialReceiveDetailExportExcelButton> createState() =>
      _MaterialReceiveDetailExportExcelButtonState();
}

class _MaterialReceiveDetailExportExcelButtonState
    extends State<MaterialReceiveDetailExportExcelButton> {
  final _requiredObjectValidator = RequiredObjectValidator<dynamic>(
    errorText: pleaseFillOutThisField.tr(),
  );
  DateTime? _startDate;
  DateTime? _endDate;

  List<WarehouseMaterialReceive> _listWarehouse = [];
  List<MaterialGroup> _listMaterialGroup = [];

  final _formKey = GlobalKey<FormState>();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    _startDateController.text = _startDate?.yyyyMMdd ?? '';
    _endDateController.text = _endDate?.yyyyMMdd ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<MaterialReceiveDetailQueryBloc>();
    final materialGroupBloc = context.read<MaterialGroupQueryBloc>();

    return LightButtonSmall(
      action: DataAction.exportExcel,
      title: 'material_price_per_supplier'.tr(),
      permission:
          permission.PermissionMaterial.recapMaterialPriceSupplierExportExcel,
      onPressed: () async {
        await _showPeriod(context, queryBloc, materialGroupBloc);
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
          title: 'export_excel'.tr(),
          icon: FontAwesomeIcons.fileExcel,
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
                              title: 'material_id'.tr(),
                              builder: (data, index) => data.material.id,
                            ),
                            TColumn(
                              title: 'material_name'.tr(),
                              builder: (data, index) => data.material.name,
                            ),
                            TColumn(
                              title: 'material_group'.tr(),
                              builder: (data, index) =>
                                  data.materialReceive.materialGroup.id,
                            ),
                            TColumn(
                              title: 'supplier_name'.tr(),
                              builder: (data, index) {
                                return data.materialReceive.purchaseOrder
                                    .supplier.name;
                              },
                            ),
                            TColumn(
                              title: 'price'.tr(),
                              builder: (data, index) =>
                                  (data.quantity * data.price)
                                      .toStringAsFixed(2),
                            ),
                            TColumn(
                              title: 'unit'.tr(),
                              builder: (data, index) => data.materialUnit.id,
                            ),
                          ],
                        );
                        saveFile(bytes, 'recap_material_price_supplier.xlsx');
                      },
                    );
                  },
                  child: BlocBuilder<MaterialReceiveDetailQueryBloc,
                      MaterialReceiveDetailQueryState>(
                    bloc: queryBloc,
                    builder: (context, state) {
                      return Button(
                        action: DataAction.export,
                        permission: permission.PermissionMaterial
                            .recapMaterialPriceSupplierExportExcel,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            queryBloc.add(
                              MaterialReceiveDetailQueryEvent.print(
                                pageOptions: PageOptions.emptyNoLimit(),
                                createdAtGte: _startDate,
                                createdAtLte: _endDate,
                                warehouseIn: _listWarehouse,
                                materialGroupIn: _listMaterialGroup,
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FieldDatePicker(
                  labelText: 'period_start'.tr(),
                  controller: _startDateController,
                  validator: _requiredObjectValidator.call,
                  onChanged: (value) {
                    _startDate = value;
                  },
                ),
                const SizedBox(height: 12),
                FieldDatePicker(
                  labelText: 'period_end'.tr(),
                  controller: _endDateController,
                  validator: _requiredObjectValidator.call,
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
          ),
        );
      },
    );
  }
}
