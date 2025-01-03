import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnNoteApproveButton extends StatelessWidget {
  const ProductReturnNoteApproveButton({
    required this.productReturnNote,
    super.key,
  });

  final ProductReturnNote productReturnNote;

  static Widget prepare({
    required ProductReturnNote productReturnNote,
  }) {
    return BlocProvider(
      create: (context) => ProductReturnNoteBloc(),
      child: ProductReturnNoteApproveButton(
        productReturnNote: productReturnNote,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: PermissionProductStock.productReturnNoteApprove,
      onPressed: () async {
        final bloc = context.read<ProductReturnNoteBloc>();
        final queryBloc = context.read<ProductReturnNoteQueryBloc>();
        final success = await _showDeleteDialog(context: context, bloc: bloc);
        if (success ?? false) {
          queryBloc.add(ProductReturnNoteQueryEvent.fetchById(
            productReturnNote.id,
          ));
        }
      },
      action: DataAction.approve,
    );
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required ProductReturnNoteBloc bloc,
  }) {
    final entity = Entity.productReturnNote;
    const action = DataAction.approve;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<ProductReturnNoteBloc, ProductReturnNoteState>(
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
          child: BlocBuilder<ProductReturnNoteBloc, ProductReturnNoteState>(
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
                label: productReturnNote.id,
                onConfirm: () {
                  bloc.add(
                    ProductReturnNoteEvent.approve(
                      productReturnNoteId: productReturnNote.id,
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
