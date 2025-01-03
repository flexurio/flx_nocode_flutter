import 'package:flexurio_chiron_accounting/src/app/model/budget_type.dart'
    as model;
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BudgetTypeDeleteButton extends StatefulWidget {
  const BudgetTypeDeleteButton._({
    required this.budgetType,
    required this.clearParentId,
  });

  static Widget prepare({
    required model.BudgetType budgetType,
    required void Function() clearParentId,
  }) {
    return BlocProvider(
      create: (context) => BudgetTypeBloc(),
      child: BudgetTypeDeleteButton._(
        budgetType: budgetType,
        clearParentId: clearParentId,
      ),
    );
  }

  final model.BudgetType budgetType;
  final void Function() clearParentId;

  @override
  State<BudgetTypeDeleteButton> createState() => _BudgetTypeDeleteButtonState();
}

class _BudgetTypeDeleteButtonState extends State<BudgetTypeDeleteButton> {
  @override
  Widget build(BuildContext context) {
    final toast = Toast(context);
    const action = DataAction.delete;
    final entity = Entity.budgetType;
    final bloc = context.read<BudgetTypeBloc>();
    final queryBloc = context.read<BudgetTypeQueryBloc>();
    return IconButtonSmall(
      permission: PermissionAccounting.budgetTypeDelete,
      action: DataAction.delete,
      onPressed: () async {
        final success = await _showDeleteDialog(bloc: bloc, toast: toast);
        if (success ?? false) {
          widget.clearParentId();
          toast.dataChanged(action, entity);
          queryBloc.add(const BudgetTypeQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showDeleteDialog({
    required BudgetTypeBloc bloc,
    required Toast toast,
  }) {
    const action = DataAction.delete;
    final entity = Entity.budgetType;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<BudgetTypeBloc, BudgetTypeState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Navigator.pop(context, true);
              },
              error: (error) => toast.fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<BudgetTypeBloc, BudgetTypeState>(
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
                label: widget.budgetType.name,
                onConfirm: () {
                  bloc.add(BudgetTypeEvent.delete(widget.budgetType));
                },
              );
            },
          ),
        );
      },
    );
  }
}
