import 'package:flexurio_chiron_material_stock/src/app/model/entity.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MaterialReceivePage extends StatelessWidget {
  const MaterialReceivePage({super.key, required this.isExternal});

  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(
          entity: EntityMaterialStock.materialReceive,
          suffixText: isExternal ? ' External' : null,
        ),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: MaterialReceiveDataTable.prepare(
            isExternal: isExternal,
          ),
        ),
      ],
    );
  }
}
