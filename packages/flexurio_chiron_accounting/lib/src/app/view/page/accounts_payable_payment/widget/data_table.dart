import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/accounts_payable_payment_detail_query/accounts_payable_payment_detail_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/accounts_payable_payment_detail.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/accounts_payable_payment/widget/recap_accounts_payable_detail_export_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/accounts_payable_payment/widget/recap_accounts_payable_global_export_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/accounts_payable_payment/widget/recap_accounts_payable_export_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountsPayablePaymentDetailDataTable extends StatefulWidget {
  const AccountsPayablePaymentDetailDataTable({super.key});

  @override
  State<AccountsPayablePaymentDetailDataTable> createState() => _AccountsPayablePaymentDetailDataTableState();
}

class _AccountsPayablePaymentDetailDataTableState extends State<AccountsPayablePaymentDetailDataTable> {
  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<AccountsPayablePaymentDetailQueryBloc>();
    return BlocBuilder<AccountsPayablePaymentDetailQueryBloc, AccountsPayablePaymentDetailQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<AccountsPayablePaymentDetail>(
            freezeFirstColumn: true,
            onRefresh: () {
              queryBloc.add(const AccountsPayablePaymentDetailQueryEvent.fetch());
            },
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<AccountsPayablePaymentDetailQueryBloc>().add(
                    AccountsPayablePaymentDetailQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: () => PageOptions.empty(
                sortBy: 'transaction_date',
              ),
            ),
            actionRight: (refreshButton) => [
              RecapAccountsPayablePaymentDetailExportPdfButton.prepare(),
              RecapAccountsPayablePaymentGlobalExportPdfButton.prepare(),
              RecapAccountsPayablePaymentExportPdfButton.prepare(),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 15,
                head: DTHead(
                  label: 'description'.tr(),
                  backendColumn: 'remark',
                ),
                body: (apPaymentDetail) => DataCell(
                  Text(apPaymentDetail.remark),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'date'.tr(),
                  backendColumn: 'transaction_date',
                ),
                body: (apPaymentDetail) => DataCell(
                  Text(apPaymentDetail.transactionDate),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'total'.tr(),
                  backendColumn: 'total',
                ),
                body: (apPaymentDetail) => DataCell(
                  Text((apPaymentDetail.total ?? 0).format()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
