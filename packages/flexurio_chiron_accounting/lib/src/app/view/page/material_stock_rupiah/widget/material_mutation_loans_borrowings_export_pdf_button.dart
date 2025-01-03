import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialMutationLoansBorrowingsExportPdfButton extends StatelessWidget {
  const MaterialMutationLoansBorrowingsExportPdfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'mutation_of_material_loans_and_borrowings'.tr(),
      permission: PermissionAccounting.materialMutationLoansBorrowingsExportPdf,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return MaterialMutationLoansBorrowingsExportPdfForm.prepare();
          },
        );
      },
    );
  }
}
