import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receive/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InvoiceReceivePage extends StatelessWidget {
  const InvoiceReceivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.invoiceReceive),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: InvoiceReceiveDataTable.prepare(),
        ),
      ],
    );
  }
}
