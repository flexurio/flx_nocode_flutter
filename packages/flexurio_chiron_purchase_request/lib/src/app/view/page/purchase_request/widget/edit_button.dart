import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/purchase_request_create/purchase_request_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class PurchaseRequestEditButton extends StatelessWidget {
  const PurchaseRequestEditButton(
    this.materialRequest, {
    super.key,
    required this.refresh,
  });

  final MaterialRequest materialRequest;
  final void Function() refresh;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.purchaseRequestEdit,
      action: DataAction.edit,
      onPressed: () async {
        await Navigator.push(
          context,
          MaterialRequestCreatePage.route(materialRequest: materialRequest),
        );
        refresh();
      },
    );
  }
}
