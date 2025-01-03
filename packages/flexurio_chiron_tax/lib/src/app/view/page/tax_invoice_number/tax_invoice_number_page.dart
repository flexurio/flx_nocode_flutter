import 'package:flexurio_chiron_tax/src/app/view/page/tax_invoice_number/widget/tax_invoice_number_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TaxInvoiceNumberPage extends StatelessWidget {
  const TaxInvoiceNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.taxInvoiceNumber),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TaxInvoiceNumberDataTable.prepare(),
        ),
      ],
    );
  }
}
