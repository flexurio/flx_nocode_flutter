import 'package:flexurio_chiron_production/src/app/view/page/production_line/widget/production_line_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductionLinePage extends StatelessWidget {
  const ProductionLinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.productionLine),
        const SizedBox(height: 12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ProductionLineDataTable.prepare(),
        ),
      ],
    );
  }
}
