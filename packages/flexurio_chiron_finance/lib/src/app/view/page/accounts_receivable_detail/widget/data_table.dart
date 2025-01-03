import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/accounts_receivable_detail_query/accounts_receivable_detail_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/accounts_receivable_detail.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/accounts_receivable_detail/widget/due_date_export_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/accounts_receivable_detail/widget/invoice_export_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/accounts_receivable_detail/widget/special_due_date_export_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/accounts_receivable_detail/widget/special_invoice_export_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountsReceivableDetailDataTable extends StatefulWidget {
  const AccountsReceivableDetailDataTable({super.key});

  @override
  State<AccountsReceivableDetailDataTable> createState() =>
      _AccountsReceivableDetailDataTableState();
}

class _AccountsReceivableDetailDataTableState
    extends State<AccountsReceivableDetailDataTable> {
  final format = NumberFormat('#,##0.00', 'en_US');

  @override
  void initState() {
    super.initState();
    _fetchDataAccountsReceivableDetail(context, PageOptions.empty());
  }

  void _fetchDataAccountsReceivableDetail(
    BuildContext context,
    PageOptions<AccountsReceivableDetail>? pageOptions,
  ) {
    context.read<AccountsReceivableDetailQueryBloc>().add(
          AccountsReceivableDetailQueryEvent.fetch(
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
    return BlocBuilder<AccountsReceivableDetailQueryBloc,
        AccountsReceivableDetailQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<AccountsReceivableDetail>(
            pagination: false,
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () => _fetchDataAccountsReceivableDetail(context, null),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              _fetchDataAccountsReceivableDetail(context, pageOptions);
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
                  label: 'description'.tr(),
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
                  label: 'invoice_date'.tr(),
                  backendColumn: 'transaction_date',
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
                  label: 'due_date'.tr(),
                  backendColumn: 'due_date',
                ),
                body: (accountsReceivableDetail) {
                  return DataCell(
                    Text(
                      DateFormat('dd MMMM yyyy').format(
                        accountsReceivableDetail.dueDate,
                      ),
                    ),
                  );
                },
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'amount'.tr(),
                  backendColumn: 'amount',
                ),
                body: (accountsReceivableDetail) {
                  return DataCell(
                    Text(
                      accountsReceivableDetail.amount == 0
                          ? '0'
                          : format.format(accountsReceivableDetail.amount),
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
