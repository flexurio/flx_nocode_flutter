import 'package:flexurio_chiron_finance/src/app/bloc/cash_flow_query/cash_flow_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/cash_flow/widget/cash_flow_data_table.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/cash_flow/widget/filter_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CashFlowPage extends StatelessWidget {
  const CashFlowPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CashFlowQueryBloc(),
        ),
      ],
      child: const CashFlowPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FCard(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: CashFlowDataTable(
                          cashFlowQueryBloc: context.read<CashFlowQueryBloc>(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(24),
              const SizedBox(
                width: 300,
                child: Column(
                  children: [
                    Gap(12),
                    FilterForm(),
                    Divider(),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
