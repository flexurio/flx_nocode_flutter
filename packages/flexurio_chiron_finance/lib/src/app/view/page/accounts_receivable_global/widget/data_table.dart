import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/accounts_receivable_global_query/accounts_receivable_global_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/accounts_receivable_global.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/accounts_receivable_global/widget/due_date_export_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/accounts_receivable_global/widget/invoice_export_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/accounts_receivable_global/widget/special_due_date_export_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/accounts_receivable_global/widget/special_invoice_export_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountsReceivableGlobalDataTable extends StatefulWidget {
  const AccountsReceivableGlobalDataTable({super.key});

  @override
  State<AccountsReceivableGlobalDataTable> createState() =>
      _AccountsReceivableGlobalDataTableState();
}

class _AccountsReceivableGlobalDataTableState
    extends State<AccountsReceivableGlobalDataTable> {
  final format = NumberFormat('#,##0.00', 'en_US');

  @override
  void initState() {
    super.initState();
    _fetchDataAccountsReceivableGlobal(context, PageOptions.empty());
  }

  void _fetchDataAccountsReceivableGlobal(
    BuildContext context,
    PageOptions<AccountsReceivableGlobal>? pageOptions,
  ) {
    context.read<AccountsReceivableGlobalQueryBloc>().add(
          AccountsReceivableGlobalQueryEvent.fetch(
            pageOptions: pageOptions,
            transactionType: TransactionType.empty(),
            customer: Customer.empty(),
            dueDate: null,
            transactionDate: DateTime.now(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountsReceivableGlobalQueryBloc,
        AccountsReceivableGlobalQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<AccountsReceivableGlobal>(
            pagination: false,
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () => _fetchDataAccountsReceivableGlobal(context, null),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              _fetchDataAccountsReceivableGlobal(context, pageOptions);
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              DueDateExportPdfButton.prepare(),
              SpecialDueDateExportPdfButton.prepare(),
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
                  label: 'balance'.tr(),
                  backendColumn: 'total_customer',
                ),
                body: (accountsReceivableDetail) {
                  return DataCell(
                    Text(
                      accountsReceivableDetail.totalCustomer == 0
                          ? '0'
                          : format
                              .format(accountsReceivableDetail.totalCustomer),
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
