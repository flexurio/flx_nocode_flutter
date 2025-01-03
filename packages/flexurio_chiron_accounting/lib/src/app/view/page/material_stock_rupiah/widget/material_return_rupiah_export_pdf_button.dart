import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/material_stock_rupiah/widget/material_return_rupiah_export_pdf_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialReturnRupiahExportPdfButton extends StatelessWidget {
  const MaterialReturnRupiahExportPdfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'material_return'.tr(),
      permission: PermissionAccounting.materialReturnRupiahExportPdf,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return MaterialReturnRupiahExportPdfForm.prepare();
          },
        );
      },
    );
  }
}
