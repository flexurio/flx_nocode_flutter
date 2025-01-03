import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/invoice_receipt_query/invoice_receipt_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receipt.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receipt/widget/export_excel_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receipt/widget/export_pdf_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceReceiptDataTable extends StatefulWidget {
  const InvoiceReceiptDataTable({super.key});

  @override
  State<InvoiceReceiptDataTable> createState() =>
      _InvoiceReceiptDataTableState();
}

class _InvoiceReceiptDataTableState extends State<InvoiceReceiptDataTable> {
  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<InvoiceReceiptQueryBloc>();
    return BlocBuilder<InvoiceReceiptQueryBloc, InvoiceReceiptQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<InvoiceReceipt>(
            freezeFirstColumn: true,
            onRefresh: () =>
                queryBloc.add(const InvoiceReceiptQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<InvoiceReceiptQueryBloc>().add(
                    InvoiceReceiptQueryEvent.fetch(pageOptions: pageOptions),
                  );
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              InvoiceReceiptExportPdfButton.prepare(),
              InvoiceReceiptExportExcelButton.prepare(),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'tax_invoice_number'.tr(),
                  backendColumn: 'tax_invoice_number',
                ),
                body: (invoiceReceipt) => DataCell(
                  Text(invoiceReceipt.taxInvoiceNumber).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  label: 'date'.tr(),
                  backendColumn: 'date',
                ),
                body: (invoiceReceipt) =>
                    DataCell(Text(invoiceReceipt.date.yMMMd)),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  label: 'sales_order'.tr(),
                  backendColumn: 'order_id',
                ),
                body: (invoiceReceipt) => DataCell(
                  Text(invoiceReceipt.taxInvoiceNumber).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  label: 'invoice'.tr(),
                  backendColumn: 'transaction_no',
                ),
                body: (invoiceReceipt) => DataCell(
                  Text(invoiceReceipt.taxInvoiceNumber).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  label: 'pbf_name'.tr(),
                  backendColumn: 'delivery_address',
                ),
                body: (invoiceReceipt) => DataCell(
                  Text(invoiceReceipt.taxInvoiceNumber).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'amount'.tr(),
                  backendColumn: 'total',
                  numeric: true,
                ),
                body: (invoiceReceipt) =>
                    DataCell(Text(invoiceReceipt.total.format())),
              ),
            ],
          ),
        );
      },
    );
  }
}
