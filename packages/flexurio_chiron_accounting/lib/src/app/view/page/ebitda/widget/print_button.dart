import 'package:flexurio_chiron_accounting/src/app/bloc/ebitda_query/ebitda_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/ebitda/util/pdf_ebitda.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintButton extends StatelessWidget {
  const PrintButton({
    super.key,
    this.isFab = false,
  });

  final bool isFab;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.printPDF;
    return BlocBuilder<EbitdaQueryBloc, EbitdaQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: SizedBox.new,
          loaded: (ebitdaPerArea, period) {
            Future<void> printPdf() async {
              final pdf = pw.Document()
                ..addPage(await pdfEbitda(ebitdaPerArea, period));
              await Printing.sharePdf(
                bytes: await pdf.save(),
                filename: 'EBITDA $period.pdf',
              );
            }

            return Visibility(
              visible: ebitdaPerArea.isNotEmpty,
              child: isFab
                  ? FabMini(
                      action: action,
                      onPressed: printPdf,
                    )
                  : Button(
                      permission: Permission.ebitdaPrint,
                      action: action,
                      onPressed: printPdf,
                    ),
            );
          },
        );
      },
    );
  }
}
