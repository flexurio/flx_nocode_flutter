import 'package:flexurio_chiron_product/src/app/bloc/product/product_bloc.dart'
    as bloc;
import 'package:flexurio_chiron_product/src/app/bloc/product_query/bloc/product_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart' as model;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPhasedOutDeactivateSwitchButton extends StatelessWidget {
  const ProductPhasedOutDeactivateSwitchButton._({
    required this.product,
  });

  final model.Product product;

  static Widget prepare({
    required model.Product product,
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => bloc.ProductBloc(isExternal: isExternal),
      child: ProductPhasedOutDeactivateSwitchButton._(product: product),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: product.isPhasedOut,
      onChanged: (_) async {
        final productBloc = context.read<bloc.ProductBloc>();
        final queryBloc = context.read<ProductQueryBloc>();
        final action = product.isPhasedOut
            ? DataAction.deactivatePhaseOut
            : DataAction.activatePhaseOut;
        final success =
            await _showConfirmationDialog(context, productBloc, action);
        if (success ?? false) {
          queryBloc.add(const ProductQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    bloc.ProductBloc productBloc,
    DataAction action,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<bloc.ProductBloc, bloc.ProductState>(
          bloc: productBloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, Entity.product);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<bloc.ProductBloc, bloc.ProductState>(
            bloc: productBloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.product,
                label: product.name,
                onConfirm: () {
                  if (action == DataAction.activatePhaseOut) {
                    productBloc
                        .add(bloc.ProductEvent.phasedOut(product: product));
                  } else if (action == DataAction.deactivatePhaseOut) {
                    productBloc
                        .add(bloc.ProductEvent.notPhasedOut(product: product));
                  }
                  if (action == DataAction.activatePhaseOut) {
                    productBloc
                        .add(bloc.ProductEvent.deactivate(id: product.id));
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
