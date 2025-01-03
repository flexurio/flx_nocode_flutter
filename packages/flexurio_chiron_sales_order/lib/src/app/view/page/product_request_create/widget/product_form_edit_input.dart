import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request/product_request_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_stock_query/product_stock_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request_detail.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class ProductRequestEditProductPage extends StatefulWidget {
  const ProductRequestEditProductPage._({
    this.productRequestDetail,
    this.product,
    this.productRequest,
  });

  final ProductRequestDetail? productRequestDetail;
  final ProductRequestFormPurchaseOrder? productRequest;
  final Product? product;

  static Widget prepare({
    ProductRequestDetail? productRequestDetail,
    Product? product,
    ProductRequestFormPurchaseOrder? productRequest,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)
            ..add(const ProductQueryEvent.fetch()),
        ),
        BlocProvider(
          create: (context) => ProductStockQueryBloc(),
        ),
        BlocProvider(
          create: (context) => ProductPriceQueryBloc(),
        ),
        BlocProvider(
          create: (context) => ProductRequestBloc(),
        ),
      ],
      child: ProductRequestEditProductPage._(
        productRequestDetail: productRequestDetail,
        product: product,
        productRequest: productRequest,
      ),
    );
  }

  @override
  State<ProductRequestEditProductPage> createState() =>
      _ProductRequestEditProductPageState();
}

class _ProductRequestEditProductPageState
    extends State<ProductRequestEditProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _productRequestIdController = TextEditingController();
  final _quantityController = TextEditingController();
  final _quantityStockController = TextEditingController();
  final _priceController = TextEditingController();
  final _unitController = TextEditingController();
  late Product _product;
  double? _discPrice;
  late ProductRequestDetail newDataDetail;
  late ProductRequestFormPurchaseOrder _productRequest;
  late DataAction _action;
  final actions = <Widget>[];

  @override
  void initState() {
    super.initState();
    _action = DataAction.edit;
    _productRequest = widget.productRequest!;
    _productRequestIdController.text = widget.productRequest!.id!;
    _product = widget.productRequestDetail!.product!;
    _quantityController.text = widget.productRequestDetail!.quantity.toString();
    _unitController.text = widget.productRequestDetail!.unit;
    _priceController.text = widget.productRequestDetail!.price.toString();

    if (_productRequest.productType! == 'ANTITEN') {
      if (_productRequest.customer!.id == 'ENSEVAL' ||
          _productRequest.customer!.id == 'ENSEVAL 1' ||
          _productRequest.customer!.id == 'ENSEVAL 2') {
        _discPrice = 35;
      } else if (_productRequest.customer!.id == 'MBSJ') {
        _discPrice = 7.5;
      } else {
        _discPrice = 9;
      }
    } else if (_productRequest.productType! == 'ALKES') {
      if (_productRequest.customer!.id == 'MBSJ') {
        _discPrice = 7.5;
      } else {
        _discPrice = _productRequest.customer!.discount;
      }
    } else {
      _discPrice = _productRequest.customer!.discount;
    }
    final priceAfterDiscount =
        stringDecimalToDouble(_priceController.text) * _discPrice! / 100;
    final subtotal =
        stringDecimalToDouble(_priceController.text) - priceAfterDiscount;

    context.read<ProductStockQueryBloc>().add(
          ProductStockQueryEvent.fetch(
            productId: _product.id,
            period: DateTime.now(),
            endingBalance: 0,
          ),
        );
    actions.addAll([
      Button(
        permission: null,
        isSecondary: true,
        onPressed: () {
          Navigator.pop(context);
        },
        action: DataAction.cancel,
      ),
      const SizedBox(width: 12),
      BlocListener<ProductRequestBloc, ProductRequestState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (_) {
              Toast(context).dataChanged(_action, Entity.productRequestDetail);
              Navigator.pop(context);
            },
            error: (error) => Toast(context).fail(error),
            orElse: () {},
          );
        },
        child: Button(
          permission: null,
          action: DataAction.edit,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              newDataDetail = ProductRequestDetail(
                id: widget.productRequestDetail!.id,
                quantity: stringToInt(_quantityController.text),
                price: stringDecimalToDouble(_priceController.text),
                subtotal:
                    stringDecimalToDouble(_quantityController.text) * subtotal,
                discountPercent: _discPrice,
                discountValue: _discPrice,
                priceAfterDiscount: 0,
                productPrice: widget.productRequestDetail!.productPrice,
                totalProductPrice: 0,
                quantityDelivery: 0,
                quantityRemaining: 0,
                product: _product,
                unit: widget.productRequestDetail!.unit,
              );
              context.read<ProductRequestBloc>().add(
                    ProductRequestEvent.editProductionRequestDetail(
                      widget.productRequest!,
                      newDataDetail,
                    ),
                  );
            }
          },
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.edit;
    final entity = Entity.productRequestDetail;
    return Column(
      children: [
        const SizedBox(
          height: 200,
        ),
        SingleFormPanel(
          actions: actions,
          action: action,
          entity: entity,
          visibleBackButton: false,
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
                          height: 20,
                        ),
                      ],
                    ),
                  BlocBuilder<ProductQueryBloc, ProductQueryState>(
                    builder: (context, state) {
                      return FDropDownSearch<Product>(
                        initialValue: widget.productRequestDetail?.product,
                        labelText: 'Product',
                        enabled: false,
                        items: state.maybeWhen(
                          loaded: (product) => product.data,
                          orElse: () => [],
                        ),
                        itemAsString: (product) => product.name,
                        validator: requiredObjectValidator.call,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
                  RowFields(
                    children: [
                      BlocBuilder<ProductStockQueryBloc,
                          ProductStockQueryState>(
                        builder: (context, state) {
                          state.maybeWhen(
                            loaded: (productStock) {
                              if (productStock.isNotEmpty) {
                                _quantityStockController.text = productStock[0]
                                    .endingBalanceMarketing
                                    .toString();
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
                  const SizedBox(height: 20),
                  BlocBuilder<ProductPriceQueryBloc, ProductPriceQueryState>(
                    builder: (context, state) {
                      state.maybeWhen(
                        loaded: (productPrice) {
                          if (_priceController.text == '') {
                            if (productPrice.isNotEmpty) {
                              _priceController.text =
                                  productPrice[0].price.toString();
                            } else {
                              _priceController.text = '0';
                            }
                          }
                        },
                        orElse: () => const Center(
                          child: CupertinoActivityIndicator(),
                        ),
                      );
                      return FTextFormField(
                        controller: _priceController,
                        validator: requiredValidator.call,
                        enabled: false,
                        labelText: 'Price',
                        maxLength: 50,
                        inputFormatters: [
                          currencyFormatter,
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
