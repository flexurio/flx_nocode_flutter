import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_payment_query/transaction_payment_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_journal/widget/data_table.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';

class TransactionJournalPage extends StatelessWidget {
  const TransactionJournalPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TransactionPaymentQueryBloc()),
        BlocProvider(
          create: (context) => SupplierQueryBloc()
            ..add(
              SupplierQueryEvent.fetch(pageOptions: PageOptions.emptyNoLimit()),
            ),
        ),
        BlocProvider(
          create: (context) => CustomerQueryBloc()
            ..add(
              CustomerQueryEvent.fetch(pageOptions: PageOptions.emptyNoLimit()),
            ),
        ),
      ],
      child: const TransactionJournalPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityAccounting.transactionJournal),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const PaymentDataTable(),
        ),
      ],
    );
  }
}
