import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request/product_request_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductRequestDetailDeleteButton extends StatelessWidget {
  const ProductRequestDetailDeleteButton._({
    required this.productRequestDetail,
    required this.productRequest,
    required this.bloc,
  });

  final ProductRequestDetail productRequestDetail;
  final ProductRequestFormPurchaseOrder productRequest;
  final ProductRequestBloc bloc;

  static Widget prepare({
    required ProductRequestDetail productRequestDetail,
    required ProductRequestFormPurchaseOrder productRequest,
    required ProductRequestBloc bloc,
  }) {
    return BlocProvider(
      create: (context) => bloc,
      child: ProductRequestDetailDeleteButton._(
        productRequestDetail: productRequestDetail,
        productRequest: productRequest,
        bloc: bloc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.productRequestDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<ProductRequestBloc>();
        final queryBloc = context.read<ProductRequestBloc>();
        final success = await _showDeleteDialog(
          bloc: bloc,
          context: context,
          productRequestDetail: productRequestDetail,
        );
        if (success ?? false) {
          queryBloc.add(
            ProductRequestEvent.initialize(
              productRequest,
            ),
          );
        }
      },
    );
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required ProductRequestBloc bloc,
    required ProductRequestDetail productRequestDetail,
  }) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        final entity = Entity.productRequestDetail;

        return BlocListener<ProductRequestBloc, ProductRequestState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: (_) {
                Toast(context).dataChanged(action, entity);
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
                data: entity,
                label: productRequestDetail.id.toString(),
                onConfirm: () {
                  bloc.add(
                    ProductRequestEvent.deleteDetail(
                      productRequestDetail,
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
