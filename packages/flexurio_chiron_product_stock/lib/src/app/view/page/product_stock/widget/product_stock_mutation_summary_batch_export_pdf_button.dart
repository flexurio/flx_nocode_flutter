import 'package:flexurio_chiron_product_stock/src/app/view/page/product_stock/widget/product_stock_mutation_summary_batch_export_pdf_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductStockMutationSummaryBatchExportPdfButton extends StatelessWidget {
  const ProductStockMutationSummaryBatchExportPdfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'Product Stock Mutation Summary Batch',
      permission: null,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return ProductStockMutationSummaryBatchExportPdfForm.prepare();
          },
        );
      },
    );
  }
}
