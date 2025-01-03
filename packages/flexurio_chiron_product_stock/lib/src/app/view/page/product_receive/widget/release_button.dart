import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive/product_receive_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive_detail_query/product_receive_detail_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/permission.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReceiveReleaseButton extends StatelessWidget {
  const ProductReceiveReleaseButton._({
    required this.productReceiveDetail,
    this.statusSelected,
    required this.isExternal,
  });
  final bool isExternal;

  static Widget prepare({
    required ProductReceiveDetail productReceiveDetail,
    String? statusSelected,
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => ProductReceiveBloc(isExternal: isExternal),
      child: ProductReceiveReleaseButton._(
        productReceiveDetail: productReceiveDetail,
        statusSelected: statusSelected,
        isExternal: isExternal,
      ),
    );
  }

  final ProductReceiveDetail productReceiveDetail;
  final String? statusSelected;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.release;
    return IconButtonSmall(
      permission:
          PermissionProductStock.productReceiveRelease(isExternal: isExternal),
      action: action,
      onPressed: () async {
        final bloc = context.read<ProductReceiveBloc>();
        final queryBloc = context.read<ProductReceiveDetailQueryBloc>();
        final success = await _showDeleteDialog(
          bloc: bloc,
          context: context,
          action: action,
        );
        if (success ?? false) {
          queryBloc.add(
            ProductReceiveDetailQueryEvent.fetch(
              status: statusSelected,
            ),
          );
        }
      },
    );
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required ProductReceiveBloc bloc,
    required DataAction action,
  }) {
    final entity = Entity.productReceive;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<ProductReceiveBloc, ProductReceiveState>(
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
          child: BlocBuilder<ProductReceiveBloc, ProductReceiveState>(
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
                label: productReceiveDetail.product.id,
                onConfirm: () {
                  bloc.add(
                    ProductReceiveEvent.productRelease(productReceiveDetail),
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
