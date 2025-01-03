import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class PendingRequestsRecapExportButton extends StatelessWidget {
  const PendingRequestsRecapExportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.export,
      title: 'pending_requests_recap'.tr(),
      permission: PermissionProductStock.pendingRequestsRecapExportPdf,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return PendingRequestsRecapExportForm.prepare();
          },
        );
      },
    );
  }
}
