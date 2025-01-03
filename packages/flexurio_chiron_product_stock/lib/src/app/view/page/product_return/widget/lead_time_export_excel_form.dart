import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/customer.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/department.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_query/product_return_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LeadTimeExportExcelForm extends StatefulWidget {
  const LeadTimeExportExcelForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductReturnQueryBloc()),
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
      child: const LeadTimeExportExcelForm._(),
    );
  }

  @override
  State<LeadTimeExportExcelForm> createState() =>
      _LeadTimeExportExcelFormState();
}

class _LeadTimeExportExcelFormState extends State<LeadTimeExportExcelForm> {
  final _formKey = GlobalKey<FormState>();
  Department? _department;
  Customer? _customer;
  DateTime? _startDate;
  DateTime? _endDate;

  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ProductReturnQueryBloc>().add(
            ProductReturnQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
              departmentId: _department?.id,
              customerId: _customer?.id,
              createdDateEnd: _startDate,
              createdDateStart: _endDate,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportExcel;
    final entity = Entity.productReturn;

    return BlocListener<ProductReturnQueryBloc, ProductReturnQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) {
            final bytes = simpleExcel<ProductReturn>(
              context: context,
              data: pageOptions.data,
              columns: [
                TColumn(
                  title: 'id'.tr(),
                  builder: (data, index) => data.id,
                ),
                TColumn(
                  title: 'created_at'.tr(),
                  builder: (data, index) => data.createdAt.yMMMdHm,
                ),
                TColumn(
                  title: 'confirm_marketing_at'.tr(),
                  builder: (data, index) =>
                      data.confirmMarketingAt?.yMMMdHm ?? '',
                ),
                TColumn(
                  title: 'confirm_ppic_at'.tr(),
                  builder: (data, index) => data.confirmPpicAt?.yMMMdHm ?? '',
                ),
                TColumn(
                  numeric: true,
                  title: 'number_of_days'.tr(),
                  builder: (data, index) {
                    return data.leadTime?.toString() ?? '';
                  },
                ),
                TColumn(
                  title: 'lead_time'.tr(),
                  builder: (data, index) => data.leadTime == null
                      ? ''
                      : (data.leadTime! > 5 ? 'Not OK' : 'OK'),
                ),
                TColumn(
                  title: 'period'.tr(),
                  numeric: true,
                  builder: (data, index) => data.createdAt.yMMMM,
                ),
              ],
            );
            saveFile(
              bytes,
              'Product-Return-Lead-Time-By-Status-'
              '${flavorConfig.companyName}.xlsx',
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
            onPressed: () {
              Navigator.pop(context);
            },
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<ProductReturnQueryBloc, ProductReturnQueryState>(
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
                    labelText: 'start_date'.tr(),
                    onChanged: (value) {
                      _startDate = value;
                    },
                    initialSelectedDate: _startDate,
                    controller: _startDateController,
                  ),
                  FieldDatePicker(
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
              FDropDownSearchDepartment(
                onChanged: (department) {
                  if (department != null) {
                    _department = department;
                  }
                },
              ),
              const Gap(24),
              FDropDownSearchCustomer(
                onChanged: (customer) {
                  _customer = customer;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
