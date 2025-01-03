import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionStageProcessDetailDeleteButton extends StatelessWidget {
  const ProductionStageProcessDetailDeleteButton._({
    required this.stageProcess,
  });

  static Widget prepare(ProductionStageProcessDetail stageProcess) {
    return BlocProvider(
      create: (context) => ProductionStageProcessBloc(),
      child: ProductionStageProcessDetailDeleteButton._(
        stageProcess: stageProcess,
      ),
    );
  }

  final ProductionStageProcessDetail stageProcess;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<ProductionStageProcessBloc>();
        final temporaryBloc =
            context.read<ProductionStageProcessTemporaryBloc>();
        final success = await _showDeleteDialog(bloc: bloc, context: context);
        if (success ?? false) {
          temporaryBloc
              .add(ProductStageProcessTemporaryEvent.remove(stageProcess));
        }
      },
      permission: PermissionProduction.productionStageProcessDelete,
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
                  bloc.add(ProductionStageProcessEvent.delete(stageProcess));
                },
              );
            },
          ),
        );
      },
    );
  }
}
