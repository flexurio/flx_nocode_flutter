import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order/purchase_order_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order_history_query/purchase_order_history_query_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order_create/widget/review_form.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order_view/widget/time_line_history.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class PurchaseOrderViewPage extends StatelessWidget {
  const PurchaseOrderViewPage._(this.purchaseOrder);

  static Route<bool?> route({required PurchaseOrder purchaseOrder}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PurchaseOrderBloc()
              ..add(PurchaseOrderEvent.initialize(purchaseOrder)),
          ),
          BlocProvider(
            create: (context) => PurchaseOrderHistoryQueryBloc()
              ..add(PurchaseOrderHistoryQueryEvent.fetch(purchaseOrder)),
          ),
        ],
        child: PurchaseOrderViewPage._(purchaseOrder),
      ),
    );
  }

  final PurchaseOrder purchaseOrder;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.view;
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
        body: ContentWithRightPanel(
          rightPanel: const HistoryTimeLine(),
          child: SingleFormPanel(
            action: action,
            entity: entity,
            size: SingleFormPanelSize.large,
            children: [
              PurchaseOrderCreateReviewForm(
                onPrevious: () {},
                purchaseOrder: purchaseOrder,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
