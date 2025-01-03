import 'package:flexurio_chiron_product_stock/src/app/view/page/product_stock/widget/product_stock_mutation_summary_export_pdf_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductStockMutationSummaryExportPdfButton extends StatelessWidget {
  const ProductStockMutationSummaryExportPdfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'Product Stock Mutation Summary',
      permission: null,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return ProductStockMutationSummaryExportPdfForm.prepare();
          },
        );
      },
    );
  }
}
