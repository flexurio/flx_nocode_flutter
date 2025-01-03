import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnUndoConfirmPPICButton extends StatelessWidget {
  const ProductReturnUndoConfirmPPICButton({
    required this.productReturn,
    super.key,
  });

  final ProductReturn productReturn;

  static Widget prepare({
    required ProductReturn productReturn,
  }) {
    return BlocProvider(
      create: (context) => ProductReturnBloc(),
      child: ProductReturnUndoConfirmPPICButton(
        productReturn: productReturn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.undoConfirmPPIC;
    return LightButton(
      permission: PermissionProductStock.productReturnConfirmPpic,
      action: action,
      onPressed: () async {
        final bloc = context.read<ProductReturnBloc>();
        final queryBloc = context.read<ProductReturnQueryBloc>();
        await _showConfirmDialog(
          context: context,
          bloc: bloc,
          action: action,
        ).then((value) {
          if (value ?? false) {
            queryBloc.add(ProductReturnQueryEvent.fetchById(
              productReturn.id,
            ));
          }
        });
      },
    );
  }

  Future<bool?> _showConfirmDialog({
    required BuildContext context,
    required ProductReturnBloc bloc,
    required DataAction action,
  }) {
    final entity = Entity.productReturn;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<ProductReturnBloc, ProductReturnState>(
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
          child: BlocBuilder<ProductReturnBloc, ProductReturnState>(
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
                label: productReturn.id,
                onConfirm: () {
                  bloc.add(
                    ProductReturnEvent.undoConfirmPpic(
                      productReturn: productReturn,
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
