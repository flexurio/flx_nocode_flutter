import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductNieDeleteButton extends StatelessWidget {
  const ProductNieDeleteButton._({
    required this.productNie,
    required this.product,
  });

  static Widget prepare({
    required ProductNie productNie,
    required Product product,
  }) {
    return BlocProvider(
      create: (context) => ProductNieBloc(),
      child: ProductNieDeleteButton._(productNie: productNie, product: product),
    );
  }

  final ProductNie productNie;
  final Product product;

  @override
  Widget build(BuildContext context) {
    final toast = Toast(context);
    return IconButtonSmall(
      permission: PermissionProduct.productNieDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<ProductNieBloc>();
        final queryBloc = context.read<ProductNieQueryBloc>();
        final success = await _showConfirmationDialog(
          bloc: bloc,
          context: context,
          toast: toast,
        );
        if (success ?? false) {
          queryBloc.add(ProductNieQueryEvent.get(productId: product.id));
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog({
    required BuildContext context,
    required ProductNieBloc bloc,
    required Toast toast,
  }) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<ProductNieBloc, ProductNieState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: (success) {
                Navigator.pop(context, true);
                toast.success(success!);
              },
              error: (error) {
                toast.fail(error);
              },
              orElse: () {},
            );
          },
          child: BlocBuilder<ProductNieBloc, ProductNieState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.productNie,
                label: productNie.id,
                onConfirm: () {
                  bloc.add(ProductNieEvent.delete(productNie, product));
                },
              );
            },
          ),
        );
      },
    );
  }
}
