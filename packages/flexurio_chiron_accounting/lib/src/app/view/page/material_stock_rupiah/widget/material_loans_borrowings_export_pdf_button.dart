import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialLoansBorrowingsExportPdfButton extends StatelessWidget {
  const MaterialLoansBorrowingsExportPdfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'detailed_summary_of_material_loans_and_borrowings'.tr(),
      permission: PermissionAccounting.materialLoansBorrowingsExportPdf,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return MaterialLoansBorrowingsExportPdfForm.prepare();
          },
        );
      },
    );
  }
}
