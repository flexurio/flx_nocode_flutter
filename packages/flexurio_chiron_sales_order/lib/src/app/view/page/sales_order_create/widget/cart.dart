import 'package:flexurio_chiron_sales_order/src/app/bloc/order_cart/order_cart_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/product_selected/product_selected_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order/sales_order_bloc.dart';
import '../sales_order_create_page.dart';
import 'cart_to_buy_small.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';

class Cart extends StatelessWidget {
  const Cart({
    required this.onItemTap,
    required this.onSubmit,
    required this.showPrice,
    super.key,
  });

  final void Function(CartItem)? onItemTap;
  final void Function(List<CartItem> products) onSubmit;
  final bool showPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: FCard(
        child: BlocBuilder<OrderCartBloc, List<CartItem>>(
          builder: (context, carts) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Order Details',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Gap(24),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return BlocBuilder<ProductSelectedBloc, CartItem?>(
                          builder: (context, state) {
                            final selected = state?.product.batch ==
                                carts[index].product.batch;
                            final item = carts[index];
                            return SizedBox(
                              width: 100,
                              child: Slidable(
                                key: Key(item.product.id),
                                startActionPane: _deleteActionPane(
                                  context,
                                  item.product,
                                ),
                                endActionPane: _deleteActionPane(
                                  context,
                                  item.product,
                                ),
                                child: InkWell(
                                  onTap: () => onItemTap?.call(item),
                                  child: CardProductToBuySmall(
                                    showPrice: showPrice,
                                    product: carts[index].product,
                                    selected: selected,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: carts.length,
                    ),
                  ),
                  const Gap(12),
                  DashedLine(color: Colors.blueGrey.shade100),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                    child: Column(
                      children: [
                        if (showPrice)
                          TileDataHorizontal(
                            label: 'Total',
                            labelRight: false,
                            child: Text(
                              carts.fold<double>(0, (total, cart) {
                                return total +
                                    (cart.quantity * cart.product.price);
                              }).format(),
                            ),
                          ),
                        const Gap(12),
                        _buildPlaceOrderButton(context, carts),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Row _buildPlaceOrderButton(
    BuildContext context,
    List<CartItem> products,
  ) {
    return Row(
      children: [
        Expanded(
          child: Button(
            rounded: true,
            action: DataAction.placeOrder,
            permission: null,
            onPressed: () {
              final bloc = context.read<SalesOrderBloc>();
              showDialog<bool?>(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  const action = DataAction.create;
                  return BlocListener<SalesOrderBloc, SalesOrderState>(
                    bloc: bloc,
                    listener: (context, state) {
                      state.maybeWhen(
                        success: () {
                          Toast(context).success(
                            Message.successCreated(Entity.salesOrder),
                          );
                          Navigator.pop(context, true);
                        },
                        error: (error) => Toast(context).fail(error),
                        orElse: () {},
                      );
                    },
                    child: BlocBuilder<SalesOrderBloc, SalesOrderState>(
                      bloc: bloc,
                      builder: (context, state) {
                        final isInProgress = state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );
                        return CardConfirmation(
                          isProgress: isInProgress,
                          action: action,
                          data: Entity.salesOrder,
                          onConfirm: () {
                            onSubmit(products);
                          },
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  ActionPane _deleteActionPane(
    BuildContext context,
    ProductStockWithPrice product,
  ) {
    return ActionPane(
      motion: const ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: () {
          context.read<OrderCartBloc>().add(
                OrderCartEvent.removeProduct(
                  product: product,
                ),
              );
        },
      ),
      children: [
        SlidableAction(
          onPressed: (_) {
            context.read<OrderCartBloc>().add(
                  OrderCartEvent.removeProduct(
                    product: product,
                  ),
                );
          },
          backgroundColor: const Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'delete'.tr(),
        ),
      ],
    );
  }
}
