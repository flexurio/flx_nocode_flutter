import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive/widget/product_receive_recap_export_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductReceiveRecapExportButton extends StatelessWidget {
  const ProductReceiveRecapExportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.export,
      title: 'product_receive_recap'.tr(),
      permission: null,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return ProductReceiveRecapExportForm.prepare();
          },
        );
      },
    );
  }
}
