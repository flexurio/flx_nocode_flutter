import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/cost_report_discount/util/pdf_cost_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class CostReportExportPdfButton extends StatefulWidget {
  const CostReportExportPdfButton._({
    required this.dateStart,
    required this.dateEnd,
    required this.departmentId,
  });

  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String? departmentId;

  static Widget prepare({
    required DateTime dateTimeStart,
    required DateTime dateTimeEnd,
    required String? departmentId,
  }) {
    return BlocProvider(
      create: (context) => CostReportQueryBloc(),
      child: CostReportExportPdfButton._(
        dateStart: dateTimeStart,
        dateEnd: dateTimeEnd,
        departmentId: departmentId,
      ),
    );
  }

  @override
  State<CostReportExportPdfButton> createState() =>
      _CostReportExportPdfButtonState();
}

class _CostReportExportPdfButtonState extends State<CostReportExportPdfButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    context.read<CostReportQueryBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CostReportQueryBloc>();

    return BlocListener<CostReportQueryBloc, CostReportQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(await pdfCostReport(data: pageOptions.data));
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Cost-Report.pdf',
            );
          },
        );
      },
      child: BlocBuilder<CostReportQueryBloc, CostReportQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportPdf,
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            permission: PermissionAccounting.costReportExportPdf,
            onPressed: () {
              bloc.add(
                CostReportQueryEvent.fetch(
                  pageOptions:
                      PageOptions.emptyNoLimit(sortBy: 'chart_of_account_id'),
                  startDate: widget.dateStart!,
                  endDate: widget.dateEnd!,
                  department: widget.departmentId,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
