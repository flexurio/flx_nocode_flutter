import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialIssueReportExportPdfButton extends StatelessWidget {
  const MaterialIssueReportExportPdfButton({super.key,
    required this.isExternal,
  });
  final bool isExternal;  

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'material_issue'.tr(),
      permission: PermissionMaterialStock.materialIssueReportExportPdf,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return MaterialIssueReportExportPdfForm.prepare(
                isExternal: isExternal,);
          },
        );
      },
    );
  }
}
