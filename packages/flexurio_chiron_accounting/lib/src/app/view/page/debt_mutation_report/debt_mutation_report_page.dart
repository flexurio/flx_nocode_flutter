import 'package:flexurio_chiron_accounting/src/app/bloc/debt_mutation_report_invoice_due_date_query/debt_mutation_report_invoice_due_date_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/debt_mutation_report/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class DebtMutationReportPage extends StatelessWidget {
  const DebtMutationReportPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DebtMutationReportInvoiceDueDateQueryBloc()..add(
            DebtMutationReportInvoiceDueDateQueryEvent.fetch(
              pageOptions: PageOptions.empty(sortBy: 'supplier_id'),
            ),
          ),
        ),
      ],
      child: const DebtMutationReportPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityAccounting.debtMutationReport),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const DebtMutationReportInvoiceDateDataTable(),
        ),
      ],
    );
  }
}
