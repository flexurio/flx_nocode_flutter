import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BalanceGroupDeleteButton extends StatelessWidget {
  const BalanceGroupDeleteButton._({
    required this.balanceGroup,
  });

  static Widget prepare({
    required BalanceGroup balanceGroup,
  }) {
    return BlocProvider(
      create: (context) => BalanceGroupBloc(),
      child: BalanceGroupDeleteButton._(
        balanceGroup: balanceGroup,
      ),
    );
  }

  final BalanceGroup balanceGroup;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionAccounting.balanceGroupDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<BalanceGroupBloc>();
        final queryBloc = context.read<BalanceGroupQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          queryBloc.add(const BalanceGroupQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    BalanceGroupBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<BalanceGroupBloc, BalanceGroupState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, Entity.balanceGroup);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<BalanceGroupBloc, BalanceGroupState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.balanceGroup,
                label: balanceGroup.name,
                onConfirm: () {
                  bloc.add(BalanceGroupEvent.delete(balanceGroup.id));
                },
              );
            },
          ),
        );
      },
    );
  }
}
