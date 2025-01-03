import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/accounts_receivable_customer_query/accounts_receivable_customer_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/accounts_receivable_customer.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/accounts_receivable_customer/widget/invoice_export_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/accounts_receivable_customer/widget/special_invoice_export_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountsReceivableCustomerDataTable extends StatefulWidget {
  const AccountsReceivableCustomerDataTable({super.key});

  @override
  State<AccountsReceivableCustomerDataTable> createState() =>
      _AccountsReceivableCustomerDataTableState();
}

class _AccountsReceivableCustomerDataTableState
    extends State<AccountsReceivableCustomerDataTable> {
  final format = NumberFormat('#,##0.00', 'en_US');

  @override
  void initState() {
    super.initState();
    _fetchDataAccountsReceivableCustomer(context, PageOptions.empty());
  }

  void _fetchDataAccountsReceivableCustomer(
    BuildContext context,
    PageOptions<AccountsReceivableCustomer>? pageOptions,
  ) {
    context.read<AccountsReceivableCustomerQueryBloc>().add(
          AccountsReceivableCustomerQueryEvent.fetch(
            pageOptions: pageOptions,
            transactionType: TransactionType.empty(),
            customer: Customer.empty(),
            transactionDateGte: DateTime.now(),
            transactionDateLte: DateTime.now().add(const Duration(days: 5)),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountsReceivableCustomerQueryBloc,
        AccountsReceivableCustomerQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<AccountsReceivableCustomer>(
            pagination: false,
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () =>
                _fetchDataAccountsReceivableCustomer(context, null),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              _fetchDataAccountsReceivableCustomer(context, pageOptions);
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
                  label: 'description'.tr(),
                  backendColumn: 'description',
                ),
                body: (accountsReceivableDetail) {
                  return DataCell(
                    Text(accountsReceivableDetail.description),
                  );
                },
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'transaction_number'.tr(),
                  backendColumn: 'transaction_no',
                ),
                body: (accountsReceivableDetail) {
                  return DataCell(
                    Text(
                      DateFormat('dd MMMM yyyy').format(
                        accountsReceivableDetail.transactionDate,
                      ),
                    ),
                  );
                },
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'payment_no'.tr(),
                  backendColumn: 'payment_no',
                ),
                body: (accountsReceivableDetail) {
                  return DataCell(
                    Text(accountsReceivableDetail.paymentNo),
                  );
                },
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'invoice'.tr(),
                  backendColumn: 'transaction_no',
                ),
                body: (accountsReceivableDetail) {
                  return DataCell(
                    Text(accountsReceivableDetail.transactionNo),
                  );
                },
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'debit'.tr(),
                  backendColumn: 'debit_balance',
                ),
                body: (accountsReceivableDetail) {
                  return DataCell(
                    Text(
                      accountsReceivableDetail.debitBalance == 0
                          ? '0'
                          : format
                              .format(accountsReceivableDetail.debitBalance),
                    ),
                  );
                },
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'credit'.tr(),
                  backendColumn: 'credit_balance',
                ),
                body: (accountsReceivableDetail) {
                  return DataCell(
                    Text(
                      accountsReceivableDetail.creditBalance == 0
                          ? '0'
                          : format
                              .format(accountsReceivableDetail.creditBalance),
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
