import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/permission.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_stock_rupiah/widget/material_receipt_summary_rupiah_export_pdf_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialReceiptSummaryRupiahExportPdfButton extends StatelessWidget {
  const MaterialReceiptSummaryRupiahExportPdfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'material_receipt_summary'.tr(),
      permission: PermissionAccounting.materialReceiptSummaryRupiahExportPdf,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return MaterialReceiptSummaryRupiahExportPdfForm.prepare();
          },
        );
      },
    );
  }
}
