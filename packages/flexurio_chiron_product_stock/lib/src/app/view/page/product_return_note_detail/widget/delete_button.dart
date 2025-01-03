import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnNoteDetailDeleteButton extends StatelessWidget {
  const ProductReturnNoteDetailDeleteButton({
    required this.productReturnNoteDetail,
    super.key,
  });

  final ProductReturnNoteDetail productReturnNoteDetail;

  static Widget prepare({
    required ProductReturnNoteDetail productReturnNoteDetail,
  }) {
    return BlocProvider(
      create: (context) => ProductReturnNoteDetailBloc(),
      child: ProductReturnNoteDetailDeleteButton(
        productReturnNoteDetail: productReturnNoteDetail,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProductStock.productReturnNoteDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<ProductReturnNoteDetailBloc>();
        final queryBloc = context.read<ProductReturnNoteDetailQueryBloc>();
        final success = await _showDeleteDialog(context: context, bloc: bloc);
        if (success ?? false) {
          queryBloc.add(
            ProductReturnNoteDetailQueryEvent.fetch(
              productReturnNoteId: productReturnNoteDetail.productReturnNote.id,
            ),
          );
        }
      },
    );
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required ProductReturnNoteDetailBloc bloc,
  }) {
    final entity = Entity.productReturnNoteDetail;
    const action = DataAction.delete;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<ProductReturnNoteDetailBloc,
            ProductReturnNoteDetailState>(
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
          child: BlocBuilder<ProductReturnNoteDetailBloc,
              ProductReturnNoteDetailState>(
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
                label: productReturnNoteDetail.productReturn.id,
                onConfirm: () {
                  bloc.add(
                    ProductReturnNoteDetailEvent.delete(
                      id: productReturnNoteDetail.id,
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
