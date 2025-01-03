import 'package:flexurio_chiron_customer/src/app/view/page/customer/widget/customer_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.customer),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CustomerDataTable.prepare(),
        ),
      ],
    );
  }
}
