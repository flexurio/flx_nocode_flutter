import 'package:flexurio_chiron_accounting/src/app/bloc/debt_card_report_per_supplier_invoice_date_query/debt_card_report_per_supplier_invoice_date_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/debt_card_report_per_supplier/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class DebtCardReportPerSupplierPage extends StatelessWidget {
  const DebtCardReportPerSupplierPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DebtCardReportPerSupplierInvoiceDateQueryBloc()..add(
            DebtCardReportPerSupplierInvoiceDateQueryEvent.fetch(
              pageOptions: PageOptions.empty(sortBy: 'transaction_date'),
            ),
          ),
        ),
      ],
      child: const DebtCardReportPerSupplierPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityAccounting.debtCardReportPerSupplier),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const DebtCardReportPerSupplierDataTable(),
        ),
      ],
    );
  }
}
