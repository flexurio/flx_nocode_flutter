import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialStockMutationReportExportPdfButton extends StatelessWidget {
  const MaterialStockMutationReportExportPdfButton({
    super.key,
    required this.isExternal,
  });
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: EntityMaterialStock.materialStockMutation.title,
      permission: PermissionMaterialStock.materialStockMutationReportExportPdf(
          isExternal: isExternal),
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return MaterialStockMutationReportExportPdfForm.prepare();
          },
        );
      },
    );
  }
}
