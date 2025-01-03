import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionStageProcessDeleteButton extends StatelessWidget {
  const ProductionStageProcessDeleteButton._({
    required this.stageProcess,
  });
  final ProductionStageProcessDetail stageProcess;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.transactionRoutineDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<ProductionStageProcessBloc>();
        final queryBloc = context.read<ProductionStageProcessQueryBloc>();
        final success = await _showDeleteDialog(bloc: bloc, context: context);
        if (success ?? false) {
          queryBloc.add(const ProductionStageProcessQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required ProductionStageProcessBloc bloc,
  }) {
    const action = DataAction.delete;
    final entity = Entity.product;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<ProductionStageProcessBloc,
            ProductionStageProcessState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: (_) {
                Toast(context).dataChanged(action, entity);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<ProductionStageProcessBloc,
              ProductionStageProcessState>(
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
                label: stageProcess.subStage.name,
                onConfirm: () {
                  bloc.add(
                    ProductionStageProcessEvent.delete(stageProcess),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  static Widget prepare({
    required ProductionStageProcessDetail stageProcess,
  }) {
    return BlocProvider(
      create: (context) => ProductionStageProcessBloc(),
      child: ProductionStageProcessDeleteButton._(stageProcess: stageProcess),
    );
  }
}
