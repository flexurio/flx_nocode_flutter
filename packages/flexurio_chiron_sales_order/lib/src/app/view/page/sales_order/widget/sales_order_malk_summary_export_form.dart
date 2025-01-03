import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_malk_summary_query/sales_order_malk_summary_query_bloc.dart';
import '../util/pdf_sales_order_malk_summary_hna.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class SalesOrderMalkSummaryExportForm extends StatefulWidget {
  const SalesOrderMalkSummaryExportForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SalesOrderMalkSummaryQueryBloc(),
        ),
      ],
      child: const SalesOrderMalkSummaryExportForm._(),
    );
  }

  @override
  State<SalesOrderMalkSummaryExportForm> createState() =>
      _SalesOrderMalkSummaryExportFormState();
}

class _SalesOrderMalkSummaryExportFormState
    extends State<SalesOrderMalkSummaryExportForm> {
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
      context.read<SalesOrderMalkSummaryQueryBloc>().add(
            SalesOrderMalkSummaryQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(
                sortBy: 'sales_order_id',
              ),
              startDate: _startDate,
              endDate: _endDate,
              // department: _department,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;
    final entity = Entity.salesOrder;

    return BlocListener<SalesOrderMalkSummaryQueryBloc,
        SalesOrderMalkSummaryQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfSalesOrderMalkSummaryHna(
                  data: pageOptions.data,
                  startDate: _startDate,
                  endDate: _endDate,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Sales_Order_Malk_Summary_All_Hna.pdf',
            );
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${entity.title} Malk Summary',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<SalesOrderMalkSummaryQueryBloc,
              SalesOrderMalkSummaryQueryState>(
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
