import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/customer.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/department.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PendingRequestsDetailExportForm extends StatefulWidget {
  const PendingRequestsDetailExportForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PendingRequestsDetailQueryBloc(),
        ),
        BlocProvider(
          create: (context) => DepartmentQueryBloc()
            ..add(
              DepartmentQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => CustomerQueryBloc()
            ..add(
              CustomerQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: const PendingRequestsDetailExportForm._(),
    );
  }

  @override
  State<PendingRequestsDetailExportForm> createState() =>
      _PendingRequestsDetailExportFormState();
}

class _PendingRequestsDetailExportFormState
    extends State<PendingRequestsDetailExportForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _startDate;
  DateTime? _endDate;
  Department? _department;
  Customer? _customer;

  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startDate = _startDate;
    _endDate = _endDate;
    _department = _department;
    _customer = _customer;
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<PendingRequestsDetailQueryBloc>().add(
            PendingRequestsDetailQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
              startDate: _startDate,
              endDate: _endDate,
              department: _department,
              customer: _customer,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;
    final entity = Entity.pendingRequestsDetail;

    return BlocListener<PendingRequestsDetailQueryBloc,
        PendingRequestsDetailQueryState>(
      listener: (context, state) {
        // state.maybeWhen(
        //   orElse: () {},
        //   loaded: (pageOptions) async {
        //     final pdf = pw.Document()..addPage(
        //       await pdfPendingRequestsRecap(
        //         data: pageOptions.data,
        //         startDate: _startDate,
        //         endDate: _endDate,
        //       ),
        //     );
        //     await Printing.sharePdf(
        //       bytes: await pdf.save(),
        //       filename: '${'pending_requests_unserved'.tr()}.pdf',
        //     );
        //   },
        // );
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
          BlocBuilder<PendingRequestsDetailQueryBloc,
              PendingRequestsDetailQueryState>(
            builder: (context, state) {
              return Button(
                permission: null,
                // isInProgress: state.maybeWhen(
                //   orElse: () => false,
                //   loading: (_) => true,
                // ),
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
                  FDropDownSearchCustomer(
                    onChanged: (customer) {
                      if (customer != null) {
                        _customer = customer;
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
