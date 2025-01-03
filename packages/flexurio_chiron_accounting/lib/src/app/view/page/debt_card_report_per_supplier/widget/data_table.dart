import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/debt_card_report_per_supplier_invoice_date_query/debt_card_report_per_supplier_invoice_date_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/debt_card_report_per_supplier_invoice_date.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/debt_card_report_per_supplier/widget/debt_card_report_per_supplier_due_date_export_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/debt_card_report_per_supplier/widget/debt_card_report_per_supplier_invoice_date_export_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/debt_card_report_per_supplier/widget/debt_card_report_per_supplier_invoice_date_new_export_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DebtCardReportPerSupplierDataTable extends StatefulWidget {
  const DebtCardReportPerSupplierDataTable({super.key});

  @override
  State<DebtCardReportPerSupplierDataTable> createState() => _DebtCardReportPerSupplierDataTableState();
}

class _DebtCardReportPerSupplierDataTableState extends State<DebtCardReportPerSupplierDataTable> {
  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<DebtCardReportPerSupplierInvoiceDateQueryBloc>();
    return BlocBuilder<DebtCardReportPerSupplierInvoiceDateQueryBloc, DebtCardReportPerSupplierInvoiceDateQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<DebtCardReportPerSupplierInvoiceDate>(
            freezeFirstColumn: true,
            onRefresh: () {
              queryBloc.add(
                DebtCardReportPerSupplierInvoiceDateQueryEvent.fetch(
                  pageOptions: PageOptions.empty(sortBy: 'transaction_date'),
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
              context.read<DebtCardReportPerSupplierInvoiceDateQueryBloc>().add(
                DebtCardReportPerSupplierInvoiceDateQueryEvent.fetch(
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
              DebtCardReportPerSupplierInvoiceDateExportPdfButton.prepare(),
              DebtCardReportPerSupplierInvoiceDateNewExportPdfButton.prepare(),
              DebtCardReportPerSupplierDueDateExportPdfButton.prepare(),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'description'.tr(),
                  backendColumn: 'description',
                ),
                body: (debtCardReportPerSupplier) => DataCell(
                  Text(debtCardReportPerSupplier.description ?? '-'),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'date_receive_goods'.tr(),
                  backendColumn: 'transaction_date',
                ),
                body: (debtCardReportPerSupplier) => DataCell(
                  Text(
                    DateFormat('d MMM yyyy').format(
                      debtCardReportPerSupplier.transactionDate,
                    ),
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'transaction_no'.tr(),
                  backendColumn: 'transaction_no',
                ),
                body: (debtCardReportPerSupplier) => DataCell(
                  Text(debtCardReportPerSupplier.transactionNo ?? '-'),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'invoice_no'.tr(),
                  backendColumn: 'payment_no',
                ),
                body: (debtCardReportPerSupplier) => DataCell(
                  Text(debtCardReportPerSupplier.paymentNo ?? '-'),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'debit'.tr(),
                  backendColumn: 'debit_balance',
                ),
                body: (debtCardReportPerSupplier) => DataCell(
                  Text(debtCardReportPerSupplier.debitBalance.format()),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'credit'.tr(),
                  backendColumn: 'credit_balance',
                ),
                body: (debtCardReportPerSupplier) => DataCell(
                  Text(debtCardReportPerSupplier.creditBalance.format()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
