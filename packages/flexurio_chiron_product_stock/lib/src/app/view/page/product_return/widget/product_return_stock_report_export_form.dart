import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/customer.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_receive_report_query/product_return_receive_report_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_receive_report.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return/util/pdf_product_return_stock_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ProductReturnStockReportExportForm extends StatefulWidget {
  const ProductReturnStockReportExportForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductReturnReceiveReportQueryBloc(),
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
      child: const ProductReturnStockReportExportForm._(),
    );
  }

  @override
  State<ProductReturnStockReportExportForm> createState() =>
      _ProductReturnStockReportExportFormState();
}

class _ProductReturnStockReportExportFormState
    extends State<ProductReturnStockReportExportForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _startDate;
  DateTime? _endDate;
  Customer? _customer;
  String _type = 'PDF';

  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _typeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _type = 'PDF';
    _typeController.text = 'PDF';
    _startDate = _startDate;
    _endDate = _endDate;
    _customer = _customer;
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ProductReturnReceiveReportQueryBloc>().add(
            ProductReturnReceiveReportQueryEvent.fetchStock(
              pageOptions: PageOptions.emptyNoLimit(),
              periodStart: _startDate!,
              periodEnd: _endDate!,
              customer: _customer!,
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
            if (_type == 'EXCEL') {
              Map<String, double> totalQtyPerProductReturnId = {};
              for (var item in pageOptions.data) {
                String productReturnId = item.productReturn.id;
                double quantityRemaining = item.quantityRemaining.toDouble();

                if (totalQtyPerProductReturnId.containsKey(productReturnId)) {
                  totalQtyPerProductReturnId[productReturnId] =
                      totalQtyPerProductReturnId[productReturnId]! +
                          quantityRemaining;
                } else {
                  totalQtyPerProductReturnId[productReturnId] =
                      quantityRemaining;
                }
              }
              final bytes = simpleExcel<ProductReturnReceiveReport>(
                context: context,
                data: pageOptions.data,
                columns: [
                  TColumn(
                    title: 'product_id'.tr(),
                    builder: (data, index) => data.productId.id,
                  ),
                  TColumn(
                    title: 'product_return_id'.tr(),
                    builder: (data, index) => data.productReturn.id,
                  ),
                  TColumn(
                    title: 'expired_date'.tr(),
                    builder: (data, index) => data.expirationDate!.yMMMd,
                  ),
                  TColumn(
                    title: 'Status Check QA'.tr(),
                    builder: (data, index) => data.status,
                  ),
                  TColumn(
                    title: 'Confirm PPIC'.tr(),
                    builder: (data, index) {
                      return DateFormat('dd/MM/yyyy').format(
                        data.productReturn.confirmPpicAt ?? DateTime.now(),
                      );
                    },
                  ),
                  TColumn(
                    title: 'batch_no'.tr(),
                    builder: (data, index) => data.batchNo,
                  ),
                  TColumn(
                    title: 'unit'.tr(),
                    builder: (data, index) => data.unitId,
                  ),
                  TColumn(
                    title: 'Quantity Remaining'.tr(),
                    builder: (data, index) => data.quantityRemaining.format(),
                  ),
                  TColumn(
                    title: 'Total Qty Per Product Return ID'.tr(),
                    builder: (data, index) {
                      final totalQty =
                          totalQtyPerProductReturnId[data.productReturn.id] ??
                              0.0;
                      return totalQty.format();
                    },
                  ),
                ],
              );
              saveFile(bytes, 'Product_Return_Stock_Report.xlsx');
            } else {
              final pdf = pw.Document()
                ..addPage(
                  await pdfProductReturnStockReport(
                    data: pageOptions.data,
                    startDate: _startDate,
                    endDate: _endDate,
                  ),
                );
              await Printing.sharePdf(
                bytes: await pdf.save(),
                filename: 'Product_Return_Stock_Report.pdf',
              );
            }
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
                ],
              ),
              const Gap(24),
              RowFields(
                children: [
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
            ],
          ),
        ),
      ),
    );
  }
}
