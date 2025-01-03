import 'package:flexurio_chiron_sales_order/src/app/bloc/order_cart/order_cart_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/product_selected/product_selected_bloc.dart';
import 'select_batch.dart';
import 'set_quantity.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductOptions extends StatelessWidget {
  const ProductOptions({
    required this.batchByProduct,
    required this.showPrice,
    super.key,
  });

  final Map<String, List<ProductStockWithPrice>> batchByProduct;
  final bool showPrice;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scaffoldColor = theme.scaffoldBackgroundColor;
    return BlocBuilder<ProductSelectedBloc, CartItem?>(
      builder: (context, item) {
        if (item == null) return Container();
        final pageController =
            PageController(initialPage: item.quantity > 0 ? 1 : 0);

        return Container(
          width: 360,
          padding: const EdgeInsets.all(12),
          color: scaffoldColor,
          child: PageView(
            controller: pageController,
            children: [
              SelectBatch(
                batchByProduct: batchByProduct,
                onSelect: (batch) {
                  context.read<ProductSelectedBloc>().add(
                        CartItem(
                          product: batch!,
                          quantity: 0,
                        ),
                      );
                  pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              SetQuantity(
                showPrice: showPrice,
                onBack: () {
                  pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
