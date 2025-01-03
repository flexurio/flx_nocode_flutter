import 'package:flexurio_chiron_accounting/src/app/bloc/budget_realization_query/budget_realization_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/budget_realization/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BudgetRealizationCostPage extends StatelessWidget {
  const BudgetRealizationCostPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BudgetRealizationQueryBloc()),
      ],
      child: const BudgetRealizationCostPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.budgetRealization),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const BudgetRealizationDataTable(),
        ),
      ],
    );
  }
}
