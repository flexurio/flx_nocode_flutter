import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/accounts_receivable_payment_detail_query/accounts_receivable_payment_detail_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/accounts_receivable_payment_detail.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/accounts_receivable_payment/widget/recap_accounts_receivable_detail_export_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/accounts_receivable_payment/widget/recap_accounts_receivable_global_export_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/accounts_receivable_payment/widget/recap_accounts_receivable_value_export_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountsReceivablePaymentDetailDataTable extends StatefulWidget {
  const AccountsReceivablePaymentDetailDataTable({super.key});

  @override
  State<AccountsReceivablePaymentDetailDataTable> createState() => _AccountsReceivablePaymentDetailDataTableState();
}

class _AccountsReceivablePaymentDetailDataTableState extends State<AccountsReceivablePaymentDetailDataTable> {
  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<AccountsReceivablePaymentDetailQueryBloc>();
    return BlocBuilder<AccountsReceivablePaymentDetailQueryBloc, AccountsReceivablePaymentDetailQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<AccountsReceivablePaymentDetail>(
            freezeFirstColumn: true,
            onRefresh: () {
              queryBloc.add(const AccountsReceivablePaymentDetailQueryEvent.fetch());
            },
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<AccountsReceivablePaymentDetailQueryBloc>().add(
                AccountsReceivablePaymentDetailQueryEvent.fetch(
                  pageOptions: pageOptions,
                ),
              );
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: () => PageOptions.empty(
                sortBy: 'kode,  name,  city_name, tgltrans',
              ),
            ),
            actionRight: (refreshButton) => [
              RecapAccountsReceivablePaymentDetailExportPdfButton.prepare(),
              RecapAccountsReceivablePaymentGlobalExportPdfButton.prepare(),
              RecapAccountsReceivablePaymentValueExportPdfButton.prepare(),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'description'.tr(),
                  backendColumn: 'remark',
                ),
                body: (purchaseSummaryDetail) => DataCell(
                  Text(purchaseSummaryDetail.remark),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'date'.tr(),
                  backendColumn: 'date',
                ),
                body: (purchaseSummaryDetail) => DataCell(
                  Text(purchaseSummaryDetail.date),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'total'.tr(),
                  backendColumn: 'total',
                ),
                body: (purchaseSummaryDetail) => DataCell(
                  Text((purchaseSummaryDetail.total ?? 0).format()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
