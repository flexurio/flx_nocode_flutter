import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return/widget/sales_return_replacement_report_export_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class SalesReturnReplacementReportExportButton extends StatelessWidget {
  const SalesReturnReplacementReportExportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.export,
      title: 'sales_return_replacement_report'.tr(),
      permission: null,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return SalesReturnReplacementReportExportForm.prepare();
          },
        );
      },
    );
  }
}
