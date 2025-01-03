import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionStageDeleteButton extends StatelessWidget {
  const ProductionStageDeleteButton._({
    required this.id,
  });

  static Widget prepare({
    required int id,
  }) {
    return BlocProvider(
      create: (context) => ProductionStageBloc(),
      child: ProductionStageDeleteButton._(id: id),
    );
  }

  final int id;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProduction.productionStageDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<ProductionStageBloc>();
        final queryBloc = context.read<ProductionStageQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          queryBloc.add(const ProductionStageQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    ProductionStageBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<ProductionStageBloc, ProductionStageState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () => Navigator.pop(context, true),
              orElse: () {},
            );
          },
          child: BlocBuilder<ProductionStageBloc, ProductionStageState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.productionStage,
                label: id.toString(),
                onConfirm: () {
                  bloc.add(ProductionStageEvent.delete(id));
                },
              );
            },
          ),
        );
      },
    );
  }
}
