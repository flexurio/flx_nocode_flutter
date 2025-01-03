import 'package:flexurio_chiron_vendor/src/app/bloc/material_approve_vendor_query/material_approve_vendor_query_bloc.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialApproveVendorExportExcelButton extends StatelessWidget {
  const MaterialApproveVendorExportExcelButton(
      {super.key, required this.isExternal});

  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialApproveVendorQueryBloc,
        MaterialApproveVendorQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: SizedBox.shrink,
          loaded: (materials) {
            return Visibility(
              visible: materials.data.isNotEmpty,
              child: LightButtonSmall(
                action: DataAction.exportExcel,
                permission: PermissionMaterial.materialExportExcel(
                    isExternal: isExternal),
                onPressed: () async {
                  final bytes = excelMaterialApproveVendor(materials.data);
                  saveFile(bytes, 'Material_Approved_Vendor.xlsx');
                },
              ),
            );
          },
        );
      },
    );
  }
}
