import 'package:flexurio_chiron_finance/src/app/bloc/petty_cash/petty_cash_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/petty_cash_query/petty_cash_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_chiron_finance/src/app/model/petty_cash.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PettyCashRejectFinanceButton extends StatelessWidget {
  const PettyCashRejectFinanceButton._({
    required this.pettyCash,
  });

  static Widget prepare(PettyCash pettyCash) {
    return BlocProvider(
      create: (context) => PettyCashBloc(),
      child: PettyCashRejectFinanceButton._(pettyCash: pettyCash),
    );
  }

  final PettyCash pettyCash;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.rejectFinance;
    return LightButton(
      permission: PermissionFinance.pettyCashApproveFinance,
      action: action,
      onPressed: () async {
        final bloc = context.read<PettyCashBloc>();
        final queryBloc = context.read<PettyCashQueryBloc>();
        final success = await _showDialog(
          bloc: bloc,
          context: context,
          action: action,
        );
        if (success ?? false) {
          queryBloc.add(PettyCashQueryEvent.fetchById(pettyCash.id));
        }
      },
    );
  }

  Future<bool?> _showDialog({
    required BuildContext context,
    required PettyCashBloc bloc,
    required DataAction action,
  }) {
    final entity = Entity.pettyCash;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<PettyCashBloc, PettyCashState>(
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
          child: BlocBuilder<PettyCashBloc, PettyCashState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmationWithExplanation(
                isProgress: isInProgress,
                action: action,
                data: entity,
                label: pettyCash.id,
                onConfirm: (explanation) {
                  bloc.add(
                    PettyCashEvent.rejectFinance(pettyCash, explanation),
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
