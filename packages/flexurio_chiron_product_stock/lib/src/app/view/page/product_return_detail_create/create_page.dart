import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_query/sales_order_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/production_order.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/sales_order.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return/product_return_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_detail/product_return_detail_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_detail.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class ProductReturnDetailCreatePage extends StatefulWidget {
  const ProductReturnDetailCreatePage({required this.productReturn, super.key});

  final ProductReturn productReturn;

  static Widget prepare({
    required ProductReturn productReturn,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductReturnBloc()),
        BlocProvider(
          create: (context) => ProductionOrderQueryBloc(isExternal: false)
            ..add(const ProductionOrderQueryEvent.fetch()),
          child: Container(),
        ),
        BlocProvider(
          create: (context) =>
              SalesOrderQueryBloc()..add(const SalesOrderQueryEvent.fetch()),
        ),
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)
            ..add(const ProductQueryEvent.fetch()),
        ),
        BlocProvider(
          create: (context) => ProductReturnDetailBloc(),
        ),
      ],
      child: ProductReturnDetailCreatePage(
        productReturn: productReturn,
      ),
    );
  }

  @override
  State<ProductReturnDetailCreatePage> createState() =>
      _ProductReturnDetailCreatePageState();
}

class _ProductReturnDetailCreatePageState
    extends State<ProductReturnDetailCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();
  final _expirationDateController = TextEditingController();
  final _productNameController = TextEditingController();
  final _totalPriceController = TextEditingController();
  final _unitController = TextEditingController();

  Product? _product;
  ProductionOrder? _productionOrder;
  SalesOrder? _salesOrder;
  DateTime? _expiredDate;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<ProductReturnDetailBloc>().add(
            ProductReturnDetailEvent.create(
              productReturn: widget.productReturn,
              product: _product!,
              productionOrder: _productionOrder!,
              deliveryOrderId: _salesOrder!.deliveryOrderId,
              materialUnit: _product!.unitPacking,
              productPrice: stringDecimalToDouble(_priceController.text),
              quantity: stringDecimalToDouble(_quantityController.text),
              totalProductPrice:
                  stringDecimalToDouble(_totalPriceController.text),
              expirationDate: _expiredDate!,
            ),
          );
    }
  }

  double totalValue() {
    return stringDecimalToDouble(_priceController.text) *
        stringDecimalToDouble(_quantityController.text);
  }

  final _productList = <ProductReturnDetail>[];

  @override
  Widget build(BuildContext context) {
    final entity = Entity.productReturnDetail;
    return BlocListener<ProductReturnDetailBloc, ProductReturnDetailState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) => Toast(context).fail(error),
          success: () {
            Toast(context).dataChanged(DataAction.create, entity);
            Navigator.pop(context, true);
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          action: DataAction.create,
          entity: entity,
          formKey: _formKey,
          actions: [
            BlocBuilder<ProductReturnDetailBloc, ProductReturnDetailState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  action: DataAction.create,
                  onPressed: _submit,
                  isInProgress: state.maybeWhen(
                    orElse: () => false,
                    loading: () => true,
                  ),
                );
              },
            ),
          ],
          children: [
            RowFields(
              children: [
                Column(
                  children: [
                    BlocBuilder<ProductQueryBloc, ProductQueryState>(
                      builder: (context, state) {
                        return FDropDownSearch<Product>(
                          labelText: Entity.product.title,
                          onChanged: (product) {
                            _product = product;
                            _productNameController.text = product!.name;
                            _unitController.text = product.unitPacking.id;
                            setState(() {});
                          },
                          validator: requiredObjectValidator.call,
                          status: state.maybeWhen(
                            error: (_) => Status.error,
                            loading: (_) => Status.progress,
                            orElse: () => Status.loaded,
                          ),
                          items: state.maybeWhen(
                            orElse: () => [],
                            loaded: (products) => products.data,
                          ),
                          itemAsString: (product) => product.id,
                        );
                      },
                    ),
                    const Gap(24),
                    FDropDownSearchProductionOrder(
                      label: 'Batch Number',
                      onChanged: (productionOrder) {
                        _productionOrder = productionOrder;
                        _expirationDateController.text =
                            productionOrder!.expirationDate.yMMMMd;
                        _expiredDate = productionOrder.expirationDate;
                      },
                    ),
                    const Gap(24),
                    FTextFormField(
                      labelText: 'Quantity',
                      validator: requiredValidator.call,
                      controller: _quantityController,
                      onChanged: (quantity) {
                        _totalPriceController.text = totalValue().format();
                      },
                      inputFormatters: [
                        ThousandsFormatter(),
                      ],
                    ),
                    const Gap(24),
                    FTextFormField(
                      labelText: 'Price',
                      validator: requiredValidator.call,
                      controller: _priceController,
                      onChanged: (price) {
                        _totalPriceController.text = totalValue().format();
                      },
                      inputFormatters: [
                        ThousandsFormatter(),
                      ],
                    ),
                    const Gap(24),
                    FTextFormField(
                      labelText: 'Expired Date',
                      validator: requiredValidator.call,
                      controller: _expirationDateController,
                      enabled: false,
                    ),
                  ],
                ),
                Column(
                  children: [
                    FTextFormField(
                      labelText: 'Product Name',
                      validator: requiredValidator.call,
                      controller: _productNameController,
                      enabled: false,
                    ),
                    const Gap(24),
                    FDropDownSearchSalesOrder(
                      label: 'Delivery Order',
                      onChanged: (salesOrder) {
                        _salesOrder = salesOrder;
                      },
                    ),
                    const Gap(24),
                    FTextFormField(
                      enabled: false,
                      labelText: 'Unit',
                      validator: requiredValidator.call,
                      controller: _unitController,
                    ),
                    const Gap(24),
                    FTextFormField(
                      labelText: 'Total',
                      enabled: false,
                      validator: requiredValidator.call,
                      controller: _totalPriceController,
                      inputFormatters: [
                        ThousandsFormatter(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  permission: null,
                  action: DataAction.add,
                  onPressed: () {
                    if (_product != null) {
                      _productList.add(
                        ProductReturnDetail(
                          id: 0,
                          quantityReturnNote: 0,
                          createAt: DateTime.now(),
                          updatedAt: DateTime(0),
                          productReturn: ProductReturn.empty(),
                          product: _product!,
                          deliveryOrderId: _salesOrder!.deliveryOrderId,
                          batchNo: _productionOrder!,
                          unit: _product!.unitPacking,
                          productPrice:
                              stringDecimalToDouble(_priceController.text),
                          quantity: stringToInt(_quantityController.text),
                          quantityRemaining: 0,
                          quantityCheck: 0,
                          totalProductPrice: stringDecimalToDouble(
                            _totalPriceController.text,
                          ),
                          expirationDate: _expiredDate!,
                          checkQcAt: DateTime(0),
                          checkQcById: 0,
                        ),
                      );
                      setState(() {});
                    }
                  },
                ),
              ],
            ),
            const Gap(24),
            SimpleTable<ProductReturnDetail>(
              data: _productList,
              width: 1000,
              columns: [
                TableColumnX(
                  width: 90,
                  title: 'Product ID',
                  builder: (productReturn, _) {
                    return Text(
                      productReturn.product.id,
                    );
                  },
                ),
                TableColumnX(
                  title: 'Product Name',
                  builder: (productReturn, _) {
                    return Text(
                      _productNameController.text,
                    );
                  },
                ),
                TableColumnX(
                  title: 'Batch Number',
                  builder: (productReturn, _) {
                    return Text(
                      productReturn.batchNo.id,
                    );
                  },
                ),
                TableColumnX(
                  title: 'Delivery Order',
                  builder: (productReturn, _) {
                    return Text(
                      productReturn.deliveryOrderId,
                    );
                  },
                ),
                TableColumnX(
                  width: 80,
                  title: 'Quantity',
                  builder: (productReturn, _) {
                    return Text(
                      productReturn.quantity.toString(),
                    );
                  },
                ),
                TableColumnX(
                  width: 80,
                  title: 'Unit',
                  builder: (productReturn, _) {
                    return Text(
                      productReturn.unit.id,
                    );
                  },
                ),
                TableColumnX(
                  title: 'Price',
                  builder: (productReturn, _) {
                    return Text(
                      productReturn.productPrice.format(),
                    );
                  },
                ),
                TableColumnX(
                  title: 'Total',
                  builder: (productReturn, _) {
                    return Text(
                      productReturn.totalProductPrice.format(),
                    );
                  },
                ),
                TableColumnX(
                  width: 145,
                  title: 'Expired Date',
                  builder: (productReturn, _) {
                    return Text(
                      productReturn.expirationDate.yMMMMd,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
