import 'dart:typed_data';

import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/customer.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/department.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/product.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_receive_report_query/product_return_receive_report_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_receive_report.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return/util/excel_product_return_receive_report.dart'
    as pr;
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return/util/excel_product_return_receive_report.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return/util/pdf_product_return_receive_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ProductReturnReceiveReportExportForm extends StatefulWidget {
  const ProductReturnReceiveReportExportForm._();

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
      child: const ProductReturnReceiveReportExportForm._(),
    );
  }

  @override
  State<ProductReturnReceiveReportExportForm> createState() =>
      _ProductReturnReceiveReportExportFormState();
}

class _ProductReturnReceiveReportExportFormState
    extends State<ProductReturnReceiveReportExportForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _startDate;
  DateTime? _endDate;
  String _qualityAssurance = 'SUDAH';
  String? _retur;
  String? _status;
  Customer? _customer;
  Department? _department;
  Product? _product;
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
            if (_type == 'EXCEL') {
              final bytes =
                  productReturnReceiveExcel<ProductReturnReceiveReport>(
                context: context,
                data: pageOptions.data,
                startDate: _startDate!,
                endDate: _endDate!,
                columns: [
                  pr.TColumn(
                    title: 'created_at'.tr(),
                    builder: (data, index) {
                      return data.productReturn.createdAt.yMMMd;
                    },
                  ),
                  pr.TColumn(
                    title: 'product_return_id'.tr(),
                    builder: (data, index) => data.productReturn.id,
                  ),
                  pr.TColumn(
                    title: 'division'.tr(),
                    builder: (data, index) => 'PT. METISKA FARMA',
                  ),
                  pr.TColumn(
                    title: 'delivery_order_id'.tr(),
                    builder: (data, index) => data.deliveryOrderId,
                  ),
                  pr.TColumn(
                    title: 'customer_id'.tr(),
                    builder: (data, index) => data.productReturn.customer.id,
                  ),
                  pr.TColumn(
                    title: 'reference_no'.tr(),
                    builder: (data, index) => data.productReturn.referenceNo,
                  ),
                  pr.TColumn(
                    title: 'return_type'.tr(),
                    builder: (data, index) {
                      return data.productReturn.transactionType.name;
                    },
                  ),
                  pr.TColumn(
                    title: 'product_name'.tr(),
                    builder: (data, index) => data.productId.name,
                  ),
                  pr.TColumn(
                    title: 'QTY',
                    builder: (data, index) => data.quantity.format(),
                  ),
                  pr.TColumn(
                    title: 'unit'.tr(),
                    builder: (data, index) => data.unitId,
                  ),
                  pr.TColumn(
                    title: 'batch_no'.tr(),
                    builder: (data, index) => data.batchNo,
                  ),
                  pr.TColumn(
                    title: 'expired_date'.tr(),
                    builder: (data, index) => data.expirationDate!.yMMMd,
                  ),
                  // TColumn(
                  //   title: 'status'.tr(),
                  //   builder: (data, index) {
                  //     final status = calculateStatus(
                  //       data.productReturn.confirmPpicAt,
                  //       data.qualityAssuranceCheckDate,
                  //     );
                  //     return status;
                  //   },
                  // ),
                ],
              );
              saveFile(bytes, 'Product_Return_Receive_Report.xlsx');
            } else {
              final pdf = pw.Document()
                ..addPage(
                  await pdfProductReturnReceiveReport(
                    data: pageOptions.data,
                    startDate: _startDate,
                    endDate: _endDate,
                  ),
                );

              showDialogViewPDF(
                context: context,
                pdfData: await pdf.save(),
                actions: [
                  LightButtonSmall(
                    action: DataAction.printPDF,
                    permission: null,
                    onPressed: () {
                      showDialog<bool?>(
                          context: context,
                          builder: (context) {
                            return CardConfirmation(
                              isProgress: false,
                              action: DataAction.printPDF,
                              data: Entity.productReturn,
                              onConfirm: () async {
                                await Printing.sharePdf(
                                  bytes: await pdf.save(),
                                  filename: 'Product_Return_Receive_Report.pdf',
                                );
                                Navigator.pop(context, true);
                              },
                            );
                          }).then((value) {
                        if (value ?? false) {
                          Navigator.pop(context, true);
                        }
                      });
                    },
                  ),
                ],
              );
            }
            if (_type == 'EXCEL') {
              Navigator.pop(context);
            }
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
                    isRequired: false,
                    onChanged: (customer) {
                      if (customer != null) {
                        _customer = customer;
                      }
                    },
                  ),
                  FDropDownSearchDepartment(
                    isRequired: false,
                    onChanged: (department) {
                      if (department != null) {
                        _department = department;
                      }
                    },
                  ),
                ],
              ),
              const Gap(24),
              RowFields(
                children: [
                  FDropDownSearchProduct(
                    isRequired: false,
                    onChanged: (product) {
                      if (product != null) {
                        _product = product;
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
                ],
              ),
              const Gap(24),
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

String calculateStatus(
    DateTime? confirmPpicAt, DateTime? qualityAssuranceCheckDate) {
  if (confirmPpicAt == null) {
    return '-';
  }

  final workDaysDifference =
      calculateWorkDays(confirmPpicAt, qualityAssuranceCheckDate);

  if (workDaysDifference <= 2) {
    return 'MS';
  } else {
    return 'TMS';
  }
}

int calculateWorkDays(
    DateTime confirmPpicAt, DateTime? qualityAssuranceCheckDate) {
  if (qualityAssuranceCheckDate == null) {
    return 0;
  }

  final difference = qualityAssuranceCheckDate.difference(confirmPpicAt).inDays;

  return difference;
}

void showDialogViewPDF({
  required BuildContext context,
  required Uint8List pdfData,
  required List<Widget> actions,
}) {
  showDialog<bool?>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Container(
              width: 1000,
              child: SfPdfViewer.memory(pdfData),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.all(6),
                color: const Color(0XFFEDE6F3),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actions,
                ),
              ),
            )
          ],
        ),
      );
    },
  ).then((value) {
    if (value ?? false) {
      Navigator.pop(context);
    }
  });
}
