import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/permission.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order/widget/purchase_order_reject_export_excel_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class PurchaseOrderRejectExportExcelButton extends StatelessWidget {
  const PurchaseOrderRejectExportExcelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportExcel,
      title: 'purchase_order_reject'.tr(),
      permission: PermissionPurchaseOrder.purchaseOrderRejectExportExcel,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return PurchaseOrderRejectExportExcelForm.prepare();
          },
        );
      },
    );
  }
}
