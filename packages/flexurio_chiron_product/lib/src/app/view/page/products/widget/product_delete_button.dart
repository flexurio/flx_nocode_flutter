import 'package:flexurio_chiron_product/src/app/bloc/product/product_bloc.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product_query/bloc/product_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/permission.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDeleteButton extends StatelessWidget {
  const ProductDeleteButton._({
    required this.product,
    required this.isExternal,
  });

  final bool isExternal;

  static Widget prepare({
    required Product product,
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => ProductBloc(isExternal: isExternal),
      child: ProductDeleteButton._(product: product, isExternal: isExternal),
    );
  }

  final Product product;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProduct.productDelete(isExternal: isExternal),
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<ProductBloc>();
        final queryBloc = context.read<ProductQueryBloc>();
        final success = await _showDeleteDialog(bloc: bloc, context: context);
        if (success ?? false) {
          queryBloc.add(const ProductQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required ProductBloc bloc,
  }) {
    const action = DataAction.delete;
    final entity = Entity.product;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<ProductBloc, ProductState>(
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
          child: BlocBuilder<ProductBloc, ProductState>(
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
                label: product.name,
                onConfirm: () {
                  bloc.add(ProductEvent.delete(product.id));
                },
              );
            },
          ),
        );
      },
    );
  }
}
