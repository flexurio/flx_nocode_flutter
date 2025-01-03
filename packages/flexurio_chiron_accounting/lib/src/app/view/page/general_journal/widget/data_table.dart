import 'package:flexurio_chiron_accounting/src/app/bloc/general_journal_query/transaction_journal_accounting_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_journal_accounting.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/general_journal/widget/create_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/general_journal/widget/delete_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/general_journal/widget/view_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionJournalAccountingDataTable extends StatelessWidget {
  const TransactionJournalAccountingDataTable({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => TransactionJournalAccountingQueryBloc()
        ..add(
            const TransactionJournalAccountingQueryEvent.fetch(generals: true)),
      child: const TransactionJournalAccountingDataTable(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionJournalAccountingQueryBloc,
        TransactionJournalAccountingQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<TransactionJournalAccounting>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<TransactionJournalAccountingQueryBloc>().add(
                    TransactionJournalAccountingQueryEvent.fetch(
                      pageOptions: pageOptions,
                      generals: true,
                    ),
                  );
            },
            key: ValueKey(state.hashCode),
            onRefresh: () =>
                context.read<TransactionJournalAccountingQueryBloc>().add(
                      const TransactionJournalAccountingQueryEvent.fetch(
                          generals: true),
                    ),
            actionRight: (refreshButton) => [
              refreshButton,
              const TransactionJournalAccountingCreateButton(),
            ],
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'transaction_number'.tr(),
                  backendColumn: 'transaction_no',
                ),
                body: (transactionJournalAccounting) => DataCell(
                  Text(transactionJournalAccounting.transactionNo).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'debit',
                  numeric: true,
                  label: 'debt'.tr(),
                ),
                body: (transactionJournalAccounting) => DataCell(
                  Text(transactionJournalAccounting.debit.format()),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'credit',
                  numeric: true,
                  label: 'credit'.tr(),
                ),
                body: (transactionJournalAccounting) => DataCell(
                  Text(transactionJournalAccounting.credit.format()),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'date'.tr(),
                  backendColumn: 'transaction_date',
                ),
                body: (transactionJournalAccounting) => DataCell(
                  Text(transactionJournalAccounting.transactionDate.yMMMd),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'department'.tr(),
                  backendColumn: 'Department.name',
                ),
                body: (transactionJournalAccounting) => DataCell(
                  Text(
                    transactionJournalAccounting.department.name.isEmpty
                        ? '-'
                        : transactionJournalAccounting.department.name,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  backendColumn: 'chart_of_account_name',
                  label: 'Chart of Account',
                ),
                body: (transactionJournalAccounting) => DataCell(
                  Text(transactionJournalAccounting.chartOfAccountName),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  backendColumn: 'description',
                  label: 'description'.tr(),
                ),
                body: (transactionJournalAccounting) => DataCell(
                  Text(transactionJournalAccounting.description),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (transactionJournalAccounting) => DataCell(
                  Text(transactionJournalAccounting.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'updated_at',
                  label: 'updated_at'.tr(),
                ),
                body: (transactionJournalAccounting) => DataCell(
                  Text(transactionJournalAccounting.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  backendColumn: null,
                  label: 'actions'.tr(),
                ),
                body: (transactionJournalAccounting) => DataCell(
                  Row(
                    children: [
                      TransactionJournalAccountingViewButton(
                        transactionJournalAccounting:
                            transactionJournalAccounting,
                      ),
                      TransactionJournalAccountingDeleteButton.prepare(
                        transactionJournalAccounting:
                            transactionJournalAccounting,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
