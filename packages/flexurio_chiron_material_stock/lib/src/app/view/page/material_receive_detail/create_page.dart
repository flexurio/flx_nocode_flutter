import 'package:flexurio_chiron_material/src/app/bloc/material_design_query/material_design_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive/material_receive_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive_detail_bloc/material_receive_detail_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/entity.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_design.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order_detail_query/purchase_order_detail_query_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MaterialReceiveDetailCreatePage extends StatefulWidget {
  const MaterialReceiveDetailCreatePage({
    required this.type,
    required this.showMaterialDesignDropdown,
    super.key,
    this.materialReceiveDetail,
    this.materialOptions,
  });

  final MaterialReceiveType type;
  final MaterialReceiveDetail? materialReceiveDetail;
  final bool showMaterialDesignDropdown;
  final List<Material>? materialOptions;

  static Widget prepare({
    required MaterialReceiveType createType,
    required bool showMaterialDesignDropdown,
    MaterialReceiveDetail? materialReceiveDetail,
    List<Material>? materialOptions,
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialQueryBloc()
            ..add(
              MaterialQueryEvent.fetch(pageOptions: PageOptions.emptyNoLimit()),
            ),
        ),
        BlocProvider(
            create: (context) =>
                MaterialReceiveDetailBloc(isExternal: isExternal)),
        BlocProvider(
            create: (context) => MaterialReceiveBloc(isExternal: isExternal)),
        BlocProvider(
            create: (context) => MaterialDesignQueryBloc(isExternal: false)),
        BlocProvider(
          create: (context) => PurchaseOrderDetailQueryBloc(),
        ),
      ],
      child: MaterialReceiveDetailCreatePage(
        showMaterialDesignDropdown: showMaterialDesignDropdown,
        type: createType,
        materialReceiveDetail: materialReceiveDetail,
        materialOptions: materialOptions,
      ),
    );
  }

  @override
  State<MaterialReceiveDetailCreatePage> createState() =>
      _MaterialReceiveDetailCreatePageState();
}

class _MaterialReceiveDetailCreatePageState
    extends State<MaterialReceiveDetailCreatePage> {
  late DataAction _action;
  final _formKey = GlobalKey<FormState>();
  final _qtyPackSizeController = TextEditingController();

  model.Material? _material;
  MaterialDesign? _design;

  @override
  void initState() {
    _action = DataAction.create;
    super.initState();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final details = PurchaseOrderDetail.empty().copyWith(
        material: _material,
        materialDesign: _design ?? MaterialDesign.empty(),
        quantity: 0,
        productionOrder: ProductionOrder.empty(),
        unit: _material?.materialUnit ?? MaterialUnit.empty(),
      );
      Navigator.pop(context, details);
    }
  }

  Widget _buildSubmitButton() {
    return Button(
      permission: null,
      action: DataAction.add,
      onPressed: () => _submit(context),
    );
  }

  Widget _buildEditButton() {
    return BlocListener<MaterialReceiveBloc, MaterialReceiveState>(
      listener: (context, state) {
        state.maybeWhen(
          initial: (_, __, ___) {
            Toast(context)
                .dataChanged(_action, EntityMaterialStock.materialReceive);
            Navigator.pop(context, true);
          },
          error: (error) {
            Toast(context).fail(error);
          },
          orElse: () {},
        );
      },
      child: _buildSubmitButton(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleFormPanel(
      formKey: _formKey,
      actions: [
        if (_action.isCreate) _buildSubmitButton(),
        if (_action.isEdit) _buildEditButton(),
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
            items: widget.materialOptions,
            initialValue: widget.materialReceiveDetail?.material,
            onChanged: (material) {
              if (material != null) {
                _material = material;
                _qtyPackSizeController.text =
                    material.packSize.toInt().toString();
                context.read<MaterialDesignQueryBloc>().add(
                      MaterialDesignQueryEvent.fetch(
                        pageOptions: PageOptions.emptyNoLimit(),
                        material: material,
                        active: true,
                      ),
                    );
                setState(() => _design = null);
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
              key: ValueKey(_design),
              label: 'design_code'.tr(),
              isRequired: false,
              initialValue: widget.materialReceiveDetail?.materialDesign,
              onChanged: (design) {
                if (design != null) {
                  _design = design;
                }
              },
            ),
        ],
      ),
    ];
  }
}
