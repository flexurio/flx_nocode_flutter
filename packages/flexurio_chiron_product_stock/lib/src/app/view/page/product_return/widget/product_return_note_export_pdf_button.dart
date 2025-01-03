import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
class ProductReturnNoteExportPdfButton extends StatelessWidget {
  const ProductReturnNoteExportPdfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'product_return_note'.tr(),
      permission: PermissionProductStock.productReturnNoteExportPdf,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return ProductReturnNoteExportPdfForm.prepare();
          },
        );
      },
    );
  }
}
