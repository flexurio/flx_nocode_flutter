import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/product.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive_recap_query/product_receive_recap_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive_recap.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive/util/pdf_product_receive_recap.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ProductReceiveRecapExportForm extends StatefulWidget {
  const ProductReceiveRecapExportForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductReceiveRecapQueryBloc(),
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
      child: const ProductReceiveRecapExportForm._(),
    );
  }

  @override
  State<ProductReceiveRecapExportForm> createState() =>
      _ProductReceiveRecapExportFormState();
}

class _ProductReceiveRecapExportFormState
    extends State<ProductReceiveRecapExportForm> {
  final _formKey = GlobalKey<FormState>();

  final _requiredObjectValidator = RequiredObjectValidator<dynamic>(
    errorText: pleaseFillOutThisField.tr(),
  );

  DateTime? _startDate;
  DateTime? _endDate;
  List<Warehouse> _listWarehouse = [];
  String _type = 'PDF';
  Product? _product;

  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _typeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _type = _type;
    _typeController.text = _type;
    _startDate = _startDate;
    _endDate = _endDate;
    _product = _product;
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (_listWarehouse.isNotEmpty) {
        context.read<ProductReceiveRecapQueryBloc>().add(
              ProductReceiveRecapQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(
                  sortBy: 'created_at',
                ),
                periodStart: _startDate!,
                periodEnd: _endDate!,
                product: _product!,
                warehouseIn: _listWarehouse,
              ),
            );
      } else {
        Toast(context).fail(
          'error.must_required_data'.tr(namedArgs: {'data': 'warehouse'.tr()}),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductReceiveRecapQueryBloc,
        ProductReceiveRecapQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            if (_type == 'EXCEL') {
              final totals = calculateTotals(pageOptions.data);
              final bytes = simpleExcel<ProductReceiveRecap>(
                context: context,
                data: pageOptions.data,
                columns: [
                  TColumn(
                    title: 'product id - product name - status',
                    builder: (data, index) {
                      return '${data.product.id} - ${data.product.name} - ${data.status}';
                    },
                  ),
                  TColumn(
                    title: 'batch no - release date',
                    builder: (data, index) {
                      return '${data.batchNo.id} - Tanggal Release : ${data.releaseAt.yMMMd}';
                    },
                  ),
                  TColumn(
                    title: 'product receive id - transaction type name',
                    builder: (data, index) {
                      return '${data.productReceive.id} - ${data.productReceive.transactionType.name}';
                    },
                  ),
                  TColumn(
                    title: 'expired date',
                    builder: (data, index) {
                      return data.expiredDate.yMMMd;
                    },
                  ),
                  TColumn(
                    title: 'unit',
                    builder: (data, index) {
                      return data.unit.id;
                    },
                  ),
                  TColumn(
                    title: 'quantity',
                    builder: (data, index) {
                      return data.qty.format();
                    },
                  ),
                  TColumn(
                    title: 'sum(quantity per nobatch)',
                    builder: (data, index) {
                      return (totals['batchTotals']?[data.batchNo.id] ?? 0)
                          .format();
                    },
                  ),
                  TColumn(
                    title: 'sum(quantity per product)',
                    builder: (data, index) {
                      return (totals['productTotals']?[data.product.id] ?? 0)
                          .format(); // Adjust if needed
                    },
                  ),
                ],
              );
              saveFile(bytes, 'Product_Receive_Recap.xlsx');
            } else {
              final pdf = pw.Document()
                ..addPage(
                  await pdfProductReceiveRecap(
                    data: pageOptions.data,
                    startDate: _startDate,
                    endDate: _endDate,
                  ),
                );
              await Printing.sharePdf(
                bytes: await pdf.save(),
                filename: 'Product_Receive_Recap.pdf',
              );
            }
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${DataAction.export} ${Entity.productReceive} Recap',
        icon: DataAction.export.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<ProductReceiveRecapQueryBloc,
              ProductReceiveRecapQueryState>(
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
                  FDropDownSearchMultiple<Warehouse>(
                    validator: _requiredObjectValidator.call,
                    labelText: 'warehouse'.tr(),
                    onChanged: (listWarehouse) =>
                        _listWarehouse = listWarehouse,
                    itemAsString: (warehouse) => warehouse.id,
                    selectedItems: _listWarehouse,
                    dropdownBuilder: (context, selectedItems) {
                      final theme = Theme.of(context);
                      return Wrap(
                        spacing: 10,
                        children: selectedItems.map((e) {
                          return Container(
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.lighten(.33),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            margin: const EdgeInsets.only(top: 8),
                            padding: const EdgeInsets.only(left: 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  e.id,
                                  style: TextStyle(
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: theme.colorScheme.primary,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      selectedItems.remove(e);
                                      _listWarehouse.remove(e);
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                    status: Status.loaded,
                    items: Warehouse.products,
                  ),
                  FDropDownSearchProduct(
                    onChanged: (product) {
                      if (product != null) {
                        _product = product;
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

Map<String, Map<String, int>> calculateTotals(List<ProductReceiveRecap> data) {
  final totalPerBatch = <String, int>{};
  final totalPerProduct = <String, int>{};

  for (final item in data) {
    final batchId = item.batchNo.id;
    final productId = item.product.id;
    final qty = item.qty;

    totalPerBatch[batchId] = (totalPerBatch[batchId] ?? 0) + qty;

    totalPerProduct[productId] = (totalPerProduct[productId] ?? 0) + qty;
  }

  return {
    'batchTotals': totalPerBatch,
    'productTotals': totalPerProduct,
  };
}
