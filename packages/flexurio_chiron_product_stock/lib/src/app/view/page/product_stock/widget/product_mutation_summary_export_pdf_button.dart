import 'package:flexurio_chiron_product_stock/src/app/view/page/product_stock/widget/product_mutation_summary_export_pdf_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductMutationSummaryExportPdfButton extends StatelessWidget {
  const ProductMutationSummaryExportPdfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'Product Mutation Summary',
      permission: null,
      // .tr()
      // permission: PermissionProductStock.productDistributionExportPdf,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return ProductMutationSummaryExportPdfForm.prepare();
          },
        );
      },
    );
  }
}
