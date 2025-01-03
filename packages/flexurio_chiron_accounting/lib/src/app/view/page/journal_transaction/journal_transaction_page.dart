import 'package:flexurio_chiron_accounting/src/app/bloc/journal_transaction_query/journal_transaction_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/journal_transaction/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class JournalTransactionPage extends StatelessWidget {
  const JournalTransactionPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => JournalTransactionQueryBloc()
            ..add(const JournalTransactionQueryEvent.fetch()),
        ),
      ],
      child: const JournalTransactionPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityAccounting.journalTransaction),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const JournalTransactionDataTable(),
        ),
      ],
    );
  }
}
