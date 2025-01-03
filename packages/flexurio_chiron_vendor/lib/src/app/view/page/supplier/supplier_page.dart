import 'package:flexurio_chiron_vendor/src/app/view/page/supplier/widget/supplier_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SupplierPage extends StatelessWidget {
  const SupplierPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.supplier),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SupplierDataTable.prepare(),
        ),
      ],
    );
  }
}
