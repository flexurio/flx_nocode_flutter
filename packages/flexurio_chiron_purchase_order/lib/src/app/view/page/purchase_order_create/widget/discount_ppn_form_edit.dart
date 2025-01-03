import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order/purchase_order_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order_create/widget/discount_ppn_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class PurchaseOrderDiscountPpnFormEditPage extends StatelessWidget {
  const PurchaseOrderDiscountPpnFormEditPage._(this.purchaseOrder);

  static Route<bool?> route({
    required PurchaseOrder purchaseOrder,
    required PurchaseOrderBloc purchaseOrderBloc,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => purchaseOrderBloc,
          ),
        ],
        child: PurchaseOrderDiscountPpnFormEditPage._(purchaseOrder),
      ),
    );
  }

  final PurchaseOrder purchaseOrder;

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
          children: [
            PurchaseOrderCreateDiscountPpnForm(
              onNext: () {},
              onPrevious: () {},
              purchaseOrder: purchaseOrder,
            ),
          ],
        ),
      ),
    );
  }
}
