import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_non_order/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TransactionNonOrderPage extends StatelessWidget {
  const TransactionNonOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.transactionNonOrder),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TransactionNonOrderDataTable.prepare(),
        ),
      ],
    );
  }
}
