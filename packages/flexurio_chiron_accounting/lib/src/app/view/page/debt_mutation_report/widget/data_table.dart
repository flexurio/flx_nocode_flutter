import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/debt_mutation_report_invoice_due_date_query/debt_mutation_report_invoice_due_date_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/debt_mutation_report_invoice_due_date.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/debt_mutation_report/widget/debt_mutation_report_due_date_export_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/debt_mutation_report/widget/debt_mutation_report_invoice_date_export_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DebtMutationReportInvoiceDateDataTable extends StatefulWidget {
  const DebtMutationReportInvoiceDateDataTable({super.key});

  @override
  State<DebtMutationReportInvoiceDateDataTable> createState() => _DebtMutationReportInvoiceDateDataTableState();
}

class _DebtMutationReportInvoiceDateDataTableState extends State<DebtMutationReportInvoiceDateDataTable> {
  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<DebtMutationReportInvoiceDueDateQueryBloc>();
    return BlocBuilder<DebtMutationReportInvoiceDueDateQueryBloc, DebtMutationReportInvoiceDueDateQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<DebtMutationReportInvoiceDueDate>(
            freezeFirstColumn: true,
            onRefresh: () {
              queryBloc.add(
                DebtMutationReportInvoiceDueDateQueryEvent.fetch(
                  pageOptions: PageOptions.empty(sortBy: 'supplier_id'),
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
              context.read<DebtMutationReportInvoiceDueDateQueryBloc>().add(
                DebtMutationReportInvoiceDueDateQueryEvent.fetch(
                  pageOptions: pageOptions,
                ),
              );
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: () => PageOptions.empty(
                sortBy: 'supplier_id',
              ),
            ),
            actionRight: (refreshButton) => [
              DebtMutationReportInvoiceDateExportPdfButton.prepare(),
              DebtMutationReportDueDateExportPdfButton.prepare(),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'supplier'.tr(),
                  backendColumn: 'supplier_name',
                ),
                body: (apPaymentDetail) => DataCell(
                  Text(apPaymentDetail.supplierName),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'beginning_balance'.tr(),
                  backendColumn: 'beginning_balance',
                ),
                body: (apPaymentDetail) => DataCell(
                  Text(apPaymentDetail.beginningBalance.format()),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'debit'.tr(),
                  backendColumn: 'debit',
                ),
                body: (apPaymentDetail) => DataCell(
                  Text(apPaymentDetail.debit.format()),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'credit'.tr(),
                  backendColumn: 'credit',
                ),
                body: (apPaymentDetail) => DataCell(
                  Text(apPaymentDetail.credit.format()),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'ending_balance'.tr(),
                  backendColumn: 'ending_balance',
                ),
                body: (apPaymentDetail) => DataCell(
                  Text(apPaymentDetail.endingBalance.format()),
                ),
              ),              
            ],
          ),
        );
      },
    );
  }
}
