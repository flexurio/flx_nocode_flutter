import 'package:flexurio_chiron_finance/src/app/bloc/cash_flow_query/cash_flow_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/cash_flow.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/cash_flow_create/cash_flow_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CashFlowEditButton extends StatelessWidget {
  const CashFlowEditButton({required this.cashFlow, super.key});

  final CashFlow cashFlow;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.cashFlowEdit,
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = context.read<CashFlowQueryBloc>();
        final success = await Navigator.push(
          context,
          CashFlowEditPage.route(
            cashFlow: cashFlow,
          ),
        );
        if (success ?? false) {
          queryBloc.add(const CashFlowQueryEvent.fetch());
        }
      },
    );
  }
}
