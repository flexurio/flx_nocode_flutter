import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive/material_receive_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/entity.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_create/widget/confirmation_form.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_create/widget/material_recevice_create_step_3_items_form.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_create/widget/purchase_form.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_create/widget/select_type_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReceiveCreatePage extends StatefulWidget {
  const MaterialReceiveCreatePage({super.key, required this.isExternal});

  final bool isExternal;

  @override
  State<MaterialReceiveCreatePage> createState() =>
      _MaterialReceiveCreatePageState();

  static Widget prepare({
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => MaterialReceiveBloc(isExternal: isExternal)),
        BlocProvider(create: (context) => PurchaseOrderDetailQueryBloc()),
        BlocProvider(create: (context) => PurchaseOrderDetailTemporaryBloc()),
      ],
      child: MaterialReceiveCreatePage(isExternal: isExternal),
    );
  }
}

class _MaterialReceiveCreatePageState extends State<MaterialReceiveCreatePage> {
  var _page = 0;
  late MaterialReceiveType _createType;
  bool _showMaterialDesign = false;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = EntityMaterialStock.materialReceive;

    return BlocListener<MaterialReceiveBloc, MaterialReceiveState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          action: action,
          entity: entity,
          size: SingleFormPanelSize.large,
          children: [
            MultiForm(
              page: _page,
              titles: [
                'type'.tr(),
                'purchase'.tr(),
                'materials'.tr(),
                'review'.tr(),
              ],
              children: [
                MaterialReceiveCreateSelectTypeForm(
                  onNext: _nextPage,
                  createType: _createType,
                  onDropDownChanged: (type) => _createType = type,
                ),
                MaterialReceiveCreatePurchaseForm.prepare(
                  type: _createType,
                  onMaterialGroupSelected: (isVisible) {
                    setState(() => _showMaterialDesign = isVisible);
                  },
                  onNext: _nextPage,
                  onPrevious: _previousPage,
                ),
                MaterialReceiveItemsForm(
                  showMaterialDesign: _showMaterialDesign,
                  createType: _createType,
                  onNext: _nextPage,
                  onPrevious: _previousPage,
                  isExternal: widget.isExternal,
                ),
                BlocBuilder<PurchaseOrderDetailQueryBloc,
                    PurchaseOrderDetailQueryState>(
                  builder: (context, state) {
                    final quantityPurchaseOrder = state.maybeWhen<List<double>>(
                      orElse: () => [],
                      loaded: (details) =>
                          details.map((e) => e.quantity).toList(),
                    );
                    return MaterialReceiveConfirmationForm(
                      purchaseOrderQuantity: quantityPurchaseOrder,
                      onPrevious: _previousPage,
                      action: DataAction.create,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _createType = MaterialReceiveType.purchaseOrder;
  }

  void _nextPage() => setState(() => ++_page);

  void _previousPage() => setState(() => --_page);
}
