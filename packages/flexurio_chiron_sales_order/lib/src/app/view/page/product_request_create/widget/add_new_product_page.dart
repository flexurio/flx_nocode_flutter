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
import 'package:gap/gap.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class ProductRequestAddNewDetailPage extends StatefulWidget {
  const ProductRequestAddNewDetailPage._({
    required this.productRequestBloc,
    this.productRequest,
    this.initialProducts,
  });

  final ProductRequestFormPurchaseOrder? productRequest;
  final ProductRequestBloc productRequestBloc;
  final List<ProductRequestDetail>? initialProducts;

  static Widget prepare({
    required ProductRequestBloc productRequestBloc,
    ProductRequestFormPurchaseOrder? productRequest,
    List<ProductRequestDetail>? initialProducts,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)
            ..add(
              ProductQueryEvent.fetch(pageOptions: PageOptions.emptyNoLimit()),
            ),
        ),
        BlocProvider(create: (context) => ProductStockQueryBloc()),
        BlocProvider(create: (context) => ProductPriceQueryBloc()),
      ],
      child: ProductRequestAddNewDetailPage._(
        productRequest: productRequest,
        productRequestBloc: productRequestBloc,
        initialProducts: initialProducts,
      ),
    );
  }

  @override
  State<ProductRequestAddNewDetailPage> createState() =>
      _ProductRequestAddNewDetailPageState();
}

class _ProductRequestAddNewDetailPageState
    extends State<ProductRequestAddNewDetailPage> {
  double? _discPrice;
  final _formKey = GlobalKey<FormState>();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _quantityStockController = TextEditingController();
  final _unitController = TextEditingController();
  final actions = <Widget>[];
  late bool enabledProduct;
  late List<Product> productItem = [];
  late List<ProductRequestDetail> productExist = [];
  late Product _product;
  late ProductRequestDetail newDataDetail;

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      widget.productRequestBloc.add(
        ProductRequestEvent.createNewProductDetail(
          widget.productRequest!.id!,
          _discPrice!,
          ProductRequestDetail(
            id: 0,
            quantity: stringToInt(_quantityController.text),
            price: stringDecimalToDouble(_priceController.text),
            subtotal: 0,
            discountPercent: 0,
            discountValue: 0,
            priceAfterDiscount: 0,
            productPrice: stringDecimalToDouble(_priceController.text),
            totalProductPrice: 0,
            quantityDelivery: 0,
            quantityRemaining: 0,
            product: _product,
            unit: _unitController.text,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _discPrice = widget.initialProducts!.first.discountPercent;
    productExist = widget.initialProducts!;
    enabledProduct = true;
    actions.addAll([
      Button(
        permission: null,
        isSecondary: true,
        onPressed: () => Navigator.pop(context),
        action: DataAction.cancel,
      ),
      const SizedBox(width: 12),
      Button(
        permission: null,
        onPressed: () => _submit(context),
        action: DataAction.add,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.add;
    final entity = Entity.productRequestDetail;
    return BlocListener<ProductRequestBloc, ProductRequestState>(
      bloc: widget.productRequestBloc,
      listener: (context, state) {
        state.maybeWhen(
          success: (_) {
            Toast(context)
                .dataChanged(DataAction.add, Entity.productRequestDetail);
            Navigator.pop(context);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Column(
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
                    FTextFormField(
                      labelText: 'Product Request',
                      controller: TextEditingController(
                        text: widget.productRequest?.id,
                      ),
                      maxLength: 50,
                      enabled: false,
                    ),
                    const Gap(20),
                    BlocBuilder<ProductQueryBloc, ProductQueryState>(
                      builder: (context, state) {
                        state.maybeWhen(
                          orElse: () => [],
                          loaded: (product) {
                            final data = product.data
                                .where(
                                  (i) => !productExist
                                      .map((e) => e.product!.id)
                                      .contains(i.id),
                                )
                                .toList();
                            if (data.isNotEmpty)
                              productItem = data;
                            else
                              productItem = [];
                          },
                        );
                        return FDropDownSearch<Product>(
                          labelText: 'Product',
                          items: productItem,
                          onChanged: (product) {
                            if (product != null) {
                              _product = product;
                              _unitController.text = product.unitPacking.id;
                              context.read<ProductStockQueryBloc>().add(
                                    ProductStockQueryEvent.fetch(
                                      period: DateTime.now(),
                                      productId: product.id,
                                      endingBalance: 0,
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
                          itemAsString: (product) => product.name,
                          validator: requiredObjectValidator.call,
                        );
                      },
                    ),
                    const Gap(20),
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
                    const Gap(20),
                    RowFields(
                      children: [
                        BlocBuilder<ProductStockQueryBloc,
                            ProductStockQueryState>(
                          builder: (context, state) {
                            state.maybeWhen(
                              loaded: (productStock) {
                                if (productStock.isNotEmpty) {
                                  _quantityStockController.text =
                                      productStock[0]
                                          .endingBalanceMarketing
                                          .toString();
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
                    const Gap(20),
                    _buildFieldPrice(),
                    const Gap(20),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFieldPrice() {
    return BlocBuilder<ProductPriceQueryBloc, ProductPriceQueryState>(
      builder: (context, state) {
        state.maybeWhen(
          loaded: (productPrice) {
            if (productPrice.isNotEmpty) {
              _priceController.text = productPrice[0].price.toString();
            } else {
              _priceController.text = '0';
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
    );
  }
}
