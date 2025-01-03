import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialIssuePrintButon extends StatelessWidget {
  const MaterialIssuePrintButon({super.key});

  @override
  Widget build(BuildContext context) {
    const action = DataAction.printPDF;
    return IconButtonSmall(
      permission: PermissionMaterialStock.materialIssuePrint,
      action: action,
      onPressed: () {},
    );
  }
}
