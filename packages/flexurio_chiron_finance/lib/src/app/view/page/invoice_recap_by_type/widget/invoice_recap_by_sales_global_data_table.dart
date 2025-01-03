import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceRecapBySalesGlobalDataTable extends StatefulWidget {
  const InvoiceRecapBySalesGlobalDataTable({super.key});

  @override
  State<InvoiceRecapBySalesGlobalDataTable> createState() =>
      _InvoiceRecapBySalesGlobalDataTableState();
}

class _InvoiceRecapBySalesGlobalDataTableState
    extends State<InvoiceRecapBySalesGlobalDataTable> {
  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<InvoiceRecapBySalesGlobalQueryBloc>();
    return BlocBuilder<InvoiceRecapBySalesGlobalQueryBloc,
        InvoiceRecapBySalesGlobalQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<InvoiceRecapBySalesGlobal>(
            freezeFirstColumn: true,
            onRefresh: () => queryBloc
                .add(const InvoiceRecapBySalesGlobalQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<InvoiceRecapBySalesGlobalQueryBloc>().add(
                    InvoiceRecapBySalesGlobalQueryEvent.fetch(
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
              LightButtonSmallGroup(
                action: DataAction.exportPdf,
                children: {
                  PermissionFinance.invoiceRecapBySalesGlobalExportPdf:
                      InvoiceRecapBySalesGlobalExportPdfButton.prepare(),
                  PermissionFinance.invoiceRecapBySalesGlobalSpecialExportPdf:
                      InvoiceRecapBySalesGlobalSpecialExportPdfButton.prepare(),
                  PermissionFinance
                          .invoiceRecapBySalesGlobalSpecialAllExportPdf:
                      InvoiceRecapBySalesGlobalSpecialAllExportPdfButton
                          .prepare(),
                  PermissionFinance.invoiceRecapBySalesDetailExportPdf:
                      InvoiceRecapBySalesDetailExportPdfButton.prepare(),
                  PermissionFinance.invoiceRecapBySalesDetailSpecialExportPdf:
                      InvoiceRecapBySalesDetailSpecialExportPdfButton.prepare(),
                },
              ),
              ReprocessButton.prepare(),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 12,
                head: DTHead(
                  label: 'transaction'.tr(),
                  backendColumn: 'transaction_name',
                ),
                body: (invoiceReceipt) =>
                    DataCell(Text(invoiceReceipt.transactionName).canCopy()),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'customer_delivery_address'.tr(),
                  backendColumn: 'customer_delivery_address',
                ),
                body: (invoiceReceipt) => DataCell(
                  Text(invoiceReceipt.customerDeliveryAddress).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'subtotal'.tr(),
                  backendColumn: 'subtotal',
                  numeric: true,
                ),
                body: (invoiceReceipt) =>
                    DataCell(Text(invoiceReceipt.subtotal.format())),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'discount_amount'.tr(),
                  backendColumn: 'discount_value',
                  numeric: true,
                ),
                body: (invoiceReceipt) =>
                    DataCell(Text(invoiceReceipt.discountValue.format())),
              ),
              DTColumn(
                widthFlex: 9,
                head: DTHead(
                  label: 'additional_discount_amount'.tr(),
                  backendColumn: 'additional_discount_value',
                  numeric: true,
                ),
                body: (invoiceReceipt) => DataCell(
                  Text(invoiceReceipt.additionalDiscountValue.format()),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'ppn_amount'.tr(),
                  backendColumn: 'ppn_value',
                  numeric: true,
                ),
                body: (invoiceReceipt) =>
                    DataCell(Text(invoiceReceipt.ppnValue.format())),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'total'.tr(),
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
