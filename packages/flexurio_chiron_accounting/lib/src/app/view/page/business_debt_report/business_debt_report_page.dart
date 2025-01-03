import 'package:flexurio_chiron_accounting/src/app/bloc/debt_balance_global_invoice_date_query/debt_balance_global_invoice_date_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/business_debt_report/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BusinessDebtReportPage extends StatelessWidget {
  const BusinessDebtReportPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DebtBalanceGlobalInvoiceDateQueryBloc()..add(
            DebtBalanceGlobalInvoiceDateQueryEvent.fetch(
              pageOptions: PageOptions.empty(sortBy: 'supplier_name'),
            ),
          ),
        ),
      ],
      child: const BusinessDebtReportPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityAccounting.businessDebtReport),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const BusinessDebtReportDataTable(),
        ),
      ],
    );
  }
}
