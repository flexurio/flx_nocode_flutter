import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_routine/widget/transaction_routine_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TransactionRoutinePage extends StatelessWidget {
  const TransactionRoutinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.transactionRoutine),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TransactionRoutineDataTable.prepare(),
        ),
      ],
    );
  }
}
