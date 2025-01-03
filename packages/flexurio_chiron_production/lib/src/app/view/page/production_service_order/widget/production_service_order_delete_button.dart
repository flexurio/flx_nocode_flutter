import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionServiceOrderDeleteButton extends StatelessWidget {
  const ProductionServiceOrderDeleteButton._({
    required this.productionServiceOrder,
  });

  static Widget prepare({
    required ProductionServiceOrder productionServiceOrder,
  }) {
    return BlocProvider(
      create: (context) => ProductionServiceOrderBloc(),
      child: ProductionServiceOrderDeleteButton._(
        productionServiceOrder: productionServiceOrder,
      ),
    );
  }

  final ProductionServiceOrder productionServiceOrder;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      action: DataAction.delete,
      permission: PermissionProduction.productionServiceOrderDelete,
      onPressed: () async {
        final productionServiceOrderBloc =
            context.read<ProductionServiceOrderBloc>();
        final queryBloc = context.read<ProductionServiceOrderQueryBloc>();
        final success =
            await _showConfirmationDialog(context, productionServiceOrderBloc);
        if (success ?? false) {
          queryBloc.add(const ProductionServiceOrderQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    ProductionServiceOrderBloc productionServiceOrderBloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<ProductionServiceOrderBloc,
            ProductionServiceOrderState>(
          bloc: productionServiceOrderBloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context)
                    .dataChanged(action, Entity.productionServiceOrder);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<ProductionServiceOrderBloc,
              ProductionServiceOrderState>(
            bloc: productionServiceOrderBloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.productionServiceOrder,
                label: productionServiceOrder.productName,
                onConfirm: () {
                  productionServiceOrderBloc.add(
                    ProductionServiceOrderEvent.delete(productionServiceOrder),
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
