import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material/src/app/view/page/material_approve_vendor/material_approve_vendor_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialApproveVendorDetailButton extends StatelessWidget {
  const MaterialApproveVendorDetailButton({
    required this.material,
    super.key,
  });

  final model.Material material;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.materialApproveVendorListViewMenu,
      action: DataAction.showApproveVendorList,
      onPressed: () async {
        await Navigator.push(
          context,
          MaterialApproveVendorPage.route(material: material),
        );
      },
    );
  }
}
