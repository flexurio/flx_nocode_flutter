import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_sub_stage/production_sub_stage_bloc.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_sub_stage_query/production_sub_stage_query_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionSubStageDeleteButton extends StatelessWidget {
  const ProductionSubStageDeleteButton._({
    required this.id,
  });

  static Widget prepare({
    required int id,
  }) {
    return BlocProvider(
      create: (context) => ProductionSubStageBloc(),
      child: ProductionSubStageDeleteButton._(id: id),
    );
  }

  final int id;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProduction.productionSubStageDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<ProductionSubStageBloc>();
        final queryBloc = context.read<ProductionSubStageQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          queryBloc.add(const ProductionSubStageQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    ProductionSubStageBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<ProductionSubStageBloc, ProductionSubStageState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () => Navigator.pop(context, true),
              orElse: () {},
            );
          },
          child: BlocBuilder<ProductionSubStageBloc, ProductionSubStageState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.productionSubStage,
                label: id.toString(),
                onConfirm: () {
                  bloc.add(ProductionSubStageEvent.delete(id));
                },
              );
            },
          ),
        );
      },
    );
  }
}
