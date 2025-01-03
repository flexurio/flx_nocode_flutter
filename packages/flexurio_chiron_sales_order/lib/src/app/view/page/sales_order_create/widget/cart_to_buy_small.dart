import 'package:flexurio_chiron_sales_order/src/app/bloc/order_cart/order_cart_bloc.dart';
import '../sales_order_create_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CardProductToBuySmall extends StatelessWidget {
  const CardProductToBuySmall({
    required this.product,
    required this.selected,
    required this.showPrice,
    super.key,
  });

  final ProductStockWithPrice product;
  final bool selected;
  final bool showPrice;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    return BlocBuilder<OrderCartBloc, List<CartItem>>(
      builder: (context, state) {
        var quantity = 0.0;
        for (final element in state) {
          if (element.product.batch == product.batch) {
            quantity += element.quantity;
          }
        }

        return Container(
          decoration: selected
              ? BoxDecoration(
                  color: primaryColor.withOpacity(.05),
                  border:
                      Border(left: BorderSide(color: primaryColor, width: 3)),
                )
              : null,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: Colors.blueGrey.shade50,
                  height: 70,
                  width: 70,
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.image,
                      color: Colors.blueGrey.shade100,
                    ),
                  ),
                ),
              ),
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product.name} (${product.batch})',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        if (showPrice)
                          Text(
                            '${'price'.tr()}: ${product.price.format()}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(),
                          ),
                        const Spacer(),
                        Text(
                          '${'stock'.tr()}: ${product.quantityStock.toInt()}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(),
                        ),
                      ],
                    ),
                    const Gap(6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Text(
                              showPrice
                                  ? (product.price * quantity).format()
                                  : '',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        _buildInputQuantity(
                          context,
                          quantity,
                          product.quantityStock,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  QuantityInput _buildInputQuantity(
    BuildContext context,
    double quantity,
    double quantityMax,
  ) {
    return QuantityInput(
      small: true,
      quantityMax: quantityMax,
      onIncrement: () {
        context.read<OrderCartBloc>().add(
              OrderCartEvent.increaseQuantity(
                product: product,
              ),
            );
      },
      onDecrement: () {
        context.read<OrderCartBloc>().add(
              OrderCartEvent.decreaseQuantity(
                product: product,
              ),
            );
      },
      quantity: quantity,
    );
  }
}
