import 'package:flexurio_chiron_sales_order/src/app/bloc/order_cart/order_cart_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/product_selected/product_selected_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order/sales_order_bloc.dart';
import 'widget/card_to_buy.dart';
import 'widget/cart.dart';
import 'widget/product_options.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/transaction_type.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';

class SalesOrderCreatePage extends StatefulWidget {
  const SalesOrderCreatePage._(this.isProductRequestOther);

  final bool isProductRequestOther;

  static Route<bool?> route({
    Warehouse? initialWarehouse,
    required bool isProductRequestOther,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SalesOrderBloc()),
          BlocProvider(create: (context) => OrderCartBloc()),
          BlocProvider(create: (context) => ProductSelectedBloc()),
          BlocProvider(
            create: (context) => TransactionTypeQueryBloc()
              ..add(
                TransactionTypeQueryEvent.fetch(
                  flag: 'Modul',
                  value: 'PermintaanProduct',
                  pageOptions: PageOptions.emptyNoLimit(sortBy: 'id'),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => ProductStockWithPriceQueryBloc()
              ..add(
                ProductStockWithPriceQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(
                    sortBy: 'name',
                    ascending: true,
                  ),
                ),
              ),
          ),
        ],
        child: SalesOrderCreatePage._(isProductRequestOther),
      ),
    );
  }

  @override
  State<SalesOrderCreatePage> createState() => _SalesOrderCreatePageState();
}

class _SalesOrderCreatePageState extends State<SalesOrderCreatePage> {
  Map<String, List<ProductStockWithPrice>> _productByType = {};
  Map<String, List<ProductStockWithPrice>> _batchByProduct = {};
  String? _type;
  String _search = '';
  Warehouse? _warehouse;
  TransactionType? _transactionType;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    if (widget.isProductRequestOther) {
      _warehouse = Warehouse.finishedProduct;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ContentWithRightPanel(
      sideWidth: 420,
      rightPanel: Cart(
        showPrice: !widget.isProductRequestOther,
        onSubmit: (products) {
          if (_transactionType == null) {
            Toast(context).fail('Please select transaction type');
            return;
          }

          final bloc = context.read<SalesOrderBloc>();
          bloc.add(
            SalesOrderEvent.create(
              orderTypeId: widget.isProductRequestOther ? '65' : 'D1',
              products: products,
              transactionTypeId: _transactionType!.id,
            ),
          );
        },
        onItemTap: (item) {
          context.read<ProductSelectedBloc>().add(item);
          _scaffoldKey.currentState!.openEndDrawer();
        },
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(18)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          key: _scaffoldKey,
          endDrawer: ProductOptions(
            showPrice: !widget.isProductRequestOther,
            batchByProduct: _batchByProduct,
          ),
          onDrawerChanged: (isOpened) {
            if (!isOpened) {
              context.read<ProductSelectedBloc>().add(null);
            }
          },
          body: Column(
            children: [
              const Gap(12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    BackButtonWithTitle(
                      title: widget.isProductRequestOther
                          ? 'product_request_other'.tr()
                          : 'sales_order'.tr(),
                    ),
                    const Gap(12),
                    Row(
                      children: [
                        _buildFieldDropDownWarehouse(),
                        Gap(12),
                        if (widget.isProductRequestOther)
                          _buildFieldTransactionType(),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 300,
                      child: SearchBoxX(
                        onChanged: (value) {
                          setState(() => _search = value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(12),
              Expanded(
                child: _warehouse != null
                    ? _productsGallery()
                    : Center(
                        child: SizedBox(
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'select_data'.tr(
                                  namedArgs: {
                                    'data': 'warehouse'.tr(),
                                  },
                                ),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Gap(12),
                              SelectChip<Warehouse>(
                                options: Warehouse.products,
                                axis: Axis.vertical,
                                onChanged: (warehouse) {
                                  setState(() {
                                    _warehouse = warehouse;
                                  });
                                },
                                getLabel: (warehouse) => warehouse.id,
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFieldDropDownWarehouse() {
    return DropDownSmall<Warehouse>(
      key: ValueKey(_warehouse),
      icon: Icons.warehouse_rounded,
      labelText: 'warehouse'.tr(),
      itemAsString: (batch) => batch.id,
      initialValue: _warehouse,
      items: Warehouse.products,
      onChanged: (warehouse) {
        setState(() {
          _warehouse = warehouse;
        });
      },
    );
  }

  Widget _buildFieldTransactionType() {
    return FDropDownSearchSmallTransactionType(
      width: 400,
      initialValue: _transactionType,
      onChanged: (transactionType) {
        setState(() {
          _transactionType = transactionType;
        });
      },
    );
  }

  BlocListener<ProductStockWithPriceQueryBloc, ProductStockWithPriceQueryState>
      _productsGallery() {
    return BlocListener<ProductStockWithPriceQueryBloc,
        ProductStockWithPriceQueryState>(
      listener: (context, state) {
        _productByType = state.maybeWhen(
          orElse: () => {},
          loaded: (pageOptions) {
            return groupBy(
              pageOptions.data,
              (product) => product.type.toUpperCase(),
            );
          },
        );
        _batchByProduct = state.maybeWhen(
          orElse: () => {},
          loaded: (pageOptions) {
            return groupBy(
              pageOptions.data,
              (product) => product.id,
            );
          },
        );
        setState(() {});
      },
      child: BlocBuilder<ProductStockWithPriceQueryBloc,
          ProductStockWithPriceQueryState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (pageOption) {
              var products = pageOption.data;
              if (_type != null) {
                products = _productByType[_type!]!;
              }
              products = products
                  .where((product) {
                    return product.warehouse == _warehouse?.id &&
                        product.name
                            .toLowerCase()
                            .contains(_search.toLowerCase());
                  })
                  .toList()
                  .distinct((product) => product.id);
              return Column(
                children: [
                  _buildProductCategoryFilter(),
                  const Gap(12),
                  Expanded(
                    child: _buildListProducts(products),
                  ),
                ],
              );
            },
            loading: (_) => const ProgressingIndicator(),
            orElse: () => const SomethingWrong(),
          );
        },
      ),
    );
  }

  Padding _buildProductCategoryFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SelectChip<String>(
        getLabel: (name) => name,
        options: _productByType.keys.toList(),
        onChanged: (value) {
          setState(() {
            _type = value;
          });
        },
      ),
    );
  }

  Widget _buildListProducts(List<ProductStockWithPrice> products) {
    return LayoutBuilder(builder: (context, constraints) {
      final crossAxisCount = (constraints.maxWidth / 340).floor();
      final width =
          constraints.maxWidth / crossAxisCount - (12 * (crossAxisCount + 1));
      return GridView.builder(
        padding: const EdgeInsets.only(
          left: 12,
          bottom: 12,
          right: 12,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: width / 165,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return CardProductToBuy(
            showPrice: !widget.isProductRequestOther,
            product: products[index],
            onTap: () {
              context.read<ProductSelectedBloc>().add(
                    CartItem(
                      product: products[index],
                      quantity: 0,
                    ),
                  );
              _scaffoldKey.currentState!.openEndDrawer();
            },
          );
        },
      );
    });
  }
}

class DashedLine extends StatelessWidget {
  const DashedLine({super.key, this.height = 1, this.color = Colors.blueGrey});
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}

class QuantityInput extends StatelessWidget {
  const QuantityInput({
    required this.quantity,
    required this.quantityMax,
    super.key,
    this.onIncrement,
    this.onDecrement,
    this.small = false,
  });

  final void Function()? onIncrement;
  final void Function()? onDecrement;
  final double quantity;
  final double quantityMax;
  final bool small;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: small ? 38 : 46,
          width: small ? 126 : 160,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: small ? 9 : 10,
          child: SizedBox(
            child: Text(
              quantity == 0 ? '' : quantity.toInt().toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: small ? 14 : 18,
              ),
            ),
          ),
        ),
        QuantityChangeButton(
          small: small,
          isIncrease: false,
          onPressed: onDecrement,
          active: quantity > 0,
        ),
        Positioned(
          right: 0,
          child: QuantityChangeButton(
            small: small,
            isIncrease: true,
            highlight: quantity > 0 && quantity < quantityMax,
            active: quantity < quantityMax,
            onPressed: onIncrement,
          ),
        ),
      ],
    );
  }
}

class QuantityChangeButton extends StatelessWidget {
  const QuantityChangeButton({
    required this.isIncrease,
    required this.onPressed,
    super.key,
    this.highlight = false,
    this.active = true,
    this.small = false,
  });
  final bool isIncrease;
  final void Function()? onPressed;
  final bool highlight;
  final bool active;
  final bool small;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary.lighten(.06);
    return Padding(
      padding: const EdgeInsets.all(3),
      child: CircleAvatar(
        radius: small ? 16 : null,
        foregroundColor:
            active ? (highlight ? Colors.white : primaryColor) : Colors.grey,
        backgroundColor: highlight ? primaryColor : Colors.white,
        child: IconButton(
          onPressed: active ? onPressed : () {},
          icon: Icon(
            isIncrease ? Icons.add : Icons.remove,
            size: small ? 16 : null,
          ),
        ),
      ),
    );
  }
}
