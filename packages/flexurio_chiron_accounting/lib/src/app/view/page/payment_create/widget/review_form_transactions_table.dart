import 'package:flexurio_chiron_accounting/src/app/bloc/general_journal_query/transaction_journal_accounting_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_journal_accounting.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewFormTransactionsTable extends StatelessWidget {
  const ReviewFormTransactionsTable._({
    required this.action,
  });

  final Widget Function(TransactionJournalAccounting transaction)? action;

  static Widget prepare({
    required String transactionNo,
    Widget Function(TransactionJournalAccounting transaction)? action,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TransactionJournalAccountingQueryBloc>(
          create: (context) => TransactionJournalAccountingQueryBloc()
            ..add(
              TransactionJournalAccountingQueryEvent.fetch(
                generals: false,
                transactionNoEq: transactionNo,
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        )
      ],
      child: ReviewFormTransactionsTable._(action: action),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionJournalAccountingQueryBloc,
        TransactionJournalAccountingQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (pageOptions) {
            return YuhuTable<TransactionJournalAccounting>(
              key: ValueKey(pageOptions.data.length),
              width: 2000,
              freezeFirstColumn: true,
              freezeLastColumn: action != null,
              columns: [
                TableColumn(
                  width: 150,
                  title: 'transaction_date'.tr(),
                  builder: (transaction, _) {
                    return Text(transaction.transactionDate.yMMMMd);
                  },
                ),
                TableColumn(
                  width: 160,
                  alignment: Alignment.centerRight,
                  title: 'chart_of_account_id'.tr(),
                  builder: (transaction, _) {
                    return Text(transaction.chartOfAccountId);
                  },
                ),
                TableColumn(
                  width: 250,
                  title: 'chart_of_account'.tr(),
                  builder: (transaction, _) {
                    return Text(transaction.chartOfAccountName);
                  },
                ),
                TableColumn(
                  width: 160,
                  alignment: Alignment.centerRight,
                  title: 'Credit',
                  builder: (transaction, _) {
                    return Text(transaction.credit.format());
                  },
                ),
                TableColumn(
                  width: 140,
                  alignment: Alignment.centerRight,
                  title: 'Debit',
                  builder: (transaction, _) {
                    return Text(transaction.debit.format());
                  },
                ),
                TableColumn(
                  width: 140,
                  title: 'Count',
                  alignment: Alignment.centerRight,
                  builder: (transaction, _) {
                    return Text(transaction.count.format());
                  },
                ),
                TableColumn(
                  width: 140,
                  title: 'created_at'.tr(),
                  builder: (transaction, _) {
                    return Text(transaction.createdAt.yMMMMd);
                  },
                ),
                TableColumn(
                  title: 'description'.tr(),
                  builder: (transaction, _) {
                    return Text(transaction.description);
                  },
                ),
                if (action != null)
                  TableColumn(
                    width: 80,
                    title: 'actions'.tr(),
                    builder: (transaction, _) {
                      return action!(transaction);
                    },
                  ),
              ],
              data: pageOptions.data,
            );
          },
          orElse: () => Center(
            child: const CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
