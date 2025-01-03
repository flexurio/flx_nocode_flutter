import 'package:flexurio_chiron_sales_order/src/app/bloc/order_cart/order_cart_bloc.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CardProductToBuy extends StatelessWidget {
  const CardProductToBuy({
    required this.product,
    required this.showPrice,
    super.key,
    this.onTap,
  });

  final ProductStockWithPrice product;
  final void Function()? onTap;
  final bool showPrice;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    return BlocBuilder<OrderCartBloc, List<CartItem>>(
      builder: (context, state) {
        var quantity = 0.0;
        for (final element in state) {
          if (element.product.id == product.id) {
            quantity += element.quantity;
          }
        }

        return FCard(
          onTap: onTap,
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      color: Colors.blueGrey.shade50,
                      height: 94,
                      width: 94,
                      child: Center(
                        child: Icon(
                          FontAwesomeIcons.image,
                          color: Colors.blueGrey.shade100,
                          size: 40,
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
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: quantity > 0 ? primaryColor : null,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Gap(6),
                        const Text(
                          'ipsum dolor sit amet consectetur adipiscing elit. Mauris vestibulum elit, id cursus erat malesuada nec. Sed eu lectus id nisi lacinia malesuada. Mauris ut nibh at nunc ultricies tincidunt. Nullam ut sapien quis lectus tincidunt malesuada. Nulla facilisi. Mauris ut nibh at nunc ultricies tincidunt. Nullam ut sapien quis lectus tincidunt malesuada.',
                          style: TextStyle(fontSize: 12),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      showPrice ? product.price.format() : '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  if (quantity > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Quantity:',
                              style: TextStyle(fontSize: 10),
                            ),
                            Row(
                              children: [
                                Text(
                                  quantity.toInt().toString(),
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    LightButtonSmall(
                      action: DataAction.addToCart,
                      permission: null,
                      onPressed: onTap,
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
