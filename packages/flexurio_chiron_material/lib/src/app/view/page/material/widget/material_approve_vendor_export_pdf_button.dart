import 'package:flexurio_chiron_vendor/src/app/bloc/material_approve_vendor_query/material_approve_vendor_query_bloc.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MaterialApprovedVendorPrintPDFButton extends StatelessWidget {
  const MaterialApprovedVendorPrintPDFButton(
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
            Future<void> printPdf() async {
              final pdf = pw.Document()
                ..addPage(await pdfMaterialApprovedVendor(materials.data));
              await Printing.sharePdf(
                bytes: await pdf.save(),
                filename: 'Material_Approved_Vendor.pdf',
              );
            }

            return Visibility(
              visible: materials.data.isNotEmpty,
              child: LightButtonSmall(
                action: DataAction.printPDF,
                permission: PermissionMaterial.materialExportPdf(
                    isExternal: isExternal),
                onPressed: printPdf,
              ),
            );
          },
        );
      },
    );
  }
}
