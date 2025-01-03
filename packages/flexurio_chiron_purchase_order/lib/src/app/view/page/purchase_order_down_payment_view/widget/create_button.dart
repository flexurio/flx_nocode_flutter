import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order_down_payment_create/purchase_order_down_payment_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class PurchaseOrderDownPaymentCreateButton extends StatelessWidget {
  const PurchaseOrderDownPaymentCreateButton({
    super.key,
    required this.purchaseOrderId,
    this.onSuccess,
  });

  final String purchaseOrderId;
  final void Function()? onSuccess;

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionPurchaseOrder.purchaseOrderDownPaymentCreate,
      action: DataAction.create,
      onPressed: () async {
        final success = await Navigator.push(
          context,
          PurchaseOrderDownPaymentCreatePage.route(
            purchaseOrderId: purchaseOrderId,
          ),
        );
        if (success ?? false) {
          onSuccess?.call();
        }
      },
    );
  }
}
