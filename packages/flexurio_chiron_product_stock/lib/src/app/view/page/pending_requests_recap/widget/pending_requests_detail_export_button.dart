import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class PendingRequestsDetailExportButton extends StatelessWidget {
  const PendingRequestsDetailExportButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'pending_requests_detail'.tr(),
      permission:
          PermissionProductStock.pendingRequestsDetailExportPdf,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return PendingRequestsDetailExportForm.prepare();
          },
        );
      },
    );
  }
}
