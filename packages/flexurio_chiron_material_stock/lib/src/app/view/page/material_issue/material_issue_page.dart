import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MaterialIssuePage extends StatelessWidget {
  const MaterialIssuePage({
    super.key,
    required this.isExternal,
  });
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(
          entity: EntityMaterialStock.materialIssue,
          suffixText: isExternal ? ' External' : null,
        ),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: MaterialIssueDataTable.prepare(isExternal: isExternal),
        ),
      ],
    );
  }
}
