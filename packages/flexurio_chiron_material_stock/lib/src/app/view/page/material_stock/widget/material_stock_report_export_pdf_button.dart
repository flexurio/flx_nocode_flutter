import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialStockReportExportPdfButton extends StatelessWidget {
  const MaterialStockReportExportPdfButton({
    super.key,
    required this.isExternal,
  });
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: EntityMaterialStock.materialStock.title,
      permission: PermissionMaterialStock.materialStockReportExportPdf(
          isExternal: isExternal),
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return MaterialStockReportExportPdfForm.prepare();
          },
        );
      },
    );
  }
}
