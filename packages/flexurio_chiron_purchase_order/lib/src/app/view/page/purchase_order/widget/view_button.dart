import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchaseOrderViewButton extends StatelessWidget {
  const PurchaseOrderViewButton({
    required this.purchaseOrder,
    super.key,
  });

  final PurchaseOrder purchaseOrder;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionPurchaseOrder.purchaseOrderViewMenu,
      action: DataAction.view,
      onPressed: () {
        Navigator.push(
          context,
          PurchaseOrderViewPage.route(
            purchaseOrder: purchaseOrder,
          ),
        ).then((value) {
          if (value ?? false) {
            context
                .read<PurchaseOrderQueryBloc>()
                .add(const PurchaseOrderQueryEvent.fetch());
          }
        });
      },
    );
  }
}
