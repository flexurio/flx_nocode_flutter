import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/debt_mutation_report/util/pdf_debt_mutation_report_due_ate.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class DebtMutationReportDueDateExportPdfButton extends StatefulWidget {
  const DebtMutationReportDueDateExportPdfButton({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DebtMutationReportInvoiceDueDateQueryBloc(),
        ),
      ],
      child: const DebtMutationReportDueDateExportPdfButton(),
    );
  }

  @override
  State<DebtMutationReportDueDateExportPdfButton> createState() =>
      _DebtMutationReportDueDateExportPdfButtonState();
}

class _DebtMutationReportDueDateExportPdfButtonState
    extends State<DebtMutationReportDueDateExportPdfButton> {
  DateTime? _startPeriod;
  DateTime? _endPeriod;

  final _startPeriodController = TextEditingController();
  final _endPeriodController = TextEditingController();

  @override
  void initState() {
    _startPeriod = _startPeriod;
    _endPeriod = _endPeriod;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<DebtMutationReportInvoiceDueDateQueryBloc>();
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'Due Date',
      permission: PermissionAccounting.debtMutationReportDueDateExportPdf,
      onPressed: () async {
        await _showFilter(
          context,
          queryBloc,
        );
      },
    );
  }

  Future<void> _showFilter(
    BuildContext context,
    DebtMutationReportInvoiceDueDateQueryBloc queryBloc,
  ) async {
    await showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CardForm(
          popup: true,
          title: 'filter'.tr(),
          icon: Icons.sort,
          actions: [
            Button(
              action: DataAction.cancel,
              permission: null,
              isSecondary: true,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(width: 12),
            BlocListener<DebtMutationReportInvoiceDueDateQueryBloc,
                DebtMutationReportInvoiceDueDateQueryState>(
              bloc: queryBloc,
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (error) => Toast(context).fail(error),
                  loaded: (debtBalanceDetailInvoiceDate) async {
                    final pdf = pw.Document()
                      ..addPage(
                        await pdfDebtMutationReportDueDate(
                          data: debtBalanceDetailInvoiceDate.data,
                        ),
                      );
                    await Printing.sharePdf(
                      bytes: await pdf.save(),
                      filename: 'Debt_Mutation_Due_Date.pdf',
                    );
                  },
                );
              },
              child: BlocBuilder<DebtMutationReportInvoiceDueDateQueryBloc,
                  DebtMutationReportInvoiceDueDateQueryState>(
                bloc: queryBloc,
                builder: (context, state) {
                  return Button.small(
                    action: DataAction.exportPdf,
                    permission: null,
                    onPressed: () {
                      if (_startPeriod != null && _endPeriod != null) {
                        queryBloc.add(
                          DebtMutationReportInvoiceDueDateQueryEvent.fetch(
                            dueDateGte: _startPeriod,
                            dueDateLte: _endPeriod,
                            pageOptions: PageOptions.emptyNoLimit(
                              sortBy: 'supplier_id',
                            ),
                          ),
                        );
                      } else {
                        Toast(context).fail(
                          'You must insert the Start & End Date',
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldDatePicker(
                labelText: 'start_date'.tr(),
                controller: _startPeriodController,
                onChanged: (value) => _startPeriod = value,
              ),
              const SizedBox(height: 12),
              FieldDatePicker(
                labelText: 'end_date'.tr(),
                controller: _endPeriodController,
                onChanged: (value) => _endPeriod = value,
              ),
            ],
          ),
        );
      },
    );
  }
}
