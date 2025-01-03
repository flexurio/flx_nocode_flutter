import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductDistributionExportPdfButton extends StatelessWidget {
  const ProductDistributionExportPdfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'product_distribution'.tr(),
      permission: PermissionProductStock.productDistributionExportPdf,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return ProductDistributionExportPdfForm.prepare();
          },
        );
      },
    );
  }
}
