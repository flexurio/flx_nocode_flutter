import 'package:flexurio_chiron_product/src/app/bloc/product_formulation/product_formulation_bloc.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_query/product_formulation_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductFormulationActiveButton extends StatelessWidget {
  const ProductFormulationActiveButton({
    required this.productFormulation,
    required this.isExternal,
    super.key,
  });

  final ProductFormulation productFormulation;
  final bool isExternal;

  static Widget prepare({
    required ProductFormulation productFormulation,
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductFormulationBloc(isExternal: isExternal),
        ),
        BlocProvider(
          create: (context) =>
              ProductFormulationQueryBloc(isExternal: isExternal),
        ),
      ],
      child: ProductFormulationActiveButton(
        productFormulation: productFormulation,
        isExternal: isExternal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Button(
      action: DataAction.activate,
      permission: null,
      onPressed: () {
        final bloc = context.read<ProductFormulationBloc>();
        final queryBloc = context.read<ProductFormulationQueryBloc>();
        _showConfirmDialog(context, bloc, productFormulation).then((value) {
          if (value ?? false) {
            queryBloc.add(const ProductFormulationQueryEvent.fetch());
            Navigator.pop(context, true);
          }
        });
      },
    );
  }

  Future<bool?> _showConfirmDialog(
    BuildContext context,
    ProductFormulationBloc bloc,
    ProductFormulation productFormulation,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.activate;
        final entity = Entity.billOfMaterial;
        return BlocListener<ProductFormulationBloc, ProductFormulationState>(
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
          child: BlocBuilder<ProductFormulationBloc, ProductFormulationState>(
            bloc: bloc,
            builder: (context, state) {
              final isProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isProgress,
                action: action,
                data: entity,
                onConfirm: () {
                  bloc.add(
                    ProductFormulationEvent.active(productFormulation),
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
