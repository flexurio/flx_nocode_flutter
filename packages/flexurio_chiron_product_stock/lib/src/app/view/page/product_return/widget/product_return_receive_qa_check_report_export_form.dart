import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/customer.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/department.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/product.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_receive_report_query/product_return_receive_report_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_receive_report.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return/util/excel_product_return_qa_check_receive_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProductReturnReceiveQaCheckReportExportForm extends StatefulWidget {
  const ProductReturnReceiveQaCheckReportExportForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductReturnReceiveReportQueryBloc(),
        ),
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)
            ..add(
              ProductQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
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
      child: const ProductReturnReceiveQaCheckReportExportForm._(),
    );
  }

  @override
  State<ProductReturnReceiveQaCheckReportExportForm> createState() =>
      _ProductReturnReceiveQaCheckReportExportFormState();
}

enum ReturnStatus {
  musnahkan,
  checkQc,
  releaseGoj,
  releaseKlinik,
}

final _statusItems = ReturnStatus.values.map((status) {
  switch (status) {
    case ReturnStatus.musnahkan:
      return 'MUSNAHKAN';
    case ReturnStatus.checkQc:
      return 'CHECK QC';
    case ReturnStatus.releaseGoj:
      return 'RELEASE GOJ';
    case ReturnStatus.releaseKlinik:
      return 'RELEASE KLINIK';
  }
}).toList();

enum ReturnItem {
  returCn,
  returExpiredDate,
  lainLain,
}

final _returnItems = ReturnItem.values.map((item) {
  switch (item) {
    case ReturnItem.returCn:
      return 'RETUR CN';
    case ReturnItem.returExpiredDate:
      return 'RETUR EXPIRED DATE';
    case ReturnItem.lainLain:
      return 'LAIN LAIN';
  }
}).toList();

class _ProductReturnReceiveQaCheckReportExportFormState
    extends State<ProductReturnReceiveQaCheckReportExportForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _startDate;
  DateTime? _endDate;
  bool _qualityAssurance = true;
  String? _retur;
  String? _status;
  Customer? _customer;
  Department? _department;
  Product? _product;

  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startDate = _startDate;
    _endDate = _endDate;
    _qualityAssurance = true;
    _retur = _retur;
    _status = _status;
    _customer = _customer;
    _department = _department;
    _product = _product;
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ProductReturnReceiveReportQueryBloc>().add(
            ProductReturnReceiveReportQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
              periodStart: _startDate!,
              periodEnd: _endDate!,
              customer: _customer ?? Customer.empty(),
              department: _department ?? Department.empty(),
              product: _product,
              qualityAssurance: _qualityAssurance == 'SUDAH',
              status: _retur == 'LAIN LAIN' ? _status : null,
              transactionTypeIdIn: _retur != 'LAIN LAIN'
                  ? _retur == 'RETUR CN'
                      ? 'R3, R9, R23'
                      : _retur == 'RETUR EXPIRED DATE'
                          ? 'R2, R9, R23'
                          : null
                  : null,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.export;
    final entity = Entity.productReturn;

    return BlocListener<ProductReturnReceiveReportQueryBloc,
        ProductReturnReceiveReportQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final bytes =
                productReturnReceiveQaCheckExcel<ProductReturnReceiveReport>(
              context: context,
              data: pageOptions.data,
            );
            saveFile(bytes, 'Product_Return_Receive_Qa_Check_Report.xlsx');
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
          BlocBuilder<ProductReturnReceiveReportQueryBloc,
              ProductReturnReceiveReportQueryState>(
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
                children: [_buildFieldDatePicker()],
              ),
              const Gap(24),
              RowFields(
                children: [_buildFieldCustomer(), _buildFieldDepartment()],
              ),
              const Gap(24),
              RowFields(
                children: [_buildFieldProduct(), _buildFieldChooseReturn()],
              ),
              const Gap(24),
              RowFields(
                children: [
                  _buildFieldCheckQualityAssurance(),
                  _buildFieldStatus()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFieldCustomer() {
    return FDropDownSearchCustomer(
      isRequired: false,
      onChanged: (customer) {
        if (customer != null) {
          _customer = customer;
        }
      },
    );
  }

  Widget _buildFieldDepartment() {
    return FDropDownSearchDepartment(
      isRequired: false,
      onChanged: (department) {
        if (department != null) {
          _department = department;
        }
      },
    );
  }

  Widget _buildFieldProduct() {
    return FDropDownSearchProduct(
      isRequired: false,
      onChanged: (product) {
        if (product != null) {
          _product = product;
        }
      },
    );
  }

  Widget _buildFieldCheckQualityAssurance() {
    return CheckboxWithText(
      initialValue: _qualityAssurance,
      text: 'check_quality_assurance'.tr(),
      onChanged: (value) {
        _qualityAssurance = _qualityAssurance;
      },
    );
  }

  Widget _buildFieldStatus() {
    return Visibility(
      visible: _retur == 'LAIN LAIN',
      child: FDropDownSearch<String>(
        initialValue: _status,
        labelText: 'status'.tr(),
        items: _statusItems,
        onChanged: (status) {
          if (status != null) {
            _status = status;
          }
        },
        itemAsString: (status) => status,
        validator: requiredObjectValidator.call,
      ),
    );
  }

  Widget _buildFieldChooseReturn() {
    return FDropDownSearch<String>(
      initialValue: _retur,
      labelText: 'choose_return'.tr(),
      items: _returnItems,
      onChanged: (retur) {
        if (retur != null) {
          _retur = retur;
          setState(() {});
        }
      },
      itemAsString: (retur) => retur,
    );
  }

  Widget _buildFieldDatePicker() {
    return RowFields(
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
    );
  }
}
