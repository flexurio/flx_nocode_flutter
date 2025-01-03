import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return/widget/product_return_outstanding_report_export_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductReturnOutstandingReportExportButton extends StatelessWidget {
  const ProductReturnOutstandingReportExportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      // TODO(putra): pdf or excel?
      action: DataAction.export,
      title: 'product_return_outstanding_report'.tr(),
      // TODO(putra): add permission
      permission: null,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return ProductReturnOutstandingReportExportForm.prepare();
          },
        );
      },
    );
  }
}
