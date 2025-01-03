import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/accounts_receivable_group_query/accounts_receivable_group_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/accounts_receivable_group.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/accounts_receivable_group/widget/invoice_export_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/accounts_receivable_group/widget/special_invoice_export_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountsReceivableGroupDataTable extends StatefulWidget {
  const AccountsReceivableGroupDataTable({super.key});

  @override
  State<AccountsReceivableGroupDataTable> createState() =>
      _AccountsReceivableGroupDataTableState();
}

class _AccountsReceivableGroupDataTableState
    extends State<AccountsReceivableGroupDataTable> {
  final format = NumberFormat('#,##0.00', 'en_US');

  @override
  void initState() {
    super.initState();
    _fetchDataAccountsReceivableGroup(context, PageOptions.empty());
  }

  void _fetchDataAccountsReceivableGroup(
    BuildContext context,
    PageOptions<AccountsReceivableGroup>? pageOptions,
  ) {
    context.read<AccountsReceivableGroupQueryBloc>().add(
          AccountsReceivableGroupQueryEvent.fetch(
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
    return BlocBuilder<AccountsReceivableGroupQueryBloc,
        AccountsReceivableGroupQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<AccountsReceivableGroup>(
            pagination: false,
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () => _fetchDataAccountsReceivableGroup(context, null),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              _fetchDataAccountsReceivableGroup(context, pageOptions);
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
                  label: 'invoice'.tr(),
                  backendColumn: 'id',
                ),
                body: (accountsReceivableDetail) {
                  return DataCell(
                    Text(accountsReceivableDetail.id),
                  );
                },
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'address'.tr(),
                  backendColumn: 'city_delivery_address',
                ),
                body: (accountsReceivableDetail) {
                  return DataCell(
                    Text(accountsReceivableDetail.cityDeliveryAddress ?? '-'),
                  );
                },
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'invoice_date'.tr(),
                  backendColumn: 'date',
                ),
                body: (accountsReceivableDetail) {
                  return DataCell(
                    Text(
                      DateFormat('dd MMMM yyyy').format(
                        accountsReceivableDetail.date,
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
                  backendColumn: 'payment_amount',
                ),
                body: (accountsReceivableDetail) {
                  return DataCell(
                    Text(
                      accountsReceivableDetail.paymentAmount == 0
                          ? '0'
                          : format
                              .format(accountsReceivableDetail.paymentAmount),
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
