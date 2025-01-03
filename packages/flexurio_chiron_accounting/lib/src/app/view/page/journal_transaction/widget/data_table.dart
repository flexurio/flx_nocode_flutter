import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/journal_transaction_query/journal_transaction_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/journal_transaction.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/journal_transaction/widget/export_excel_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JournalTransactionDataTable extends StatefulWidget {
  const JournalTransactionDataTable({super.key});

  @override
  State<JournalTransactionDataTable> createState() =>
      _JournalTransactionDataTableState();
}

class _JournalTransactionDataTableState
    extends State<JournalTransactionDataTable> {
  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<JournalTransactionQueryBloc>();
    return BlocBuilder<JournalTransactionQueryBloc,
        JournalTransactionQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<JournalTransaction>(
            freezeFirstColumn: true,
            onRefresh: () =>
                queryBloc.add(const JournalTransactionQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<JournalTransactionQueryBloc>().add(
                    JournalTransactionQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              JournalTransactionExportExcelButton.prepare(),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'date'.tr(),
                  backendColumn: 'date',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.date.ddMMyyyy),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  label: 'transaction'.tr(),
                  backendColumn: 'transaction_no',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.transactionNo),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  label: 'chart_of_account'.tr(),
                  backendColumn: 'chart_of_account_name',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.chartOfAccountName),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  label: 'debit'.tr(),
                  backendColumn: 'debet',
                  numeric: true,
                ),
                body: (journalTransaction) =>
                    DataCell(Text(journalTransaction.debet.format())),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  label: 'credit'.tr(),
                  backendColumn: 'credit',
                  numeric: true,
                ),
                body: (journalTransaction) =>
                    DataCell(Text(journalTransaction.credit.format())),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'description'.tr(),
                  backendColumn: 'description',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.description),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'department'.tr(),
                  backendColumn: 'department_name',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.departmentName),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: const DTHead(
                  label: 'LPB',
                  backendColumn: 'lpb',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.lpb),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'period'.tr(),
                  backendColumn: 'period',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.period),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
