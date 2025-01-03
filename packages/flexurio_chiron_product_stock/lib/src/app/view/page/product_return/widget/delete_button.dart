import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnDeleteButton extends StatelessWidget {
  const ProductReturnDeleteButton(
      {required this.productReturn, required this.statusSelect, super.key});

  static Widget prepare({
    required ProductReturn productReturn,
    required ProductReturnStatus statusSelect,
  }) {
    return BlocProvider(
      create: (context) => ProductReturnBloc(),
      child: ProductReturnDeleteButton(
        productReturn: productReturn,
        statusSelect: statusSelect,
      ),
    );
  }

  final ProductReturn productReturn;
  final ProductReturnStatus statusSelect;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.delete;
    return LightButton(
      permission: PermissionProductStock.productReturnDelete,
      action: action,
      onPressed: () async {
        final bloc = context.read<ProductReturnBloc>();
        final queryBloc = context.read<ProductReturnQueryBloc>();
        await _showDeleteDialog(
          context: context,
          bloc: bloc,
          action: action,
        ).then((value) {
          if (value ?? false) {
            Navigator.pop(context, true);
            queryBloc.add(ProductReturnQueryEvent.fetch(
              status: statusSelect.id,
            ));
          }
        });
      },
    );
  }

  Future<bool?> _showDeleteDialog({
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
                    ProductReturnEvent.delete(
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
