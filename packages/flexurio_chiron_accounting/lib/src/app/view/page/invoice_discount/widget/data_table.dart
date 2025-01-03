import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/invoice_discount_query/invoice_discount_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/invoice_discount.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/invoice_discount/widget/export_pdf_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceDiscountDataTable extends StatefulWidget {
  const InvoiceDiscountDataTable({super.key});

  @override
  State<InvoiceDiscountDataTable> createState() =>
      _InvoiceDiscountDataTableState();
}

class _InvoiceDiscountDataTableState extends State<InvoiceDiscountDataTable> {
  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<InvoiceDiscountQueryBloc>();
    return BlocBuilder<InvoiceDiscountQueryBloc, InvoiceDiscountQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<InvoiceDiscount>(
            freezeFirstColumn: true,
            onRefresh: () =>
                queryBloc.add(const InvoiceDiscountQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<InvoiceDiscountQueryBloc>().add(
                    InvoiceDiscountQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              InvoiceDiscountExportPdfButton.prepare(),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'id'.tr(),
                  backendColumn: 'transaction_id',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.transactionId ?? ''),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'transaction_date'.tr(),
                  backendColumn: 'transaction_date',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.transactionDate ?? ''),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  numeric: true,
                  label: 'tax_invoice_number'.tr(),
                  backendColumn: 'tax_invoice_number',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.taxInvoiceNumber ?? ''),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  numeric: true,
                  label: 'subtotal'.tr(),
                  backendColumn: 'subtotal',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.subtotal?.format() ?? ''),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  numeric: true,
                  label: 'discount_amount'.tr(),
                  backendColumn: 'discount_value',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.discountValue?.format() ?? ''),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  numeric: true,
                  label: 'ppn_amount'.tr(),
                  backendColumn: 'ppn_value',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.ppnValue?.format() ?? ''),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  numeric: true,
                  label: 'total'.tr(),
                  backendColumn: 'total',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.total?.format() ?? ''),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  numeric: true,
                  label: 'additional_discount_amount'.tr(),
                  backendColumn: 'additional_discount_value',
                ),
                body: (journalTransaction) => DataCell(
                  Text(
                    journalTransaction.additionalDiscountValue?.format() ?? '',
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  numeric: true,
                  label: 'subtotal_summary'.tr(),
                  backendColumn: 'subtotal_summary',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.subtotalSummary?.format() ?? ''),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  numeric: true,
                  label: 'discount_amount_summary'.tr(),
                  backendColumn: 'discount_value_summary',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.discountValueSummary?.format() ?? ''),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  numeric: true,
                  label: 'ppn_amount_summary'.tr(),
                  backendColumn: 'ppn_value_summary',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.ppnValueSummary?.format() ?? ''),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  numeric: true,
                  label: 'total_summary'.tr(),
                  backendColumn: 'total_summary',
                ),
                body: (journalTransaction) => DataCell(
                  Text(journalTransaction.totalSummary?.format() ?? ''),
                ),
              ),
              DTColumn(
                widthFlex: 12,
                head: DTHead(
                  numeric: true,
                  label: 'additional_discount_amount_summary'.tr(),
                  backendColumn: 'additional_discount_value_summary',
                ),
                body: (journalTransaction) => DataCell(
                  Text(
                    journalTransaction.additionalDiscountValueSummary
                            ?.format() ??
                        '',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
