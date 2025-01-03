import 'package:appointment/constant/company.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/cash_flow/cash_flow_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/cash_flow_query/cash_flow_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/cash_flow.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CashFlowOpenButton extends StatelessWidget {
  const CashFlowOpenButton({
    required this.cashFlow,
    required this.company,
    super.key,
  });

  static Widget prepare({
    required CashFlow cashFlow,
    required Company company,
  }) {
    return BlocProvider(
      create: (context) => CashFlowBloc(),
      child: CashFlowOpenButton(cashFlow: cashFlow, company: company),
    );
  }

  final CashFlow cashFlow;
  final Company company;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.cashFlowEdit,
      action: DataAction.open,
      onPressed: () async {
        final cashFlowBloc = context.read<CashFlowBloc>();
        final cashFlowQueryBloc = context.read<CashFlowQueryBloc>();
        final success = await _showOpenDialog(context, cashFlowBloc);
        if (success ?? false) {
          cashFlowQueryBloc.add(
            const CashFlowQueryEvent.fetch(),
          );
        }
      },
    );
  }

  Future<bool?> _showOpenDialog(
    BuildContext context,
    CashFlowBloc cashFlowBloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.open;
        return BlocListener<CashFlowBloc, CashFlowState>(
          bloc: cashFlowBloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, Entity.cashFlow);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<CashFlowBloc, CashFlowState>(
            bloc: cashFlowBloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.cashFlow,
                label: cashFlow.noTransaction,
                onConfirm: () {
                  cashFlowBloc.add(CashFlowEvent.open(cashFlow.noTransaction));
                },
              );
            },
          ),
        );
      },
    );
  }
}
