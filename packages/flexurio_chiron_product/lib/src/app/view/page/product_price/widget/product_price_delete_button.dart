import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPriceDeleteButton extends StatelessWidget {
  const ProductPriceDeleteButton._({
    required this.price,
    required this.product,
  });

  final Product product;

  static Widget prepare({
    required ProductPrice productPrice,
    required Product product,
  }) {
    return BlocProvider(
      create: (context) => ProductPriceBloc(),
      child: ProductPriceDeleteButton._(
        price: productPrice,
        product: product,
      ),
    );
  }

  final ProductPrice price;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProduct.productPriceDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<ProductPriceBloc>();
        final queryBloc = context.read<ProductPriceQueryBloc>();
        final success = await _showDeleteDialog(
          bloc: bloc,
          context: context,
          productPrice: price,
        );
        if (success ?? false) {
          queryBloc.add(ProductPriceQueryEvent.fetch(product: product));
        }
      },
    );
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required ProductPriceBloc bloc,
    required ProductPrice productPrice,
  }) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        final entity = Entity.productPrice;

        return BlocListener<ProductPriceBloc, ProductPriceState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, entity);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<ProductPriceBloc, ProductPriceState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: entity,
                label: productPrice.id.toString(),
                onConfirm: () {
                  bloc.add(
                    ProductPriceEvent.delete(
                      productPrice: productPrice,
                      product: product,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
