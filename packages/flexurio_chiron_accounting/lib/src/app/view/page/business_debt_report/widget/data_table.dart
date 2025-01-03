import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/debt_balance_global_invoice_date_query/debt_balance_global_invoice_date_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/debt_balance_global_invoice_date.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/business_debt_report/widget/debt_balance_detail_due_date_export_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/business_debt_report/widget/debt_balance_detail_invoice_date_export_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/business_debt_report/widget/debt_balance_global_due_date_export_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/business_debt_report/widget/debt_balance_global_invoice_date_export_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessDebtReportDataTable extends StatefulWidget {
  const BusinessDebtReportDataTable({super.key});

  @override
  State<BusinessDebtReportDataTable> createState() =>
      _BusinessDebtReportDataTableState();
}

class _BusinessDebtReportDataTableState
    extends State<BusinessDebtReportDataTable> {
  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<DebtBalanceGlobalInvoiceDateQueryBloc>();
    return BlocBuilder<DebtBalanceGlobalInvoiceDateQueryBloc, DebtBalanceGlobalInvoiceDateQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<DebtBalanceGlobalInvoiceDate>(
            freezeFirstColumn: true,
            onRefresh: () {
              queryBloc.add(
                DebtBalanceGlobalInvoiceDateQueryEvent.fetch(
                  pageOptions: PageOptions.empty(sortBy: 'supplier_name'),
                ),
              );
            },
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<DebtBalanceGlobalInvoiceDateQueryBloc>().add(
                    DebtBalanceGlobalInvoiceDateQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: () => PageOptions.empty(
                sortBy: 'supplier_name',
              ),
            ),
            actionRight: (refreshButton) => [
              DebtBalanceDetailInvoiceDateExportPdfButton.prepare(),
              DebtBalanceGlobalInvoiceDateExportPdfButton.prepare(),
              DebtBalanceDetailDueDateExportPdfButton.prepare(),
              DebtBalanceGlobalDueDateExportPdfButton.prepare(),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 15,
                head: DTHead(
                  label: 'name'.tr() + 'supplier'.tr(),
                  backendColumn: 'supplier_name',
                ),
                body: (apPaymentDetail) => DataCell(
                  Text(apPaymentDetail.supplierName),
                ),
              ),
              DTColumn(
                widthFlex: 15,
                head: DTHead(
                  label: '${'total'.tr()} (Rp.)',
                  backendColumn: 'account_value',
                ),
                body: (apPaymentDetail) => DataCell(
                  Text(apPaymentDetail.accountValue.format()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
