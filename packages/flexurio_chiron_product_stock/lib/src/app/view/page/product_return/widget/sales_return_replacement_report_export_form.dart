import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/customer.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/product.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/sales_return_replacement_report_query/sales_return_replacement_report_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/sales_return_replacement_report.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return/util/pdf_sales_return_replacement_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class SalesReturnReplacementReportExportForm extends StatefulWidget {
  const SalesReturnReplacementReportExportForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SalesReturnReplacementReportQueryBloc(),
        ),
        BlocProvider(
          create: (context) => CustomerQueryBloc()
            ..add(
              CustomerQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)
            ..add(
              ProductQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: const SalesReturnReplacementReportExportForm._(),
    );
  }

  @override
  State<SalesReturnReplacementReportExportForm> createState() =>
      _ProductReturnReceiveReportExportFormState();
}

class _ProductReturnReceiveReportExportFormState
    extends State<SalesReturnReplacementReportExportForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _startDate;
  DateTime? _endDate;
  Customer? _customer;
  Product? _product;
  String _type = 'PDF';
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _typeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _type = 'PDF';
    _typeController.text = _type;
    _startDate = _startDate;
    _endDate = _endDate;
    _customer = _customer;
    _product = _product;
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<SalesReturnReplacementReportQueryBloc>().add(
            SalesReturnReplacementReportQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
              periodStart: _startDate!,
              periodEnd: _endDate!,
              customer: _customer!,
              product: _product,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SalesReturnReplacementReportQueryBloc,
        SalesReturnReplacementReportQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            if (_type == 'EXCEL') {
              final bytes = simpleExcel<SalesReturnReplacementReport>(
                context: context,
                data: pageOptions.data,
                columns: [
                  TColumn(
                    title: 'product_return_id'.tr(),
                    builder: (data, index) => data.productReturn.id,
                  ),
                  TColumn(
                    title: 'product_name'.tr(),
                    builder: (data, index) => data.product.name,
                  ),
                  TColumn(
                    title: 'product_id'.tr(),
                    builder: (data, index) => data.product.id,
                  ),
                  TColumn(
                    title: 'unit'.tr(),
                    builder: (data, index) => data.unitId,
                  ),
                  TColumn(
                    title: 'qty'.tr(),
                    builder: (data, index) => data.quantity.format(),
                  ),
                  TColumn(
                    title: 'price'.tr(),
                    builder: (data, index) => data.productPrice.format(),
                  ),
                  TColumn(
                    title: 'total_price'.tr(),
                    builder: (data, index) => data.totalProductPrice.format(),
                  ),
                  TColumn(
                    title: 'quantity_replacement'.tr(),
                    builder: (data, index) {
                      return data.productIssueQuantity.format();
                    },
                  ),
                  TColumn(
                    title: 'price_replacement'.tr(),
                    builder: (data, index) {
                      return data.productIssueProductPrice.format();
                    },
                  ),
                  TColumn(
                    title: 'total_price_replacement'.tr(),
                    builder: (data, index) {
                      return data.productIssueTotalProductPrice.format();
                    },
                  ),
                ],
              );
              saveFile(bytes, 'Sales_Return_Replacement_Report.xlsx');
            } else {
              final pdf = pw.Document()
                ..addPage(
                  await pdfSalesReturnReplacementReport(
                    data: pageOptions.data,
                    startDate: _startDate,
                    endDate: _endDate,
                  ),
                );
              await Printing.sharePdf(
                bytes: await pdf.save(),
                filename: 'Sales_Return_Replacement_Report.pdf',
              );
            }
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${DataAction.export.title} ${Entity.productReturn} Replacement',
        icon: DataAction.export.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<SalesReturnReplacementReportQueryBloc,
              SalesReturnReplacementReportQueryState>(
            builder: (context, state) {
              return Button(
                permission: null,
                isInProgress: state.maybeWhen(
                  orElse: () => false,
                  loading: (_) => true,
                ),
                onPressed: () => _submit(context),
                action: DataAction.export,
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
                  FDropDownSearchCustomer(
                    onChanged: (customer) {
                      if (customer != null) {
                        _customer = customer;
                      }
                    },
                  ),
                  FDropDownSearchProduct(
                    isRequired: false,
                    onChanged: (product) {
                      if (product != null) {
                        _product = product;
                      }
                    },
                  ),
                ],
              ),
              const Gap(24),
              SelectChipField<String>(
                label: 'Document Type',
                getLabel: (type) => type,
                controller: _typeController,
                validator: requiredValidator.call,
                options: const ['PDF', 'EXCEL'],
                onChanged: (type) {
                  _type = type;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
