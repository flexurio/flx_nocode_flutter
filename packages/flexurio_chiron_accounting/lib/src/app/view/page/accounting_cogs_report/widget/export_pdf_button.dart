import 'package:appointment/constant/company.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
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
    return BlocBuilder<AccountingCogsReportQueryBloc,
        AccountingCogsReportQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: SizedBox.new,
          loaded: (cogs, division, year) {
            return Visibility(
              visible: cogs.isNotEmpty,
              child: Button(
                permission: PermissionAccounting.accountingCogsReportExportPdf,
                action: DataAction.exportPdf,
                onPressed: () async {
                  final pdf = pw.Document()
                    ..addPage(
                      await pdfCogs(
                        cogs,
                        Company.fromId(division.id),
                        year,
                      ),
                    );

                  await Printing.sharePdf(
                    bytes: await pdf.save(),
                    filename: 'COGS_${division}_$year.pdf',
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
