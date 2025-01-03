import 'package:flexurio_chiron_company/src/app/view/page/department/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DepartmentPage extends StatelessWidget {
  const DepartmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.department),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DepartmentDataTable.prepare(),
        ),
      ],
    );
  }
}
