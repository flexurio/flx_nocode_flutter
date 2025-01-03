import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_donation_summary_query/sales_order_donation_summary_query_bloc.dart';
import '../util/pdf_sales_order_donation_summary_hna.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class SalesOrderDonationSummaryExportForm extends StatefulWidget {
  const SalesOrderDonationSummaryExportForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SalesOrderDonationSummaryQueryBloc(),
        ),
      ],
      child: const SalesOrderDonationSummaryExportForm._(),
    );
  }

  @override
  State<SalesOrderDonationSummaryExportForm> createState() =>
      _SalesOrderDonationSummaryExportFormState();
}

class _SalesOrderDonationSummaryExportFormState
    extends State<SalesOrderDonationSummaryExportForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _startDate;
  DateTime? _endDate;

  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startDate = _startDate;
    _endDate = _endDate;
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<SalesOrderDonationSummaryQueryBloc>().add(
            SalesOrderDonationSummaryQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(
                sortBy: 'sales_order_id',
              ),
              startDate: _startDate,
              endDate: _endDate,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;
    final entity = Entity.salesOrder;

    return BlocListener<SalesOrderDonationSummaryQueryBloc,
        SalesOrderDonationSummaryQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfSalesOrderDonationSummaryHna(
                  data: pageOptions.data,
                  startDate: _startDate,
                  endDate: _endDate,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'REKAP SO DONASI SELURUH HNA.pdf',
            );
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${entity.title} Donation Summary',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<SalesOrderDonationSummaryQueryBloc,
              SalesOrderDonationSummaryQueryState>(
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
                    labelText: 'start_date'.tr(),
                    onChanged: (value) {
                      _startDate = value;
                    },
                    initialSelectedDate: _startDate,
                    controller: _startDateController,
                  ),
                  FieldDatePicker(
                    validator: requiredObjectValidator.call,
                    labelText: 'end_date'.tr(),
                    onChanged: (value) {
                      _endDate = value;
                    },
                    initialSelectedDate: _endDate,
                    controller: _endDateController,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
