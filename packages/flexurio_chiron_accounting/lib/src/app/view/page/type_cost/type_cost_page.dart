import 'package:flexurio_chiron_accounting/src/app/view/page/type_cost/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TypeCostPage extends StatelessWidget {
  const TypeCostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.typeCost),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TypeCostDataTable.prepare(),
        ),
      ],
    );
  }
}
