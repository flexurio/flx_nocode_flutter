import 'package:flexurio_chiron_vendor/src/app/bloc/material_approve_vendor_query/material_approve_vendor_query_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/model/material_approved_vendor.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material/src/app/view/page/material_approve_vendor_create/material_approve_vendor_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialApproveVendorUpdateButton extends StatelessWidget {
  const MaterialApproveVendorUpdateButton({
    required this.materialApproved,
    required this.material,
    super.key,
  });

  final MaterialApprovedVendor materialApproved;
  final model.Material material;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.materialApproveVendorListEdit,
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = context.read<MaterialApproveVendorQueryBloc>();
        final success = await Navigator.push(
          context,
          MaterialVendorCreatePage.route(
            material: material,
            materialApproved: materialApproved,
          ),
        );
        if (success ?? false) {
          queryBloc
              .add(MaterialApproveVendorQueryEvent.fetch(material: material));
        }
      },
    );
  }
}
