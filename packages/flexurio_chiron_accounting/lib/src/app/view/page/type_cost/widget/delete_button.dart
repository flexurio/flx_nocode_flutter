import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TypeCostDeleteButton extends StatelessWidget {
  const TypeCostDeleteButton({required this.typeCost, super.key});

  final TypeCost typeCost;

  static Widget prepare({
    required TypeCost typeCost,
  }) {
    return BlocProvider(
      create: (context) => TypeCostBloc(),
      child: TypeCostDeleteButton(
        typeCost: typeCost,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.delete;
    return IconButtonSmall(
      permission: PermissionAccounting.typeCostDelete,
      action: action,
      onPressed: () async {
        final bloc = context.read<TypeCostBloc>();
        final queryBloc = context.read<TypeCostQueryBloc>();
        await _showDeleteDialog(
          context: context,
          bloc: bloc,
          action: action,
        ).then((value) {
          if (value ?? false) {
            queryBloc.add(const TypeCostQueryEvent.fetch());
          }
        });
      },
    );
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required TypeCostBloc bloc,
    required DataAction action,
  }) {
    final entity = Entity.typeCost;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<TypeCostBloc, TypeCostState>(
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
          child: BlocBuilder<TypeCostBloc, TypeCostState>(
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
                label: typeCost.name,
                onConfirm: () {
                  bloc.add(
                    TypeCostEvent.delete(id: typeCost.id),
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
