import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductStockWarehouseExportPdfButton extends StatelessWidget {
  const ProductStockWarehouseExportPdfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'warehouse'.tr(),
      permission: PermissionProductStock.productStockWarehouseExportPdf,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return ProductStockWarehouseExportPdfForm.prepare();
          },
        );
      },
    );
  }
}
