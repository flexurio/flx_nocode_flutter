import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialDuplicateExternalButton extends StatelessWidget {
  const MaterialDuplicateExternalButton({
    required this.material,
    super.key,
  });

  final model.Material material;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionMaterial.materialCreate(isExternal: true),
      action: DataAction.duplicate,
      tooltipMessage: 'Duplicate Material External',
      onPressed: () async {
        await Navigator.push(
          context,
          MaterialCreatePage.route(duplicate: material, isExternal: true),
        );
      },
    );
  }
}
