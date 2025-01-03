import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order/purchase_order_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_detail.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order_create/widget/material_table_edit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class PurchaseOrderMaterialFormEditPage extends StatefulWidget {
  const PurchaseOrderMaterialFormEditPage._(
    this.purchaseOrderDetails,
    this.purchaseOrder,
  );

  final List<PurchaseOrderDetail> purchaseOrderDetails;
  final PurchaseOrder purchaseOrder;

  static Route<bool?> route({
    required List<PurchaseOrderDetail> purchaseOrderDetails,
    required PurchaseOrder purchaseOrder,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PurchaseOrderBloc()),
        ],
        child: PurchaseOrderMaterialFormEditPage._(
          purchaseOrderDetails,
          purchaseOrder,
        ),
      ),
    );
  }

  @override
  State<PurchaseOrderMaterialFormEditPage> createState() =>
      _PurchaseOrderMaterialFormEditPageState();
}

class _PurchaseOrderMaterialFormEditPageState
    extends State<PurchaseOrderMaterialFormEditPage> {
  final _materials = <int, PurchaseOrderDetail>{};

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.purchaseOrderDetails.length; i++) {
      _materials[i] = widget.purchaseOrderDetails[i];
    }
  }

  void _submit(BuildContext context) {
    if (_materials.isNotEmpty) {
      context.read<PurchaseOrderBloc>().add(
            PurchaseOrderEvent.editDetails(
              purchaseOrder: widget.purchaseOrder,
              details: _materials.values.toList(),
            ),
          );
      return;
    }
    Toast(context).fail('Please provide the price for at least one material');
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.edit;
    final entity = Entity.purchaseOrder;

    return BlocListener<PurchaseOrderBloc, PurchaseOrderState>(
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
          actions: [
            BlocBuilder<PurchaseOrderBloc, PurchaseOrderState>(
              builder: (context, state) {
                return Button(
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  action: DataAction.edit,
                  permission: null,
                  onPressed: () => _submit(context),
                );
              },
            ),
          ],
          children: [
            PurchaseOrderDetailMaterialTableEdit(
              data: widget.purchaseOrderDetails
                  .map((e) => e.toMaterialRequestDetail)
                  .toList(),
              status: Status.loaded,
              onChangedQuantity: (quantity, index) {
                _materials[index] =
                    _materials[index]!.copyWith(quantity: quantity);
              },
              onChangedPrice: (price, materialRequestDetail, index) {
                _materials[index] = _materials[index]!.copyWith(price: price);
              },
              materials: _materials,
              temporaryLength: 0,
            ),
          ],
        ),
      ),
    );
  }
}
