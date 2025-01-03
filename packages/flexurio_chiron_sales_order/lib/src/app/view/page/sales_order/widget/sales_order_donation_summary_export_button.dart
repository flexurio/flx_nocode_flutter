import 'sales_order_donation_summary_export_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class SalesOrderDonationSummaryExportButton extends StatelessWidget {
  const SalesOrderDonationSummaryExportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdfWithoutTitle,
      title: 'sales_order_donation_summary'.tr(),
      permission: PermissionProductStock.salesOrderDonationSummaryExportPdf,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return SalesOrderDonationSummaryExportForm.prepare();
          },
        );
      },
    );
  }
}
