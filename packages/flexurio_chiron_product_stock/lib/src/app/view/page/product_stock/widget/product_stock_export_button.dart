import 'package:flexurio_chiron_product_stock/src/app/model/permission.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/product_stock_initial_query/product_stock_initial_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/product_stock_recap_query/product_stock_recap_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/product_stock_initial.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_stock/util/pdf_product_stock_recap.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ProductStockExportButton extends StatefulWidget {
  const ProductStockExportButton({
    super.key,
  });

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductStockRecapQueryBloc(),
        ),
        BlocProvider(
          create: (context) => ProductStockInitialQueryBloc(),
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
      child: const ProductStockExportButton(),
    );
  }

  @override
  State<ProductStockExportButton> createState() {
    return _ProductStockExportButtonState();
  }
}

class _ProductStockExportButtonState extends State<ProductStockExportButton> {
  String _type = 'Recap';
  Product? _product;
  DivisionType? _division;
  Warehouse? _warehouse;
  final _warehouseController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _type = 'Recap';
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<ProductStockRecapQueryBloc>();
    final initialBloc = context.read<ProductStockInitialQueryBloc>();
    final productBloc = context.read<ProductQueryBloc>();

    return LightButtonSmall(
      action: _type == 'Recap' ? DataAction.exportPdf : DataAction.exportExcel,
      title: 'product_stock'.tr(),
      permission: PermissionProductStock.productStockPrint,
      onPressed: () async {
        await _showPeriod(
          context,
          queryBloc,
          initialBloc,
          productBloc,
        );
      },
    );
  }

  Future<void> _showPeriod(
    BuildContext context,
    ProductStockRecapQueryBloc queryBloc,
    ProductStockInitialQueryBloc initialBloc,
    ProductQueryBloc productBloc,
  ) async {
    await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return CardForm(
              popup: true,
              title: 'filter'.tr(),
              icon: Icons.sort,
              actions: [
                Button(
                  action: DataAction.cancel,
                  permission: null,
                  isSecondary: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 12),
                MultiBlocListener(
                  listeners: [
                    BlocListener<ProductStockRecapQueryBloc,
                        ProductStockRecapQueryState>(
                      bloc: queryBloc,
                      listener: (context, state) async {
                        state.maybeWhen(
                          orElse: () {},
                          error: (error) => Toast(context).fail(error),
                          loaded: (productStockInitial) async {
                            final pdf = pw.Document()
                              ..addPage(
                                await pdfRecapProductStock(
                                  data: productStockInitial.data,
                                ),
                              );
                            await Printing.sharePdf(
                              bytes: await pdf.save(),
                              filename: 'Recap_Product_Stock.pdf',
                            );
                          },
                        );
                      },
                    ),
                    BlocListener<ProductStockInitialQueryBloc,
                        ProductStockInitialQueryState>(
                      bloc: initialBloc,
                      listener: (context, state) async {
                        state.maybeWhen(
                          orElse: () {},
                          error: (error) => Toast(context).fail(error),
                          loaded: (productStockInitial) async {
                            final bytes = simpleExcel<ProductStockInitial>(
                              context: context,
                              data: productStockInitial.data,
                              columns: [
                                TColumn(
                                  title: 'product_id'.tr(),
                                  builder: (data, index) => data.product.id,
                                ),
                                TColumn(
                                  title: 'division'.tr(),
                                  builder: (data, index) =>
                                      data.product.division.id,
                                ),
                                TColumn(
                                  title: 'product_name'.tr(),
                                  builder: (data, index) => data.product.name,
                                ),
                                TColumn(
                                  title: 'expired_date'.tr(),
                                  builder: (data, index) =>
                                      data.expiredDate.ddMMyyyy,
                                ),
                                TColumn(
                                  title: 'batch_no'.tr(),
                                  builder: (data, index) => data.batchNoId,
                                ),
                                TColumn(
                                  title: 'Ending Balance Per Batch',
                                  builder: (data, index) => data.batchNoId,
                                ),
                                TColumn(
                                  title: 'Total Ending Balance All Batch',
                                  builder: (data, index) => data.batchNoId,
                                ),
                                TColumn(
                                  title: 'Division',
                                  builder: (data, index) =>
                                      data.product.division.id,
                                ),
                              ],
                            );
                            saveFile(
                              bytes,
                              'Product_Stock_Initial_Report.xlsx',
                            );
                          },
                        );
                      },
                    ),
                  ],
                  child: _type == 'Recap'
                      ? BlocBuilder<ProductStockRecapQueryBloc,
                          ProductStockRecapQueryState>(
                          bloc: queryBloc,
                          builder: (context, state) {
                            return Button.small(
                              action: DataAction.export,
                              permission: null,
                              onPressed: () {
                                if (_type == 'Recap' &&
                                    (_division == null || _product == null)) {
                                  queryBloc.add(
                                    ProductStockRecapQueryEvent.fetch(
                                      divisionType: _division,
                                      product: _product,
                                      pageOptions: PageOptions.emptyNoLimit(),
                                    ),
                                  );
                                } else {
                                  Toast(context).fail(
                                    'You must fill all required fields',
                                  );
                                }
                              },
                            );
                          },
                        )
                      : BlocBuilder<ProductStockInitialQueryBloc,
                          ProductStockInitialQueryState>(
                          bloc: initialBloc,
                          builder: (context, state) {
                            return Button.small(
                              action: DataAction.export,
                              permission: null,
                              onPressed: () {
                                if (_type == 'Initial' &&
                                    (_division == null ||
                                        _warehouse == null ||
                                        _product == null)) {
                                  initialBloc.add(
                                    ProductStockInitialQueryEvent.fetch(
                                      divisionType: _division,
                                      product: _product,
                                      warehouse: _warehouse,
                                      pageOptions: PageOptions.emptyNoLimit(),
                                    ),
                                  );
                                } else {
                                  Toast(context).fail(
                                    'You must fill all required fields',
                                  );
                                }
                              },
                            );
                          },
                        ),
                ),
              ],
              child: FilterInput(
                type: _type,
                product: _product,
                division: _division,
                warehouse: _warehouse,
                warehouseController: _warehouseController,
                onTypeChanged: (value) {
                  setState(() {
                    _type = value ?? '';
                  });
                },
                onProductChanged: (value) {
                  setState(() {
                    _product = value;
                  });
                },
                onDivisionChanged: (value) {
                  setState(() {
                    _division = value;
                  });
                },
                onWarehouseChanged: (value) {
                  setState(() {
                    _warehouse = value;
                  });
                },
                productBloc: productBloc,
              ),
            );
          },
        );
      },
    );
  }
}

class FilterInput extends StatelessWidget {
  const FilterInput({
    required this.type,
    required this.warehouseController,
    required this.onTypeChanged,
    required this.onProductChanged,
    required this.onDivisionChanged,
    required this.onWarehouseChanged,
    required this.productBloc,
    this.product,
    this.division,
    this.warehouse,
    super.key,
  });

  final String type;
  final Product? product;
  final DivisionType? division;
  final Warehouse? warehouse;
  final TextEditingController warehouseController;
  final ValueChanged<String?>? onTypeChanged;
  final ValueChanged<Product?> onProductChanged;
  final ValueChanged<DivisionType?> onDivisionChanged;
  final ValueChanged<Warehouse?> onWarehouseChanged;
  final ProductQueryBloc productBloc;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      FDropDownSearch<String>(
        labelText: 'Select Type',
        items: const ['Recap', 'Initial'],
        initialValue: type,
        onChanged: (s) {
          return onTypeChanged!.call(s);
        },
        itemAsString: (type) => type,
      ),
    ];

    if (type == 'Recap') {
      children.addAll([
        const SizedBox(height: 12),
        BlocBuilder<ProductQueryBloc, ProductQueryState>(
          bloc: productBloc,
          builder: (context, state) {
            return FDropDownSearch<Product>(
              labelText: 'Product',
              itemAsString: (product) => product.name,
              items: state.maybeWhen(
                orElse: () => [],
                loaded: (product) => product.data,
              ),
              initialValue: product,
              onChanged: (products) {
                if (products != null) {
                  onProductChanged.call(products);
                }
              },
            );
          },
        ),
        const SizedBox(height: 12),
        FDropDownSearch(
          labelText: 'Division',
          itemAsString: (divisionType) => divisionType.label,
          items: const [
            DivisionType.ethical,
            DivisionType.otc,
            DivisionType.alkes,
            DivisionType.dvd,
            DivisionType.distributor,
            DivisionType.empty,
          ],
          initialValue: division,
          onChanged: (value) {
            if (value != null) {
              onDivisionChanged.call(value);
            }
          },
        ),
      ]);
    }

    if (type == 'Initial') {
      children.addAll([
        const SizedBox(height: 12),
        BlocBuilder<ProductQueryBloc, ProductQueryState>(
          bloc: productBloc,
          builder: (context, state) {
            return FDropDownSearch<Product>(
              labelText: 'Product',
              itemAsString: (product) => product.name,
              items: state.maybeWhen(
                orElse: () => [],
                loaded: (product) => product.data,
              ),
              onChanged: (products) {
                if (products != null) {
                  onProductChanged.call(products);
                }
              },
            );
          },
        ),
        const SizedBox(height: 12),
        FDropDownSearch(
          labelText: 'Division',
          itemAsString: (divisionType) => divisionType.label,
          items: const [
            DivisionType.ethical,
            DivisionType.otc,
            DivisionType.alkes,
            DivisionType.dvd,
            DivisionType.distributor,
            DivisionType.empty,
          ],
          initialValue: division,
          onChanged: (value) {
            if (value != null) {
              onDivisionChanged.call(value);
            }
          },
        ),
        const SizedBox(height: 12),
        SelectChipField<Warehouse>(
          label: 'Warehouse',
          getLabel: (type) => type.id,
          controller: warehouseController,
          options: Warehouse.products,
          validator: requiredObjectValidator.call,
          onChanged: onWarehouseChanged.call,
        ),
      ]);
    }

    return Column(
      children: children,
    );
  }
}
