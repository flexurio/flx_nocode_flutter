import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/product_stock_rupiah/widget/product_stock_rupiah_export_pdf_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductStockRupiahExportPdfButton extends StatelessWidget {
  const ProductStockRupiahExportPdfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'Product Stock Rupiah'.tr(),
      permission: null,
      // TODO: Permission
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return ProductStockRupiahExportPdfForm.prepare();
          },
        );
      },
    );
  }
}
