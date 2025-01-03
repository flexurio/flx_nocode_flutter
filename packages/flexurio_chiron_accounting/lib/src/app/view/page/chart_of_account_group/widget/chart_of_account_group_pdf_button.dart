import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ChartOfAccountGroupExportPDFButton extends StatelessWidget {
  const ChartOfAccountGroupExportPDFButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChartOfAccountGroupQueryBloc,
        ChartOfAccountGroupQueryState>(
      builder: (context, state) {
        final status = state.maybeWhen(
          loading: () => Status.progress,
          loaded: (_) => Status.loaded,
          orElse: () => Status.error,
        );
        return LightButtonSmall(
          action: DataAction.printPDF,
          permission: PermissionAccounting.chartOfAccountGroupExportPdf,
          status: status,
          onPressed: () {
            state.maybeWhen(
              orElse: () => null,
              loaded: (data) async {
                final pdf = pw.Document()..addPage(await pdfCoaGroup(data));
                await Printing.sharePdf(
                  bytes: await pdf.save(),
                  filename: 'Chart_of_Account_Group_Report.pdf',
                );
              },
            );
          },
        );
      },
    );
  }
}
