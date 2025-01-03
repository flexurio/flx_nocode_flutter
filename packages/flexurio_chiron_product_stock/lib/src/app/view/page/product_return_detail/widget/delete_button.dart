import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnDetailDeleteButton extends StatelessWidget {
  const ProductReturnDetailDeleteButton({
    required this.productReturnDetail,
    super.key,
  });

  final ProductReturnDetail productReturnDetail;

  static Widget prepare({
    required ProductReturnDetail productReturnDetail,
  }) {
    return BlocProvider(
      create: (context) => ProductReturnDetailBloc(),
      child: ProductReturnDetailDeleteButton(
        productReturnDetail: productReturnDetail,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.delete;
    return LightButton(
      permission: PermissionProductStock.productReturnDetailDelete,
      action: action,
      onPressed: () async {
        final bloc = context.read<ProductReturnDetailBloc>();
        await _showDeleteDialog(
          context: context,
          bloc: bloc,
        ).then((value) {
          Navigator.pop(context, true);
        });
      },
    );
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required ProductReturnDetailBloc bloc,
  }) {
    const action = DataAction.delete;
    final entity = Entity.productReturn;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<ProductReturnDetailBloc, ProductReturnDetailState>(
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
          child: BlocBuilder<ProductReturnDetailBloc, ProductReturnDetailState>(
            bloc: bloc,
            builder: (context, state) {
              return CardConfirmation(
                isProgress: state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                ),
                action: action,
                data: entity,
                label: productReturnDetail.productReturn.id,
                onConfirm: () {
                  bloc.add(
                    ProductReturnDetailEvent.delete(
                      id: productReturnDetail.id,
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
