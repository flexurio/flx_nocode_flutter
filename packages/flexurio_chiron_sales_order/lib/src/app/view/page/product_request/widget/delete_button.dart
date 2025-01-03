import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request/product_request_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductRequestDeleteButton extends StatelessWidget {
  const ProductRequestDeleteButton._({
    required this.productRequest,
    required this.refresh,
  });

  final void Function() refresh;

  static Widget prepare({
    required ProductRequest productRequest,
    required void Function() refresh,
  }) {
    return BlocProvider(
      create: (context) => ProductRequestBloc(),
      child: ProductRequestDeleteButton._(
        productRequest: productRequest,
        refresh: refresh,
      ),
    );
  }

  final ProductRequest productRequest;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.productRequestDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<ProductRequestBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          refresh();
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    ProductRequestBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<ProductRequestBloc, ProductRequestState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: (_) {
                Toast(context)
                    .success(Message.successDeleted(Entity.productRequest));
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<ProductRequestBloc, ProductRequestState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.productRequest,
                label: productRequest.id,
                onConfirm: () {
                  bloc.add(ProductRequestEvent.delete(productRequest));
                },
              );
            },
          ),
        );
      },
    );
  }
}
