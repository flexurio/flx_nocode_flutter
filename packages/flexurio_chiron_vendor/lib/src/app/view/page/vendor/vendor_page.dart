import 'package:flexurio_chiron_vendor/src/app/view/page/vendor/widget/vendor_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VendorPage extends StatelessWidget {
  const VendorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.vendor),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: VendorDataTable.prepare(),
        ),
      ],
    );
  }
}
