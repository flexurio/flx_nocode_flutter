import 'package:flexurio_chiron_accounting/src/app/bloc/budget_type_query/budget_type_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/budget_type.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PettyCashDropDownBudgetType extends StatefulWidget {
  const PettyCashDropDownBudgetType({super.key, this.chartOfAccountNumber});

  final ChartOfAccountNumber? chartOfAccountNumber;

  static Widget prepare(ChartOfAccountNumber? chartOfAccountNumber) {
    return BlocProvider(
      create: (context) {
        return BudgetTypeQueryBloc()
          ..add(
            BudgetTypeQueryEvent.fetch(
              chartOfAccount: chartOfAccountNumber,
            ),
          );
      },
      child: PettyCashDropDownBudgetType(
        chartOfAccountNumber: chartOfAccountNumber,
      ),
    );
  }

  @override
  State<PettyCashDropDownBudgetType> createState() =>
      PettyCashDropDownBudgetTypeState();
}

class PettyCashDropDownBudgetTypeState
    extends State<PettyCashDropDownBudgetType> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetTypeQueryBloc, BudgetTypeQueryState>(
      builder: (context, state) {
        return FDropDownSearch<BudgetType>(
          labelText: Entity.budgetType.title,
          onChanged: (value) {},
          itemAsString: (budgetType) => budgetType.name,
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (budgetTypes) => budgetTypes,
          ),
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: () => Status.progress,
            orElse: () => Status.loaded,
          ),
        );
      },
    );
  }
}
