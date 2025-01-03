import 'package:flexurio_chiron_finance/src/app/bloc/finance_return_note/finance_return_note_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/finance_return_note/util/pdf_finance_return_note.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ExportPdfButton extends StatelessWidget {
  const ExportPdfButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinanceReturnNoteQueryBloc, FinanceReturnNoteQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: SizedBox.new,
          loaded: (
            returnNotes,
            company,
            customer,
            periodStart,
            periodEnd,
            srpNo,
          ) {
            return Visibility(
              visible: returnNotes.isNotEmpty,
              child: Button(
                permission: Permission.financeReturnNoteExportPdf,
                action: DataAction.exportPdf,
                onPressed: () async {
                  final pdf = pw.Document()
                    ..addPage(
                      await pdfReturnNote(
                        data: returnNotes,
                        periodStart: periodStart,
                        periodEnd: periodEnd,
                        customer: customer,
                        srpNo: srpNo,
                        company: company,
                      ),
                    );

                  final format = DateFormat(DateFormat.YEAR_NUM_MONTH_DAY);
                  final start = format.format(periodStart);
                  final end = format.format(periodEnd);
                  await Printing.sharePdf(
                    bytes: await pdf.save(),
                    filename:
                        'Return_Note_${company.name}_${srpNo}_${start}_$end.pdf'
                            .replaceAll('/', '-'),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
