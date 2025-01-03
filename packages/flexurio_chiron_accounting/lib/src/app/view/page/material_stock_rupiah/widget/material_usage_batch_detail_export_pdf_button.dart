import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialUsageBatchDetailExportPdfButton extends StatelessWidget {
  const MaterialUsageBatchDetailExportPdfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'Material Usage Batch Detail'.tr(),
      permission: PermissionAccounting.materialUsageBatchDetailExportPdf,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return MaterialUsageBatchDetailExportPdfForm.prepare();
          },
        );
      },
    );
  }
}
