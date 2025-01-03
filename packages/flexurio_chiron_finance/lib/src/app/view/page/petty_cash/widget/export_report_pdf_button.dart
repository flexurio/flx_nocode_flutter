import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/petty_cash_detail_query/petty_cash_detail_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/petty_cash/util/petty_cash_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PettyCashExportReportPDFButton extends StatefulWidget {
  const PettyCashExportReportPDFButton._();

  static String permission = PermissionFinance.pettyCashViewMenu;

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PettyCashDetailQueryBloc()),
      ],
      child: const PettyCashExportReportPDFButton._(),
    );
  }

  @override
  State<PettyCashExportReportPDFButton> createState() =>
      _PettyCashExportReportPDFButtonState();
}

class _PettyCashExportReportPDFButtonState
    extends State<PettyCashExportReportPDFButton> {
  DateTime? _startDate;
  DateTime? _endDate;
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    _startDateController.text = _startDate?.ddMMyyyy ?? '';
    _endDateController.text = _endDate?.ddMMyyyy ?? '';
    super.initState();
  }

  @override
  dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PettyCashDetailQueryBloc>();
    return LightButtonSmall(
      action: DataAction.exportPdf,
      title: 'petty_cash_report'.tr(),
      permission: PettyCashExportReportPDFButton.permission,
      onPressed: () async {
        await _showPeriod(context, bloc);
      },
    );
  }

  Future<void> _showPeriod(
    BuildContext context,
    PettyCashDetailQueryBloc bloc,
  ) async {
    await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) => CardForm(
        popup: true,
        title: 'select_data'.tr(namedArgs: {'data': 'period'.tr()}),
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
          BlocListener<PettyCashDetailQueryBloc, PettyCashDetailQueryState>(
            bloc: bloc,
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                error: (error) => Toast(context).fail(error),
                loaded: (pettyCashDetail) async {
                  if (pettyCashDetail.data.isEmpty) {
                    Toast(context).fail('No data');
                    return;
                  }

                  final pdf = pw.Document()
                    ..addPage(
                      await reportPettyCash(
                        startDate: _startDate ?? DateTime.now(),
                        endDate: _endDate ?? DateTime.now(),
                        pettyCashDetails: pettyCashDetail.data,
                      ),
                    );
                  await Printing.sharePdf(
                    bytes: await pdf.save(),
                    filename: 'Laporan Pengeluaran Kas.pdf',
                  );
                  Navigator.pop(context);
                },
              );
            },
            child: BlocBuilder<PettyCashDetailQueryBloc,
                PettyCashDetailQueryState>(
              bloc: bloc,
              builder: (context, state) {
                final isProgress = state.maybeWhen(
                  orElse: () => false,
                  loading: () => true,
                );
                return Button(
                  action: DataAction.export,
                  permission: null,
                  isInProgress: isProgress,
                  onPressed: () async {
                    if (_startDate != null && _endDate != null) {
                      bloc.add(
                        PettyCashDetailQueryEvent.fetch(
                          documentReceiveAtStart: _startDate!,
                          documentReceiveAtEnd: _endDate!,
                          pageOptions: PageOptions.emptyNoLimit(
                            sortBy: 'document_receive_at',
                            ascending: true,
                          ),
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
            FieldDatePicker(
              labelText: 'period_start'.tr(),
              controller: _startDateController,
              onChanged: (value) {
                _startDate = value;
              },
            ),
            const SizedBox(height: 12),
            FieldDatePicker(
              labelText: 'period_end'.tr(),
              controller: _endDateController,
              onChanged: (value) {
                _endDate = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
