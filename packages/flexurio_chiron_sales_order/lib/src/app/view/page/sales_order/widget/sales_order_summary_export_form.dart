import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_summary_query/sales_order_summary_query_bloc.dart';
import '../util/pdf_sales_order_summary_hna.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/department.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class SalesOrderSummaryExportForm extends StatefulWidget {
  const SalesOrderSummaryExportForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SalesOrderSummaryQueryBloc(),
        ),
        BlocProvider(
          create: (context) => DepartmentQueryBloc()
            ..add(
              DepartmentQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: const SalesOrderSummaryExportForm._(),
    );
  }

  @override
  State<SalesOrderSummaryExportForm> createState() =>
      _SalesOrderSummaryExportFormState();
}

class _SalesOrderSummaryExportFormState
    extends State<SalesOrderSummaryExportForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _startDate;
  DateTime? _endDate;
  Department? _department;

  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startDate = _startDate;
    _endDate = _endDate;
    _department = _department;
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<SalesOrderSummaryQueryBloc>().add(
            SalesOrderSummaryQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(
                sortBy: 'sales_order_id',
              ),
              startDate: _startDate,
              endDate: _endDate,
              department: _department,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;
    final entity = Entity.salesOrder;

    return BlocListener<SalesOrderSummaryQueryBloc,
        SalesOrderSummaryQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfSalesOrderSummaryHna(
                  data: pageOptions.data,
                  startDate: _startDate,
                  endDate: _endDate,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Sales_Order_Summary_All_Hna.pdf',
            );
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${entity.title} Summary',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<SalesOrderSummaryQueryBloc, SalesOrderSummaryQueryState>(
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
              const Gap(24),
              RowFields(
                children: [
                  FDropDownSearchDepartment(
                    onChanged: (department) {
                      if (department != null) {
                        _department = department;
                      }
                    },
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
