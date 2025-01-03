import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/permission.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/pending_requests_recap/widget/pending_requests_recap_global_export_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class PendingRequestsRecapGlobalExportButton extends StatelessWidget {
  const PendingRequestsRecapGlobalExportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'pending_requests_recap_global'.tr() + 'PPIC',
      permission: PermissionProductStock.pendingRequestsRecapGlobalExportPdf,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return PendingRequestsRecapGlobalExportForm.prepare();
          },
        );
      },
    );
  }
}
