import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive_detail_bloc/material_receive_detail_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/entity.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MaterialReceiveDetailEditForm extends StatefulWidget {
  const MaterialReceiveDetailEditForm({required this.detail, super.key});

  final MaterialReceiveDetail detail;

  static Widget prepare({
    required MaterialReceiveDetail detail,
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MaterialQueryBloc()),
        BlocProvider(
            create: (context) => MaterialReceiveDetailBloc(
                  isExternal: isExternal,
                )),
      ],
      child: MaterialReceiveDetailEditForm(detail: detail),
    );
  }

  @override
  State<MaterialReceiveDetailEditForm> createState() =>
      _MaterialReceiveDetailEditFormState();
}

class _MaterialReceiveDetailEditFormState
    extends State<MaterialReceiveDetailEditForm> {
  final _formKey = GlobalKey<FormState>();
  final _batchNumberController = TextEditingController();
  final _expDate = TextEditingController();
  final _bestDate = TextEditingController();
  final _mfgDate = TextEditingController();
  final _retestDateController = TextEditingController();
  final _qtyPackSizeController = TextEditingController();
  final _shelfLifeController = TextEditingController();
  final _quantityController = TextEditingController();
  final _vatTotalController = TextEditingController();
  final _totalQuantityController = TextEditingController();

  DateTime? _expiredDate;
  DateTime? _manufacturingDate;
  DateTime? _bestBefore;
  DateTime? _retestDate;
  DateTime? _shelfLife;

  late model.Material _material;

  final formatter = NumberFormat.decimalPatternDigits(
    locale: 'en_us',
    decimalDigits: 0,
  );

  String numFormat(num number) {
    return formatter.format(number).replaceAll(',', '.');
  }

  @override
  void initState() {
    _material = widget.detail.material;
    _expiredDate = widget.detail.expiredDate;
    _manufacturingDate = widget.detail.manufacturingDate;
    _bestBefore = widget.detail.bestBefore;
    _retestDate = widget.detail.retestDate;
    _shelfLife = widget.detail.shelfLife;
    _quantityController.text = numFormat(widget.detail.quantity);
    _vatTotalController.text = numFormat(widget.detail.vatTotal);
    _totalQuantityController.text = numFormat(widget.detail.totalQuantity);
    _qtyPackSizeController.text = _material.packSize.toString();
    _batchNumberController.text = widget.detail.batchNo;
    super.initState();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<MaterialReceiveDetailBloc>().add(
            MaterialReceiveDetailEvent.edit(
              materialReceiveDetail: widget.detail,
              batchNo: _batchNumberController.text,
              expiredDate: _expiredDate,
              bestBefore: _bestBefore,
              manufacturingDate: _manufacturingDate,
              shelfLife: _shelfLife,
              retestDate: _retestDate,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.edit;
    final entity = EntityMaterialStock.materialReceive;
    final isRelease =
        widget.detail.materialStatus == MaterialReceiveDetailStatus.release;

    return BlocListener<MaterialReceiveDetailBloc, MaterialReceiveDetailState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: () {
            Navigator.pop(context, true);
            Toast(context).dataChanged(action, entity);
          },
          error: (error) => Toast(context).fail(error),
        );
      },
      child: SingleFormPanel(
        formKey: _formKey,
        action: action,
        entity: entity,
        actions: [
          BlocBuilder<MaterialReceiveDetailBloc, MaterialReceiveDetailState>(
            builder: (context, state) {
              final isProgress = state.maybeWhen(
                orElse: () => false,
                loading: () => true,
              );
              return Button(
                isInProgress: isProgress,
                action: action,
                permission: null,
                onPressed: () => _submit(context),
              );
            },
          ),
        ],
        children: _buildCreateFields(context, isRelease),
      ),
    );
  }

  List<Widget> _buildCreateFields(BuildContext context, bool isRelease) {
    return [
      RowFields(
        children: [
          FDropDownSearchMaterial(
            enabled: false,
            initialValue: widget.detail.material,
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
          FTextFormField(
            enabled: !isRelease,
            labelText: 'batch_no'.tr(),
            controller: _batchNumberController,
          ),
        ],
      ),
      const Gap(24),
      RowFields(
        children: [
          FTextFormField(
            labelText: 'quantity'.tr(),
            validator: requiredValidator.call,
            controller: _quantityController,
            enabled: false,
          ),
          FTextFormField(
            labelText: 'vat_total'.tr(),
            validator: requiredValidator.call,
            controller: _vatTotalController,
            enabled: false,
          ),
        ],
      ),
      const Gap(24),
      FTextFormField(
        labelText: 'total_quantity'.tr(),
        controller: _totalQuantityController,
        enabled: false,
      ),
      const Gap(24),
      RowFields(
        children: [
          FieldDatePicker(
            labelText: 'expired_date'.tr(),
            controller: _expDate,
            minDate: DateTime.now(),
            initialSelectedDate: widget.detail.expiredDate,
            onChanged: (value) => _expiredDate = value,
          ),
          FieldDatePicker(
            labelText: 'best_before'.tr(),
            controller: _bestDate,
            minDate: DateTime.now(),
            initialSelectedDate: widget.detail.bestBefore,
            onChanged: (value) => _bestBefore = value,
          ),
        ],
      ),
      const Gap(24),
      RowFields(
        children: [
          FieldDatePicker(
            labelText: 'mfg_date'.tr(),
            controller: _mfgDate,
            maxDate: DateTime.now(),
            initialSelectedDate: widget.detail.manufacturingDate,
            onChanged: (value) => _manufacturingDate = value,
          ),
          FieldDatePicker(
            enabled: !isRelease,
            labelText: 'retest_date'.tr(),
            controller: _retestDateController,
            minDate: DateTime.now(),
            initialSelectedDate: widget.detail.retestDate,
            onChanged: (value) => _retestDate = value,
          ),
        ],
      ),
      const Gap(24),
      FieldDatePicker(
        labelText: 'shelf_life'.tr(),
        controller: _shelfLifeController,
        minDate: DateTime.now(),
        initialSelectedDate: widget.detail.shelfLife,
        onChanged: (value) => _shelfLife = value,
      ),
    ];
  }
}
