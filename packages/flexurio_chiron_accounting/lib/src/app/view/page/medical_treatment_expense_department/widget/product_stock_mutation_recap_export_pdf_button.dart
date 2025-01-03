import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductStockMutationRecapExportPdfButton extends StatelessWidget {
  const ProductStockMutationRecapExportPdfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'product_stock_mutation_recap'.tr(),
      permission: PermissionAccounting.productStockMutationRecapExportPdf,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return ProductStockMutationRecapExportPdfForm.prepare();
          },
        );
      },
    );
  }
}
