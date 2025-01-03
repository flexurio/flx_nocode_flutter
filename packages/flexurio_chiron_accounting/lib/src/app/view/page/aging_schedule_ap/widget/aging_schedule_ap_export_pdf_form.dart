import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/aging_schedule_ap_query/aging_schedule_ap_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/aging_schedule_ap/util/pdf_aging_schedule_ap.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class AgingScheduleAPExportPdfForm extends StatefulWidget {
  const AgingScheduleAPExportPdfForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AgingScheduleAPQueryBloc(),
        ),
        // BlocProvider(
        //   create: (context) => MaterialGroupQueryBloc()
        //     ..add(const MaterialGroupQueryEvent.fetch()),
        // ),
      ],
      child: const AgingScheduleAPExportPdfForm._(),
    );
  }

  @override
  State<AgingScheduleAPExportPdfForm> createState() => _AgingScheduleAPExportPdfFormState();
}

class _AgingScheduleAPExportPdfFormState extends State<AgingScheduleAPExportPdfForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _startDate;
  DateTime? _endDate;
  
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    // _materialGroup = _materialGroup;
    _startDate = _startDate;
    _endDate = _endDate;
    super.initState();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AgingScheduleAPQueryBloc>().add(
        AgingScheduleAPQueryEvent.fetch(
          pageOptions: PageOptions.emptyNoLimit(sortBy: ''),
          startDate: _startDate,
          endDate: _endDate,
          // materialGroup: _materialGroup,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;

    return BlocListener<AgingScheduleAPQueryBloc, AgingScheduleAPQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()..addPage(
              await pdfAgingScheduleAP(
                data: pageOptions.data,
              ),
            );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'AgingAP1.pdf',
            );
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} ${'aging_schedule_ap'.tr()}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<AgingScheduleAPQueryBloc, AgingScheduleAPQueryState>(
            builder: (context, state) {
              return Button(
                permission: null,
                isInProgress: state.maybeWhen(
                  orElse: () => false,
                  loading: (_) => true,
                ),
                onPressed: () => _submit(context),
                action: action,
              );
            },
          ),
        ],
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowFields(
                children: [
                  FieldDatePicker(
                    validator: requiredObjectValidator.call,
                    labelText: 'date'.tr(),
                    controller: _startDateController,
                    onChanged: (value) => _startDate = value,
                  ),
                  FieldDatePicker(
                    labelText: 'end_date'.tr(),
                    validator: requiredObjectValidator.call,
                    controller: _endDateController,
                    onChanged: (value) => _endDate = value,
                  ),
                ],
              ),
              const Gap(24),
            ],
          ),
        ),
      ),
    );
  }
}
