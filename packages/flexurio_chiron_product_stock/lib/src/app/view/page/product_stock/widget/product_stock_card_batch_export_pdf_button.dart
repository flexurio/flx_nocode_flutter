import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductStockCardBatchExportPdfButton extends StatelessWidget {
  const ProductStockCardBatchExportPdfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'Product Stock Card Batch',
      permission: PermissionProductStock.productStockCardBatchExportPdf,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return ProductStockCardBatchExportPdfForm.prepare();
          },
        );
      },
    );
  }
}
