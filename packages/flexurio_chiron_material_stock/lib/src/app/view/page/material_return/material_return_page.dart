import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MaterialReturnPage extends StatelessWidget {
  const MaterialReturnPage({required this.isExternal, super.key});

  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: isExternal ? Entity.materialReturnExternal : Entity.materialReturn),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: MaterialReturnDataTable.prepare(isExternal: isExternal),
        ),
      ],
    );
  }
}
