import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_summary/util/pdf_form_a1.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class FormA1ExportPdfButton extends StatefulWidget {
  const FormA1ExportPdfButton({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FormA1QueryBloc(),
        ),
      ],
      child: const FormA1ExportPdfButton(),
    );
  }

  @override
  State<FormA1ExportPdfButton> createState() => _FormA1ExportPdfButtonState();
}

class _FormA1ExportPdfButtonState extends State<FormA1ExportPdfButton> {
  DateTime? _startDate;
  DateTime? _endDate;
  String? _division;

  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _divisionController = TextEditingController();

  @override
  void initState() {
    _startDateController.text = _startDate?.yyyyMMdd ?? '';
    _endDateController.text = _endDate?.yyyyMMdd ?? '';
    _divisionController.text = _division ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<FormA1QueryBloc>();

    return LightButtonSmall(
      action: DataAction.exportPdf,
      permission: PermissionFinance.invoiceSummaryExportPdf,
      onPressed: () async {
        await _showPeriod(context, queryBloc);
      },
    );
  }

  Future<void> _showPeriod(
    BuildContext context,
    FormA1QueryBloc queryBloc,
  ) async {
    await showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CardForm(
          popup: true,
          title: 'Select Period',
          icon: Icons.calendar_month_rounded,
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
            BlocListener<FormA1QueryBloc, FormA1QueryState>(
              bloc: queryBloc,
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (error) => Toast(context).fail(error),
                  loaded: (formA1) async {
                    final pdf = pw.Document()
                        ..addPage(
                          await pdfFormA1(
                            data: formA1.data,
                            startDate: _startDate ?? DateTime.now(),
                            endDate: _endDate ?? DateTime.now(), 
                            primaryColor: Theme.of(context).colorScheme.primary,
                          ),
                        );
                      await Printing.sharePdf(
                        bytes: await pdf.save(),
                        filename: 'Form_A1.pdf',
                      );
                  },
                );
              },
              child: BlocBuilder<FormA1QueryBloc, FormA1QueryState>(
                bloc: queryBloc,
                builder: (context, state) {
                  return Button.small(
                    action: DataAction.exportPdf,
                    permission: null,
                    onPressed: () {
                      if (_startDate != null && _endDate != null) {
                        queryBloc.add(
                          FormA1QueryEvent.fetch(
                            divisi: _divisionController.text,
                            periodStart: _startDate,
                            periodEnd: _endDate,
                            pageOptions: PageOptions.empty(sortBy: 'date, C.name'),
                          ),
                        );
                      } else {
                        Toast(context).fail('You must insert the Date');
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
              FTextFormField(
                labelText: 'division'.tr(),
                controller: _divisionController,
                validator: requiredValidator.call,
              ),
              const SizedBox(height: 12),
              FieldDatePicker(
                labelText: 'Period Start',
                controller: _startDateController,
                onChanged: (value) {
                  _startDate = value;
                },
              ),
              const SizedBox(height: 12),
              FieldDatePicker(
                labelText: 'Period End',
                controller: _endDateController,
                onChanged: (value) {
                  _endDate = value;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
