import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchaseOrderCreateButton extends StatelessWidget {
  const PurchaseOrderCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionPurchaseOrder.purchaseOrderCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<PurchaseOrderQueryBloc>();
        final success = await Navigator.push(
          context,
          PurchaseOrderCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const PurchaseOrderQueryEvent.fetch());
        }
      },
    );
  }
}
