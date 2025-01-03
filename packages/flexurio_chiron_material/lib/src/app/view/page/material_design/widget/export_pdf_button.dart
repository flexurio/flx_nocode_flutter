import 'package:flexurio_chiron_material/src/app/bloc/material_design_query/material_design_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_design/util/report_pdf.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MaterialDesignExportPdfButton extends StatelessWidget {
  const MaterialDesignExportPdfButton({super.key, required this.isExternal});
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialDesignQueryBloc, MaterialDesignQueryState>(
      bloc: MaterialDesignQueryBloc(isExternal: isExternal)
        ..add(
          MaterialDesignQueryEvent.fetch(
            pageOptions: PageOptions.emptyNoLimit(),
          ),
        ),
      builder: (context, state) {
        return LightButtonSmall(
          action: DataAction.printPDF,
          permission: null,
          status: state.maybeWhen(
            loading: (_) => Status.progress,
            loaded: (_) => Status.loaded,
            orElse: () => Status.error,
          ),
          onPressed: () {
            state.maybeWhen(
              orElse: () {},
              loaded: (materialDesign) async {
                final pdf = pw.Document()
                  ..addPage(
                    await pdfMaterialDesign(materialDesign.data, context),
                  );
                await Printing.sharePdf(
                  bytes: await pdf.save(),
                  filename: 'Material_Design_Report.pdf',
                );
              },
            );
          },
        );
      },
    );
  }
}
