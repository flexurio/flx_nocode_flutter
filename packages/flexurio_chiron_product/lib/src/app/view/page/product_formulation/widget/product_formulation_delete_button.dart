import 'package:flexurio_chiron_product/src/app/bloc/product_formulation/product_formulation_bloc.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_query/product_formulation_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/permission.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductFormulationDeleteButton extends StatelessWidget {
  const ProductFormulationDeleteButton._({
    required this.id,
    required this.isExternal,
  });
  final bool isExternal;

  static Widget prepare({
    required int id,
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => ProductFormulationBloc(isExternal: isExternal),
      child: ProductFormulationDeleteButton._(id: id, isExternal: isExternal),
    );
  }

  final int id;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission:
          PermissionProduct.productFormulationDelete(isExternal: isExternal),
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<ProductFormulationBloc>();
        final queryBloc = context.read<ProductFormulationQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          queryBloc.add(const ProductFormulationQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    ProductFormulationBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<ProductFormulationBloc, ProductFormulationState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context)
                    .dataChanged(DataAction.delete, Entity.billOfMaterial);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<ProductFormulationBloc, ProductFormulationState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: DataAction.delete,
                data: Entity.billOfMaterial,
                label: id.toString(),
                onConfirm: () {
                  bloc.add(ProductFormulationEvent.delete(id));
                },
              );
            },
          ),
        );
      },
    );
  }
}
