import 'package:flexurio_chiron_material/src/app/bloc/material_design_query/material_design_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive/material_receive_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive_detail_bloc/material_receive_detail_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/entity.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_design.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class MaterialReceiveDetailTemporaryCreate extends StatefulWidget {
  const MaterialReceiveDetailTemporaryCreate({
    required this.type,
    required this.showMaterialDesignDropdown,
    required this.materialGroup,
    super.key,
    this.materialReceiveDetail,
  });

  final MaterialReceiveType type;
  final MaterialReceiveDetail? materialReceiveDetail;
  final bool showMaterialDesignDropdown;
  final MaterialGroup materialGroup;

  static Widget prepare({
    required MaterialReceiveType createType,
    required bool showMaterialDesignDropdown,
    required MaterialGroup materialGroup,
    MaterialReceiveDetail? materialReceiveDetail,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialQueryBloc()
            ..add(
              MaterialQueryEvent.fetch(
                materialGroup: materialGroup,
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
            create: (context) => MaterialReceiveDetailBloc(isExternal: false)),
        BlocProvider(
            create: (context) => MaterialReceiveBloc(isExternal: false)),
        BlocProvider(
          create: (context) => MaterialDesignQueryBloc(isExternal: false)
            ..add(
              MaterialDesignQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: MaterialReceiveDetailTemporaryCreate(
        materialGroup: materialGroup,
        showMaterialDesignDropdown: showMaterialDesignDropdown,
        type: createType,
        materialReceiveDetail: materialReceiveDetail,
      ),
    );
  }

  @override
  State<MaterialReceiveDetailTemporaryCreate> createState() =>
      _MaterialReceiveDetailTemporaryCreateState();
}

class _MaterialReceiveDetailTemporaryCreateState
    extends State<MaterialReceiveDetailTemporaryCreate> {
  late DataAction _action;
  final _formKey = GlobalKey<FormState>();
  final _qtyPackSizeController = TextEditingController();
  final _batchController = TextEditingController();
  final _quantityController = TextEditingController();
  final _vatTotalController = TextEditingController();
  final _totalController = TextEditingController();

  double _totalQty() {
    return stringDecimalToDouble(_quantityController.text) *
        stringDecimalToDouble(_vatTotalController.text);
  }

  model.Material? _material;
  MaterialDesign? _design;
  DateTime? _expiredDate;
  DateTime? _bestBefore;
  DateTime? _manufacturingDate;
  DateTime? _retestDate;
  DateTime? _shelfLife;

  @override
  void initState() {
    _action = DataAction.create;
    _totalController.text = _totalQty().format();
    super.initState();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final materialReceiveDetail = MaterialReceiveDetail.empty().copyWith(
        id: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        materialDesign: _design,
        material: _material!,
        materialUnit: _material!.materialUnit,
        expiredDate: _expiredDate,
        bestBefore: _bestBefore,
        manufacturingDate: _manufacturingDate,
        retestDate: _retestDate,
        shelfLife: _shelfLife,
        batchNo: _batchController.text,
        quantity: stringDecimalToDouble(_quantityController.text),
        vatTotal: stringToInt(_vatTotalController.text),
        totalQuantity: _totalQty(),
      );
      Navigator.pop(context, materialReceiveDetail);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleFormPanel(
      formKey: _formKey,
      actions: [
        BlocBuilder<MaterialReceiveBloc, MaterialReceiveState>(
          builder: (context, state) {
            return Button(
              permission: null,
              action: DataAction.add,
              onPressed: () => _submit(context),
            );
          },
        ),
      ],
      action: _action,
      entity: EntityMaterialStock.materialReceive,
      children: _buildCreateFields(context),
    );
  }

  List<Widget> _buildCreateFields(BuildContext context) {
    return [
      RowFields(
        children: [
          FDropDownSearchMaterial(
            onChanged: (material) {
              if (material != null) {
                _material = material;
                _qtyPackSizeController.text =
                    material.packSize.toInt().toString();
              }
            },
          ),
          FTextFormField(
            labelText: 'pack_size'.tr(),
            controller: _qtyPackSizeController,
            enabled: false,
          ),
        ],
      ),
      const Gap(24),
      RowFields(
        children: [
          if (widget.showMaterialDesignDropdown)
            FDropDownSearchMaterialDesign(
              label: 'design_code'.tr(),
              isRequired: false,
              initialValue: widget.materialReceiveDetail?.materialDesign,
              onChanged: (design) {
                if (design != null) {
                  _design = design;
                }
              },
            ),
          FTextFormField(
            labelText: 'batch'.tr(),
            controller: _batchController,
          ),
        ],
      ),
      const Gap(24),
      RowFields(
        children: [
          FTextFormField(
            labelText: 'quantity'.tr(),
            controller: _quantityController,
            validator: requiredValidator.call,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r'^[0-9]\d*(\.\d*)?$'),
              ),
            ],
            onChanged: (value) {
              _totalController.text = _totalQty().format();
              setState(() {});
            },
          ),
          FTextFormField(
            labelText: 'vat_total'.tr(),
            controller: _vatTotalController,
            validator: requiredValidator.call,
            inputFormatters: [
              ThousandsFormatter(),
            ],
            onChanged: (value) {
              _totalController.text = _totalQty().format();
              setState(() {});
            },
          ),
        ],
      ),
      const Gap(24),
      FTextFormField(
        labelText: 'Total',
        controller: _totalController,
        enabled: false,
        onChanged: (value) {
          _totalController.text = _totalQty().format();
          setState(() {});
        },
      ),
      const Gap(24),
      RowFields(
        children: [
          FieldDatePicker(
            labelText: 'expired_date'.tr(),
            controller: TextEditingController(),
            onChanged: (value) => _expiredDate = value,
            minDate: DateTime.now(),
          ),
          FieldDatePicker(
            labelText: 'best_before'.tr(),
            controller: TextEditingController(),
            onChanged: (value) => _bestBefore = value,
            minDate: DateTime.now(),
          ),
        ],
      ),
      const Gap(24),
      RowFields(
        children: [
          FieldDatePicker(
            labelText: 'mfg_date'.tr(),
            controller: TextEditingController(),
            maxDate: DateTime.now(),
            onChanged: (value) => _manufacturingDate = value,
          ),
          FieldDatePicker(
            labelText: 'retest_date'.tr(),
            controller: TextEditingController(),
            minDate: DateTime.now(),
            onChanged: (value) => _bestBefore = value,
          ),
        ],
      ),
      const Gap(24),
      FieldDatePicker(
        controller: TextEditingController(),
        minDate: DateTime.now(),
        labelText: 'shelf_life'.tr(),
        onChanged: (value) => _shelfLife = value,
      ),
    ];
  }
}
