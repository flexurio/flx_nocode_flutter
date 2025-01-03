import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
// import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
// import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/customer.dart';
// import 'package:appointment/src/app/view/widget/drop_down_items/department.dart';
// import 'package:appointment/src/app/view/widget/drop_down_items/product.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_outstanding_report_query/product_return_outstanding_report_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_outstanding_report.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return/util/pdf_product_return_outstanding_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ProductReturnOutstandingReportExportForm extends StatefulWidget {
  const ProductReturnOutstandingReportExportForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductReturnOutstandingReportQueryBloc(),
        ),
        // BlocProvider(
        //   create: (context) => ProductQueryBloc()..add(
        //     ProductQueryEvent.fetch(
        //       pageOptions: PageOptions.emptyNoLimit(),
        //     ),
        //   ),
        // ),
        // BlocProvider(
        //   create: (context) => DepartmentQueryBloc()..add(
        //     DepartmentQueryEvent.fetch(
        //       pageOptions: PageOptions.emptyNoLimit(),
        //     ),
        //   ),
        // ),
        BlocProvider(
          create: (context) => CustomerQueryBloc()
            ..add(
              CustomerQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: const ProductReturnOutstandingReportExportForm._(),
    );
  }

  @override
  State<ProductReturnOutstandingReportExportForm> createState() =>
      _ProductReturnReceiveReportExportFormState();
}

class _ProductReturnReceiveReportExportFormState
    extends State<ProductReturnOutstandingReportExportForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _startDate;
  DateTime? _endDate;
  String _qualityAssurance = 'SUDAH';
  String? _retur;
  String? _status;
  Customer? _customer;
  // Department? _department;
  // Product? _product;
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
    _qualityAssurance = 'SUDAH';
    _retur = _retur;
    _status = _status;
    _customer = _customer;
    // _department = _department;
    // _product = _product;
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ProductReturnOutstandingReportQueryBloc>().add(
            ProductReturnOutstandingReportQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
              periodStart: _startDate!,
              periodEnd: _endDate!,
              customer: _customer,
              // department: _department!,
              // product: _product,
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

    return BlocListener<ProductReturnOutstandingReportQueryBloc,
        ProductReturnOutstandingReportQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            if (_type == 'EXCEL') {
              final bytes = simpleExcel<ProductReturnOutstandingReport>(
                context: context,
                data: pageOptions.data,
                columns: [
                  TColumn(
                    title: 'created_at'.tr(),
                    builder: (data, index) {
                      return data.createdAt.yMMMd;
                    },
                  ),
                  TColumn(
                    title: 'confirm_ppic_at'.tr(),
                    builder: (data, index) {
                      return data.confirmPpicAt.yMMMd;
                    },
                  ),
                  TColumn(
                    title: 'product_return_id'.tr(),
                    builder: (data, index) {
                      return data.transactionNo;
                    },
                  ),
                  TColumn(
                    title: 'delivery_order_id'.tr(),
                    builder: (data, index) {
                      return data.deliveryOrderId;
                    },
                  ),
                  TColumn(
                    title: 'tax_invoice_number'.tr(),
                    builder: (data, index) {
                      return data.taxInvoiceNo ?? '-';
                    },
                  ),
                  TColumn(
                    title: 'customer_name'.tr(),
                    builder: (data, index) {
                      return data.customerName;
                    },
                  ),
                  TColumn(
                    title: 'reference_no'.tr(),
                    builder: (data, index) {
                      return data.referenceNo;
                    },
                  ),
                  TColumn(
                    title: '${'transaction_type'.tr()} ID',
                    builder: (data, index) {
                      return data.transactionTypeId;
                    },
                  ),
                  TColumn(
                    title: 'period'.tr(),
                    builder: (data, index) {
                      return DateFormat('yyyyMM').format(data.createdAt);
                    },
                  ),
                  TColumn(
                    title: 'product_id'.tr(),
                    builder: (data, index) {
                      return data.productId;
                    },
                  ),
                  TColumn(
                    title: 'product_name'.tr(),
                    builder: (data, index) {
                      return data.productName;
                    },
                  ),
                  TColumn(
                    title: 'quantity_check'.tr(),
                    builder: (data, index) {
                      return data.quantityCheck.format();
                    },
                  ),
                  TColumn(
                    title: 'qty'.tr(),
                    builder: (data, index) {
                      return data.qty;
                    },
                  ),
                  TColumn(
                    title: '${'unit'.tr()} ID',
                    builder: (data, index) {
                      return data.unitId.format();
                    },
                  ),
                  TColumn(
                    title: 'price'.tr(),
                    builder: (data, index) {
                      return data.price.format();
                    },
                  ),
                  TColumn(
                    title: 'subtotal'.tr(),
                    builder: (data, index) {
                      return data.subtotal.format();
                    },
                  ),
                  TColumn(
                    title: '${'batch_no'.tr()} ID',
                    builder: (data, index) {
                      return data.batchNoId;
                    },
                  ),
                  TColumn(
                    title: 'expired_date'.tr(),
                    builder: (data, index) {
                      return data.expirationDate.yMMMd;
                    },
                  ),
                  TColumn(
                    title: 'status'.tr(),
                    builder: (data, index) {
                      return data.status;
                    },
                  ),
                  TColumn(
                    title: 'quality_assurance_checked_at'.tr(),
                    builder: (data, index) {
                      return data.qualityAssuranceCheckDate.yMMMd;
                    },
                  ),
                  TColumn(
                    title: 'product_return_delivery_order_id'.tr(),
                    builder: (data, index) {
                      return data.productReturnDeliveryOrderId ?? '-';
                    },
                  ),
                  TColumn(
                    title: 'product_return_delivery_order_date'.tr(),
                    builder: (data, index) {
                      return data.productReturnDeliveryOrderDate?.yyyyMMdd ??
                          '-';
                    },
                  ),
                  TColumn(
                    title: 'total_leadtime'.tr(),
                    builder: (data, index) {
                      Duration difference =
                          data.createdAt.difference(data.confirmMarketingAt);
                      return difference.inMinutes.toString();
                    },
                  ),
                  TColumn(
                    title: 'keterangan_leadtime'.tr(),
                    builder: (data, index) {
                      Duration difference =
                          data.createdAt.difference(data.confirmMarketingAt);
                      if (difference.inMinutes <= 2400) {
                        return 'OK';
                      } else {
                        return 'NOT OK';
                      }
                    },
                  ),
                  TColumn(
                    title: 'status'.tr(),
                    builder: (data, index) {
                      if (data.productReturnDeliveryOrderId != null) {
                        return 'CLOSE';
                      } else {
                        return 'OPEN';
                      }
                    },
                  ),
                ],
              );
              saveFile(bytes, 'Product_Return_Outstanding_Report.xlsx');
            } else {
              final pdf = pw.Document()
                ..addPage(
                  await pdfProductReturnOutstandingReport(
                    data: pageOptions.data,
                    startDate: _startDate,
                    endDate: _endDate,
                  ),
                );
              await Printing.sharePdf(
                bytes: await pdf.save(),
                filename: 'Product_Return_Outstanding_Report.pdf',
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
          BlocBuilder<ProductReturnOutstandingReportQueryBloc,
              ProductReturnOutstandingReportQueryState>(
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
                    isRequired: false,
                    onChanged: (customer) {
                      if (customer != null) {
                        _customer = customer;
                      }
                    },
                  ),
                  FDropDownSearch<String>(
                    initialValue: _retur,
                    labelText: 'Pilihan Retur',
                    items: const [
                      'RETUR CN',
                      'RETUR EXPIRED DATE',
                      'LAIN LAIN',
                    ],
                    onChanged: (retur) {
                      if (retur != null) {
                        _retur = retur;
                        setState(() {});
                      }
                    },
                    itemAsString: (retur) => retur,
                  ),
                  // FDropDownSearchDepartment(
                  //   onChanged: (department) {
                  //     if (department != null) {
                  //       _department = department;
                  //     }
                  //   },
                  // ),
                ],
              ),
              const Gap(24),
              // RowFields(
              //   children: [
              //     // FDropDownSearchProduct(
              //     //   isRequired: false,
              //     //   onChanged: (product) {
              //     //     if (product != null) {
              //     //       _product = product;
              //     //     }
              //     //   },
              //     // ),
              //   ],
              // ),
              // const Gap(24),
              RowFields(
                children: [
                  FDropDownSearch<String>(
                    initialValue: _qualityAssurance,
                    labelText: 'Check Quality Assurance',
                    items: const ['SUDAH', 'BELUM'],
                    onChanged: (qualityAssurance) {
                      if (qualityAssurance != null) {
                        _qualityAssurance = qualityAssurance;
                      }
                    },
                    itemAsString: (qualityAssurance) => qualityAssurance,
                    validator: requiredObjectValidator.call,
                  ),
                  Visibility(
                    visible: _retur == 'LAIN LAIN',
                    child: FDropDownSearch<String>(
                      initialValue: _status,
                      labelText: 'Status',
                      items: const [
                        'MUSNAHKAN',
                        'CHECK QC',
                        'RELEASE GOJ',
                        'RELEASE KLINIK',
                      ],
                      onChanged: (status) {
                        if (status != null) {
                          _status = status;
                        }
                      },
                      itemAsString: (status) => status,
                      validator: requiredObjectValidator.call,
                    ),
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
