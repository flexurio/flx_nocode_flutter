import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/permission.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_stock_rupiah/widget/material_receipt_detail_summary_purchase_order_export_pdf_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialReceiptDetailSummaryPurchaseOrderExportPdfButton extends StatelessWidget {
  const MaterialReceiptDetailSummaryPurchaseOrderExportPdfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'summary_of_material_receipt_detail_by_po'.tr(),
      permission: PermissionAccounting.materialReceiptDetailSummaryByPurchaseOrderExportPdf,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return MaterialReceiptDetailSummaryPurchaseOrderExportPdfForm.prepare();
          },
        );
      },
    );
  }
}
