import 'package:flexurio_chiron_accounting/src/app/view/page/budget_type/widget/budget_type_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class BudgetTypePage extends StatelessWidget {
  const BudgetTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        FCard(
          padding: const EdgeInsets.all(18),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: BudgetTypeDataTable.prepare(),
          ),
        ),
      ],
    );
  }
}
