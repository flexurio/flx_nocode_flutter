import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/accounts_receivable_mutation_query/accounts_receivable_mutation_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/accounts_receivable_mutation.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/accounts_receivable_mutation/widget/invoice_export_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/accounts_receivable_mutation/widget/special_invoice_export_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountsReceivableMutationDataTable extends StatefulWidget {
  const AccountsReceivableMutationDataTable({super.key});

  @override
  State<AccountsReceivableMutationDataTable> createState() =>
      _AccountsReceivableMutationDataTableState();
}

class _AccountsReceivableMutationDataTableState
    extends State<AccountsReceivableMutationDataTable> {
  final format = NumberFormat('#,##0.00', 'en_US');

  @override
  void initState() {
    super.initState();
    _fetchDataAccountsReceivableMutation(context, PageOptions.empty());
  }

  void _fetchDataAccountsReceivableMutation(
    BuildContext context,
    PageOptions<AccountsReceivableMutation>? pageOptions,
  ) {
    context.read<AccountsReceivableMutationQueryBloc>().add(
          AccountsReceivableMutationQueryEvent.fetch(
            pageOptions: pageOptions,
            transactionType: TransactionType.empty(),
            customer: Customer.empty(),
            dueDate: null,
            date: DateTime.now(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountsReceivableMutationQueryBloc,
        AccountsReceivableMutationQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<AccountsReceivableMutation>(
            pagination: false,
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () =>
                _fetchDataAccountsReceivableMutation(context, null),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              _fetchDataAccountsReceivableMutation(context, pageOptions);
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              InvoiceExportPdfButton.prepare(),
              SpecialInvoiceExportPdfButton.prepare(),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'customer'.tr(),
                  backendColumn: 'customer',
                ),
                body: (accountsReceivableDetail) {
                  return DataCell(
                    Text(accountsReceivableDetail.customer),
                  );
                },
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'beginning_balance'.tr(),
                  backendColumn: 'beginning_balance',
                ),
                body: (accountsReceivableDetail) {
                  return DataCell(
                    Text(
                      accountsReceivableDetail.beginningBalance == 0
                          ? '0'
                          : format.format(
                              accountsReceivableDetail.beginningBalance,
                            ),
                    ),
                  );
                },
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'debit'.tr(),
                  backendColumn: 'debit',
                ),
                body: (accountsReceivableDetail) {
                  return DataCell(
                    Text(
                      accountsReceivableDetail.debit == 0
                          ? '0'
                          : format.format(accountsReceivableDetail.debit),
                    ),
                  );
                },
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'credit'.tr(),
                  backendColumn: 'credit',
                ),
                body: (accountsReceivableDetail) {
                  return DataCell(
                    Text(
                      accountsReceivableDetail.credit == 0
                          ? '0'
                          : format.format(accountsReceivableDetail.credit),
                    ),
                  );
                },
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'ending_balance'.tr(),
                  backendColumn: 'ending_balance',
                ),
                body: (accountsReceivableDetail) {
                  return DataCell(
                    Text(
                      accountsReceivableDetail.endingBalance == 0
                          ? '0'
                          : format
                              .format(accountsReceivableDetail.endingBalance),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
