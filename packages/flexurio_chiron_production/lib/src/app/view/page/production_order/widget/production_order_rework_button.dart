import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionOrderReworkButton extends StatelessWidget {
  const ProductionOrderReworkButton._({
    required this.productionOrder,
    required this.isExternal,
  });

  static Widget prepare({
    required ProductionOrder productionOrder,
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => ProductionOrderBloc(isExternal: isExternal),
      child: ProductionOrderReworkButton._(
        productionOrder: productionOrder,
        isExternal: isExternal,
      ),
    );
  }

  final bool isExternal;
  final ProductionOrder productionOrder;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission:
          PermissionProduction.productionOrderRework(isExternal: isExternal),
      action: DataAction.rework,
      onPressed: () async {
        final bloc = context.read<ProductionOrderBloc>();
        final queryBloc = context.read<ProductionOrderQueryBloc>();
        final success = await _showReworkDialog(bloc: bloc, context: context);
        if (success ?? false) {
          queryBloc.add(const ProductionOrderQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showReworkDialog({
    required BuildContext context,
    required ProductionOrderBloc bloc,
  }) {
    const action = DataAction.rework;
    final entity = Entity.productionOrder;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<ProductionOrderBloc, ProductionOrderState>(
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
          child: BlocBuilder<ProductionOrderBloc, ProductionOrderState>(
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
                label: productionOrder.id,
                onConfirm: () {
                  bloc.add(ProductionOrderEvent.rework(productionOrder));
                },
              );
            },
          ),
        );
      },
    );
  }
}
