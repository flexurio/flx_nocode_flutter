import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnDetailCheckQCButton extends StatelessWidget {
  const ProductReturnDetailCheckQCButton({
    required this.productReturnDetail,
    super.key,
  });

  final ProductReturnDetail productReturnDetail;

  static Widget prepare({
    required ProductReturnDetail productReturnDetail,
  }) {
    return BlocProvider(
      create: (context) => ProductReturnDetailBloc(),
      child: ProductReturnDetailCheckQCButton(
        productReturnDetail: productReturnDetail,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.checkQc;
    return LightButton(
      permission: PermissionProductStock.productReturnQualityControlCheck,
      onPressed: () async {
        final bloc = context.read<ProductReturnDetailBloc>();
        await _showConfirmDialog(
          context: context,
          bloc: bloc,
          action: action,
        ).then((value) {
          if (value ?? false) {
            Navigator.pop(context, true);
          }
        });
      },
      action: DataAction.checkQc,
    );
  }

  Future<bool?> _showConfirmDialog({
    required BuildContext context,
    required ProductReturnDetailBloc bloc,
    required DataAction action,
  }) {
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
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: entity,
                label: productReturnDetail.productReturn.id,
                onConfirm: () {
                  bloc.add(
                    ProductReturnDetailEvent.checkQC(
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
