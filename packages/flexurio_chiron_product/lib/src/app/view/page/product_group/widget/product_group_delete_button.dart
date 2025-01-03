import 'package:flexurio_chiron_product/src/app/bloc/product_group/product_group_bloc.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product_group_query/product_group_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/permission.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductGroupDeleteButton extends StatelessWidget {
  const ProductGroupDeleteButton({required this.id, super.key});

  static Widget prepare({
    required String id,
  }) {
    return BlocProvider(
      create: (context) => ProductGroupBloc(),
      child: ProductGroupDeleteButton(
        id: id,
      ),
    );
  }

  final String id;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductGroupBloc>();
    final queryBloc = context.read<ProductGroupQueryBloc>();
    const action = DataAction.delete;
    return IconButtonSmall(
      permission: PermissionProduct.productGroupDelete,
      action: action,
      onPressed: () async {
        await _showDeleteDialog(context, bloc).then(
          (value) {
            if (value ?? false) {
              queryBloc.add(
                const ProductGroupQueryEvent.fetch(),
              );
            }
          },
        );
      },
    );
  }

  Future<bool?> _showDeleteDialog(
    BuildContext context,
    ProductGroupBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        final entity = Entity.productGroup;
        return BlocListener<ProductGroupBloc, ProductGroupState>(
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
          child: BlocBuilder<ProductGroupBloc, ProductGroupState>(
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
                label: id,
                onConfirm: () {
                  bloc.add(
                    ProductGroupEvent.delete(id),
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
