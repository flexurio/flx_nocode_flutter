import 'package:flexurio_chiron_production/src/app/view/page/production_machine/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductionMachinePage extends StatelessWidget {
  const ProductionMachinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.productionMachine),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ProductionMachineDataTable.prepare(),
        ),
      ],
    );
  }
}
