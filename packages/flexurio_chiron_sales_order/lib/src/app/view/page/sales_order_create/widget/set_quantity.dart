import 'package:flexurio_chiron_sales_order/src/app/bloc/order_cart/order_cart_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/product_selected/product_selected_bloc.dart';
import '../sales_order_create_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SetQuantity extends StatelessWidget {
  const SetQuantity({
    required this.onBack,
    required this.showPrice,
    super.key,
  });

  final void Function() onBack;
  final bool showPrice;

  void _setQuantity(
    BuildContext context,
    ProductStockWithPrice product,
    double quantity,
  ) {
    context.read<OrderCartBloc>().add(
          OrderCartEvent.setQuantity(
            product: product,
            quantity: quantity,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSelectedBloc, CartItem?>(
      builder: (context, item) {
        if (item == null) return Container();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                BackButton(
                  onPressed: onBack,
                ),
                const Gap(6),
                Expanded(
                  child: Text(
                    item.product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(12),
            SizedBox(
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: Colors.blueGrey.shade50,
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.image,
                      color: Colors.blueGrey.shade100,
                      size: 80,
                    ),
                  ),
                ),
              ),
            ),
            const Gap(6),
            const Text(
              'ipsum dolor sit amet consectetur adipiscing elit. Mauris vestibulum elit, id cursus erat malesuada nec. Sed eu lectus id nisi lacinia malesuada. Mauris ut nibh at nunc ultricies tincidunt. Nullam ut sapien quis lectus tincidunt malesuada. Nulla facilisi. Mauris ut nibh at nunc ultricies tincidunt. Nullam ut sapien quis lectus tincidunt malesuada.',
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(6),
            if (showPrice)
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  item.product.price.format(),
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('${'stock'.tr()}: ${item.product.quantityStock.toInt()}'),
                const Spacer(),
                InkWell(
                  onTap: onBack,
                  child: AbsorbPointer(
                    child: DropDownSmall<String>(
                      icon: Icons.numbers,
                      labelText: 'batch'.tr(),
                      itemAsString: (value) => value,
                      items: [item.product.batch],
                      initialValue: item.product.batch,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
            const Gap(12),
            _Quantity(item.product),
            const Gap(24),
            BlocBuilder<OrderCartBloc, List<CartItem>>(
              builder: (context, state) {
                final itemIndex = state.indexWhere(
                  (cart) => cart.product == item.product,
                );
                final quantity =
                    itemIndex == -1 ? 0 : state[itemIndex].quantity;
                return NumPad(
                  onTap: (value) {
                    switch (value) {
                      case '0':
                      case '1':
                      case '2':
                      case '3':
                      case '4':
                      case '5':
                      case '6':
                      case '7':
                      case '8':
                      case '9':
                        final newQuantity = double.tryParse(
                              quantity.toInt().toString() + value,
                            ) ??
                            0;
                        if (newQuantity > item.product.quantityStock) {
                          Toast(context).fail('stock_not_enough'.tr());
                          return;
                        }
                        _setQuantity(
                          context,
                          item.product,
                          newQuantity,
                        );
                      case 'backspace':
                        final quantityString = quantity.toInt().toString();
                        final newQuantityString = quantityString.length > 1
                            ? quantityString.substring(
                                0,
                                quantityString.length - 1,
                              )
                            : '0';
                        final newQuantity =
                            double.tryParse(newQuantityString) ?? 0;
                        _setQuantity(
                          context,
                          item.product,
                          newQuantity,
                        );
                      case 'OK':
                        Navigator.pop(context);
                      default:
                    }
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _Quantity extends StatelessWidget {
  const _Quantity(this.product);

  final ProductStockWithPrice product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCartBloc, List<CartItem>>(
      builder: (context, products) {
        final itemIndex =
            products.indexWhere((item) => item.product == product);
        final quantity = itemIndex == -1 ? 0 : products[itemIndex].quantity;
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.blueGrey.shade100,
          ),
          child: Row(
            children: [
              QuantityChangeButton(
                active: quantity > 0,
                isIncrease: false,
                onPressed: () {
                  context.read<OrderCartBloc>().add(
                        OrderCartEvent.decreaseQuantity(
                          product: product,
                        ),
                      );
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    quantity.toInt().toString(),
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              QuantityChangeButton(
                isIncrease: true,
                active: quantity < product.quantityStock,
                onPressed: () {
                  context.read<OrderCartBloc>().add(
                        OrderCartEvent.increaseQuantity(
                          product: product,
                        ),
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

class NumPad extends StatelessWidget {
  const NumPad({
    required this.onTap,
    super.key,
  });

  final void Function(String value) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: Row(
            children: [
              NumberButton(label: '1', onTap: onTap),
              const Gap(8),
              NumberButton(label: '2', onTap: onTap),
              const Gap(8),
              NumberButton(label: '3', onTap: onTap),
            ],
          ),
        ),
        const Gap(8),
        SizedBox(
          height: 80,
          child: Row(
            children: [
              NumberButton(label: '4', onTap: onTap),
              const Gap(8),
              NumberButton(label: '5', onTap: onTap),
              const Gap(8),
              NumberButton(label: '6', onTap: onTap),
            ],
          ),
        ),
        const Gap(8),
        SizedBox(
          height: 80,
          child: Row(
            children: [
              NumberButton(label: '7', onTap: onTap),
              const Gap(8),
              NumberButton(label: '8', onTap: onTap),
              const Gap(8),
              NumberButton(label: '9', onTap: onTap),
            ],
          ),
        ),
        const Gap(8),
        SizedBox(
          height: 80,
          child: Row(
            children: [
              NumberButton(
                label: 'OK',
                primary: true,
                onTap: onTap,
              ),
              const Gap(8),
              NumberButton(label: '0', onTap: onTap),
              const Gap(8),
              NumberButton(
                label: 'backspace',
                icon: Icons.backspace_outlined,
                onTap: onTap,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NumberButton extends StatelessWidget {
  const NumberButton({
    required this.onTap,
    required this.label,
    this.icon,
    super.key,
    this.primary = false,
  }) : assert(label != null || icon != null);
  final String label;
  final IconData? icon;
  final bool primary;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          color: primary ? primaryColor : theme.cardColor,
          child: InkWell(
            onTap: () => onTap(label),
            hoverColor: primaryColor.withOpacity(.2),
            splashColor: primaryColor.withOpacity(.2),
            highlightColor: primaryColor.withOpacity(.1),
            child: Center(
              child: icon == null
                  ? Text(
                      label,
                      style: TextStyle(
                        color: primary ? Colors.white : null,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Icon(icon),
            ),
          ),
        ),
      ),
    );
  }
}
