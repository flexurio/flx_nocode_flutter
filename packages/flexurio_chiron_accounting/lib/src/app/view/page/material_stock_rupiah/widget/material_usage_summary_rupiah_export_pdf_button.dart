import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/permission.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_stock_rupiah/widget/material_usage_summary_rupiah_export_pdf_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialUsageSummaryRupiahExportPdfButton extends StatelessWidget {
  const MaterialUsageSummaryRupiahExportPdfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'material_usage_summary'.tr(),
      permission: PermissionAccounting.materialUsageSummaryRupiahExportPdf,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return MaterialUsageSummaryRupiahExportPdfForm.prepare();
          },
        );
      },
    );
  }
}
