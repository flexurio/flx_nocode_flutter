import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_sub_stage/production_sub_stage_bloc.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_sub_stage_query/production_sub_stage_query_bloc.dart';
import 'package:flexurio_chiron_production/src/app/model/production_sub_stage.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionSubStageActivateDeactivateButton extends StatefulWidget {
  const ProductionSubStageActivateDeactivateButton({
    required this.productionSubStage,
    super.key,
  });

  final ProductionSubStage productionSubStage;

  static Widget prepare(ProductionSubStage productionSubStage) {
    return BlocProvider(
      create: (context) => ProductionSubStageBloc(),
      child: ProductionSubStageActivateDeactivateButton(
        productionSubStage: productionSubStage,
      ),
    );
  }

  @override
  State<ProductionSubStageActivateDeactivateButton> createState() =>
      _ProductionSubStageActivateDeactivateButtonState();
}

class _ProductionSubStageActivateDeactivateButtonState
    extends State<ProductionSubStageActivateDeactivateButton> {
  late bool _isActive;
  @override
  void initState() {
    _isActive = widget.productionSubStage.isActive;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final action = _isActive ? DataAction.deactivate : DataAction.activate;
    return IconButtonSmall(
      action: action,
      permission: _isActive
          ? PermissionProduction.productionSubStageActivate
          : PermissionProduction.productionSubStageDeactivate,
      onPressed: () async {
        final bloc = context.read<ProductionSubStageBloc>();
        final queryBloc = context.read<ProductionSubStageQueryBloc>();
        final success = await _showConfirmDialog(
          bloc: bloc,
          context: context,
          action: action,
        );
        if (success ?? false) {
          queryBloc.add(const ProductionSubStageQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showConfirmDialog({
    required BuildContext context,
    required ProductionSubStageBloc bloc,
    required DataAction action,
  }) {
    final entity = Entity.productionSubStage;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<ProductionSubStageBloc, ProductionSubStageState>(
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
                data: entity,
                label: widget.productionSubStage.name,
                onConfirm: () {
                  if (_isActive) {
                    bloc.add(
                      ProductionSubStageEvent.deactivate(
                        widget.productionSubStage,
                      ),
                    );
                  } else if (!_isActive) {
                    bloc.add(
                      ProductionSubStageEvent.activate(
                        widget.productionSubStage,
                      ),
                    );
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
