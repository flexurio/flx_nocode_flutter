import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialUsageBatchGlobalExportPdfButton extends StatelessWidget {
  const MaterialUsageBatchGlobalExportPdfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'Material Usage Batch Global'.tr(),
      permission: PermissionAccounting.materialUsageBatchGlobalExportPdf,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return MaterialUsageBatchGlobalExportPdfForm.prepare();
          },
        );
      },
    );
  }
}
