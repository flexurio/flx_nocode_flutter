import 'package:flexurio_chiron_material/src/app/view/page/material_group/widget/material_group_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MaterialGroupPage extends StatelessWidget {
  const MaterialGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.materialGroup),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: MaterialGroupDataTable.prepare(),
        ),
      ],
    );
  }
}
