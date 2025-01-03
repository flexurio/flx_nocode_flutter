import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductReturnRecapDispositionExportExcelButton extends StatelessWidget {
  const ProductReturnRecapDispositionExportExcelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportExcel,
      title: 'recap_disposition'.tr(),
      permission:
          PermissionProductStock.productReturnRecapDispositionExportExcel,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return RecapDispositionExportExcelForm.prepare();
          },
        );
      },
    );
  }
}
