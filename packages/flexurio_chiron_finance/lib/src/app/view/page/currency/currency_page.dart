import 'package:flexurio_chiron_finance/src/app/view/page/currency/widget/currency_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CurrencyPages extends StatelessWidget {
  const CurrencyPages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.currency),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CurrencyDataTable.prepare(),
        ),
      ],
    );
  }
}
