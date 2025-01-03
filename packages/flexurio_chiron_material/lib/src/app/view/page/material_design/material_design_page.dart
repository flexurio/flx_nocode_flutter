import 'package:flexurio_chiron_material/src/app/view/page/material_design/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialDesignPage extends StatelessWidget {
  const MaterialDesignPage({super.key, required this.isExternal});
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(
          entity: Entity.materialDesign,
          suffixText: isExternal ? ' External' : null,
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: MaterialDesignDataTable.prepare(isExternal: isExternal),
        ),
      ],
    );
  }
}
