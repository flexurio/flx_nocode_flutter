import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return/widget/product_return_stock_report_export_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductReturnStockReportExportButton extends StatelessWidget {
  const ProductReturnStockReportExportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.export,
      title: 'product_return_stock_report'.tr(),
      permission: null,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return ProductReturnStockReportExportForm.prepare();
          },
        );
      },
    );
  }
}
