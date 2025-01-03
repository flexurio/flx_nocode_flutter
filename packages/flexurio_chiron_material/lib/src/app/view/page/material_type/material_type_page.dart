import 'package:flexurio_chiron_material/src/app/view/page/material_type/widget/material_type_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MaterialTypePage extends StatelessWidget {
  const MaterialTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.materialType),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: MaterialTypeDataTable.prepare(),
        ),
      ],
    );
  }
}
