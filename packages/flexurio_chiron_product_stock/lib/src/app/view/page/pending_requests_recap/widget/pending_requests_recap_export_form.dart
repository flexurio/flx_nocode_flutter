import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/department.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/pending_requests_recap_query/pending_requests_recap_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/pending_requests_recap/util/pdf_pending_requests_recap.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PendingRequestsRecapExportForm extends StatefulWidget {
  const PendingRequestsRecapExportForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PendingRequestsRecapQueryBloc(),
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
      child: const PendingRequestsRecapExportForm._(),
    );
  }

  @override
  State<PendingRequestsRecapExportForm> createState() =>
      _PendingRequestsRecapExportFormState();
}

class _PendingRequestsRecapExportFormState
    extends State<PendingRequestsRecapExportForm> {
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
      context.read<PendingRequestsRecapQueryBloc>().add(
            PendingRequestsRecapQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
              startDate: _startDate,
              endDate: _endDate,
              department: _department,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.export;
    final entity = Entity.pendingRequestsRecap;

    return BlocListener<PendingRequestsRecapQueryBloc,
        PendingRequestsRecapQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfPendingRequestsRecap(
                  data: pageOptions.data,
                  startDate: _startDate,
                  endDate: _endDate,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Pending_Requests_Recap.pdf',
            );
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} ${entity.title}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<PendingRequestsRecapQueryBloc,
              PendingRequestsRecapQueryState>(
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
