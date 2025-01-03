import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductReturnReceiveReportExportButton extends StatelessWidget {
  const ProductReturnReceiveReportExportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.export,
      title: 'product_return_receive_report'.tr(),
      permission: PermissionProductStock.productReturnReceiveExportExcel,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return ProductReturnReceiveReportExportForm.prepare();
          },
        );
      },
    );
  }
}
