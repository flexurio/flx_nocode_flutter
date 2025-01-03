import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request/product_request_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_stock_query/product_stock_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request_detail.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class ProductRequestAddProductPage extends StatefulWidget {
  const ProductRequestAddProductPage._({
    required this.productRequestBloc,
    this.productRequestDetail,
    this.product,
    this.productRequest,
  });

  final ProductRequestDetail? productRequestDetail;
  final ProductRequestFormPurchaseOrder? productRequest;
  final Product? product;
  final ProductRequestBloc productRequestBloc;

  static Widget prepare({
    required ProductRequestBloc productRequestBloc,
    ProductRequestDetail? productRequestDetail,
    Product? product,
    ProductRequestFormPurchaseOrder? productRequest,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)
            ..add(
              ProductQueryEvent.fetch(
                active: true,
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => ProductStockQueryBloc(),
        ),
        BlocProvider(
          create: (context) => ProductPriceQueryBloc(),
        ),
      ],
      child: ProductRequestAddProductPage._(
        productRequestDetail: productRequestDetail,
        product: product,
        productRequest: productRequest,
        productRequestBloc: productRequestBloc,
      ),
    );
  }

  @override
  State<ProductRequestAddProductPage> createState() =>
      _ProductRequestAddProductPageState();
}

class _ProductRequestAddProductPageState
    extends State<ProductRequestAddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _productRequestIdController = TextEditingController();
  final _quantityController = TextEditingController();
  final _quantityStockController = TextEditingController();
  final _priceController = TextEditingController();
  final _unitController = TextEditingController();
  Product? _product;
  double? _discPrice;
  late ProductRequestDetail newDataDetail;
  late bool enabledProduct;

  @override
  void dispose() {
    _productRequestIdController.dispose();
    _quantityController.dispose();
    _quantityStockController.dispose();
    _priceController.dispose();
    _unitController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    _discPrice = widget.productRequest!.priceDiscountPercent;
    _discPrice ??= 0;
    final priceAfterDiscount =
        stringDecimalToDouble(_priceController.text) * _discPrice! / 100;
    final subtotal =
        stringDecimalToDouble(_priceController.text) - priceAfterDiscount;
    if (_formKey.currentState!.validate()) {
      Navigator.pop(
        context,
        ProductRequestDetail(
          id: DateTime.now().millisecondsSinceEpoch,
          quantity: stringToInt(_quantityController.text),
          price: stringDecimalToDouble(_priceController.text),
          subtotal: stringDecimalToDouble(_quantityController.text) * subtotal,
          discountPercent: _discPrice,
          discountValue: _discPrice,
          priceAfterDiscount: priceAfterDiscount,
          productPrice: stringDecimalToDouble(_priceController.text),
          totalProductPrice: 0,
          quantityDelivery: 0,
          quantityRemaining: 0,
          product: _product,
          unit: _unitController.text,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    enabledProduct = true;
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = Entity.productRequestDetail;
    return Column(
      children: [
        const SizedBox(
          height: 200,
        ),
        SingleFormPanel(
          actions: [
            Button(
              permission: null,
              isSecondary: true,
              onPressed: () => Navigator.pop(context),
              action: DataAction.cancel,
            ),
            const SizedBox(width: 12),
            _buildButtonSubmit(),
          ],
          action: action,
          entity: entity,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  if (widget.productRequestDetail != null)
                    Column(
                      children: [
                        FTextFormField(
                          labelText: 'Product Request',
                          controller: _productRequestIdController,
                          maxLength: 50,
                          enabled: false,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  _buildFieldProduct(),
                  const SizedBox(height: 24),
                  RowFields(
                    children: [
                      FTextFormField(
                        labelText: 'Quantity Purchase Order',
                        controller: _quantityController,
                        validator: requiredValidator.call,
                        maxLength: 50,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      FTextFormField(
                        labelText: 'Unit',
                        controller: _unitController,
                        maxLength: 6,
                        enabled: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  RowFields(
                    children: [
                      BlocBuilder<ProductStockQueryBloc,
                          ProductStockQueryState>(
                        builder: (context, state) {
                          state.maybeWhen(
                            loaded: (productStock) {
                              if (productStock.isNotEmpty) {
                                int total = productStock
                                    .map((item) => item.endingBalanceMarketing)
                                    .reduce((a, b) => a + b);
                                _quantityStockController.text =
                                    total.toString();
                              } else {
                                _quantityStockController.text = '0';
                              }
                            },
                            orElse: () => const Center(
                              child: CupertinoActivityIndicator(),
                            ),
                          );
                          return FTextFormField(
                            controller: _quantityStockController,
                            validator: requiredValidator.call,
                            labelText: 'Quantity Stock',
                            enabled: false,
                            maxLength: 50,
                            inputFormatters: [ThousandsFormatter()],
                          );
                        },
                      ),
                      FTextFormField(
                        labelText: 'Unit',
                        controller: _unitController,
                        maxLength: 6,
                        enabled: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildFieldPrice(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButtonSubmit() {
    return _builderProductPrice(
      (price, primaryPrice) => Button(
        permission: null,
        onPressed: price == 0 ? null : () => _submit(context),
        action: DataAction.add,
      ),
    );
  }

  Widget _builderProductPrice(
    Widget Function(double price, double primaryPrice) builder,
  ) {
    return BlocBuilder<ProductPriceQueryBloc, ProductPriceQueryState>(
      builder: (context, state) {
        final (price, primaryPrice) = state.maybeWhen(
          loaded: (productPrice) {
            if (productPrice.isNotEmpty) {
              return (productPrice[0].price, productPrice[0].primaryPrice);
            } else {
              return (0.0, 0.0);
            }
          },
          orElse: () => (0.0, 0.0),
        );
        return builder(price, primaryPrice);
      },
    );
  }

  Widget _buildFieldProduct() {
    return FDropDownSearchProduct(
      initialValue: widget.productRequestDetail?.product,
      onChanged: (product) {
        if (product != null) {
          _product = product;
          _unitController.text = product.unitPacking.id;
          context.read<ProductStockQueryBloc>().add(
                ProductStockQueryEvent.fetch(
                  period: DateTime.now(),
                  productId: product.id,
                  warehouse: [
                    Warehouse.finishedProduct,
                    Warehouse.alkes,
                  ],
                  endingBalance: 1,
                ),
              );
          context.read<ProductPriceQueryBloc>().add(
                ProductPriceQueryEvent.fetch(
                  product: product,
                  isEndDateNull: true,
                ),
              );
        }
      },
    );
  }

  Widget _buildFieldPrice() {
    return _builderProductPrice(
      (productPrice, primaryPrice) {
        final transactionType = widget.productRequest?.transactionType?.id;
        final isUsingPrimaryPrice = ['PL', 'PW'].contains(transactionType);
        final price = isUsingPrimaryPrice ? primaryPrice : productPrice;

        return Column(
          children: [
            FTextFormField(
              controller: _priceController..text = price.toString(),
              validator: requiredValidator.call,
              enabled: false,
              labelText: 'price'.tr(),
              maxLength: 50,
              inputFormatters: [
                currencyFormatter,
              ],
            ),
            if (_product != null && price == 0)
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: BlockNote(
                  color: Colors.red,
                  title: 'Warning',
                  subtitle: 'error.product_no_price'.tr(),
                ),
              )
          ],
        );
      },
    );
  }
}
