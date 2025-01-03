import 'package:flexurio_chiron_presence/src/app/bloc/presence_monthly_per_employee_query/presence_monthly_per_employee_query_bloc.dart';
import 'package:flexurio_chiron_presence/src/app/view/page/presence_monthly_report_per_employee/util/pdf.dart';
import 'package:appointment/src/app/view/widget/file_name.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ExportPdfButton extends StatelessWidget {
  const ExportPdfButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PresenceMonthlyPerEmployeeQueryBloc,
        PresenceMonthlyPerEmployeeQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: SizedBox.new,
          loaded: (
            presences,
            dateTime,
            employee,
          ) {
            return Visibility(
              visible: presences.isNotEmpty,
              child: Button(
                permission:
                    Permission.presenceMonthlyReportPerEmployeeExportPdf,
                action: DataAction.exportPdf,
                onPressed: () async {
                  final pdf = pw.Document()
                    ..addPage(
                      await pdfPresencePerEmployee(
                        presences: presences,
                        dateTime: dateTime,
                        employee: employee,
                      ),
                    );

                  await Printing.sharePdf(
                    bytes: await pdf.save(),
                    filename: FileName.presencePerEmployee(
                      Extension.pdf,
                      employee,
                      dateTime,
                    ),
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
