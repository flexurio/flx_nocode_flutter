import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_query/sales_order_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/view/page/sales_order/widget/sales_order_delivery_order_button.dart';
import 'create_button.dart';
import 'sales_order_invoice_print_button.dart';
import 'sales_order_delete_button.dart';
import 'sales_order_loan_requests_summary_export_button.dart';
import 'sales_order_malk_summary_export_button.dart';
import 'sales_order_summary_export_button.dart';
import 'sales_order_undo_confirm_button.dart';
import 'sales_order_view_button.dart';
import 'export_pdf_sales_order_button.dart';
import 'view_data_upload.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesOrderDataTable extends StatefulWidget {
  const SalesOrderDataTable({
    super.key,
    required this.isExternal,
    required this.isProductRequestOther,
  });
  final bool isExternal;
  final bool isProductRequestOther;

  @override
  State<SalesOrderDataTable> createState() => SalesOrderDataTableState();
}

class SalesOrderDataTableState extends State<SalesOrderDataTable> {
  var _status = SalesOrderStatus.input;
  var _pageOptions = PageOptions<SalesOrder>.empty();
  var _month = DateTime.now();

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  void _fetch() {
    context.read<SalesOrderQueryBloc>()
      ..add(
        SalesOrderQueryEvent.fetch(
          status: _status.label,
          pageOptions: _pageOptions,
          periodStart: _month.startOfMonth,
          periodEnd: _month.endOfMonth,
          orderTypeId: widget.isProductRequestOther ? "65" : null,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrderQueryBloc, SalesOrderQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<SalesOrder>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_, __) => Status.loaded,
              orElse: () => Status.error,
            ),
            onRefresh: () => _fetch(),
            pageOptions: state.maybeWhen(
              loaded: (data, __) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              LightButtonSmallGroup(
                action: DataAction.exportPdf,
                children: {
                  PermissionProductStock.salesOrderSummaryExportPdf:
                      SalesOrderSummaryExportButton(),
                  PermissionProductStock.salesOrderMalkSummaryExportPdf:
                      SalesOrderMalkSummaryExportButton(),
                  PermissionProductStock.salesOrderLoanRequestsSummaryExportPdf:
                      SalesOrderLoanRequestsSummaryExportButton(),
                },
              ),
              refreshButton,
              SalesOrderCreateButton(
                isExternal: widget.isExternal,
                isProductRequestOther: widget.isProductRequestOther,
              ),
            ],
            actionLeft: [
              _buildDropDownStatus(),
              _buildFilterSelectPeriod(),
            ],
            onChanged: (pageOptions) {
              _pageOptions = pageOptions;
              _fetch();
            },
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'id'.tr(),
                  backendColumn: 'id',
                ),
                body: (customer) => DataCell(
                  Text(customer.id).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'invoice'.tr(),
                  backendColumn: '',
                ),
                body: (salesOrder) => DataCell(
                  Text(salesOrder.invoiceId).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'product_request'.tr(),
                  backendColumn: '',
                ),
                body: (salesOrder) => DataCell(
                  Text(salesOrder.productRequest!.id).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'purchase_order_distributor'.tr(),
                  backendColumn: '',
                ),
                body: (salesOrder) => DataCell(
                  Text(salesOrder.productRequest?.purchaseOrderDistributor ??
                          '')
                      .canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'delivery_order'.tr(),
                  backendColumn: 'delivery_order_id',
                ),
                body: (salesOrder) => DataCell(
                  Text(salesOrder.deliveryOrderId).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 15,
                head: DTHead(
                  label: 'customer'.tr(),
                  backendColumn: 'sales_orders.customer_name',
                ),
                body: (salesOrder) => DataCell(
                  Text(
                      '${salesOrder.productRequest!.customer.id} - ${salesOrder.productRequest!.customer.name}'),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'discount_facture'.tr(),
                  backendColumn: 'discount_percent',
                ),
                body: (salesOrder) => DataCell(
                  Text(salesOrder.discountPercent.toString()),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Total',
                  backendColumn: 'total',
                ),
                body: (salesOrder) => DataCell(
                  Text(salesOrder.total.idr),
                ),
              ),
              DTColumn(
                widthFlex: 10,
                head: const DTHead(
                  label: 'Status',
                  backendColumn: 'status',
                ),
                body: (salesOrder) => DataCell(ChipType(salesOrder.status)),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_by'.tr(),
                  backendColumn: 'created_by_id',
                ),
                body: (customer) => DataCell(
                  GetNameUser(userId: customer.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (salesOrder) => DataCell(
                  Text(salesOrder.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Updated By',
                  backendColumn: 'updated_by_id',
                ),
                body: (customer) => DataCell(
                  GetNameUser(userId: customer.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'updated_at'.tr(),
                  backendColumn: 'updated_at',
                ),
                body: (customer) => DataCell(
                  Text(customer.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 14,
                head: DTHead(
                  label: 'actions'.tr(),
                  backendColumn: null,
                ),
                body: (salesOrder) => DataCell(_buildActions(salesOrder)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActions(SalesOrder salesOrder) {
    final bloc = context.read<SalesOrderQueryBloc>();
    final isExternal = widget.isExternal;
    final isProductRequestOther = widget.isProductRequestOther;

    return Row(
      children: [
        // View button
        SalesOrderViewButton(
          salesOrder: salesOrder,
          bloc: bloc,
          isExternal: isExternal,
          isProductRequestOther: isProductRequestOther,
        ),

        // Undo confirm button
        if (!isProductRequestOther &&
            [
              SalesOrderStatus.printDeliveryOrder,
              SalesOrderStatus.confirm,
            ].contains(salesOrder.status))
          SalesOrderUndoConfirmButton.prepare(
            salesOrder: salesOrder,
            bloc: bloc,
            isExternal: isExternal,
          ),

        // Print invoice button
        if (!isProductRequestOther &&
            !isExternal &&
            (salesOrder.status == SalesOrderStatus.printDeliveryOrder ||
                salesOrder.isConfirmAt == null))
          SalesOrderPrintInvoiceButton.prepare(
            salesOrder,
            onPrinted: _fetch,
          ),

        // View document
        if (!isProductRequestOther &&
            [
              SalesOrderStatus.printDeliveryOrder,
              SalesOrderStatus.confirm,
              SalesOrderStatus.printInvoice,
            ].contains(salesOrder.status))
          SalesOrderViewDocumentButton.prepare(
            salesOrder: salesOrder,
            bloc: bloc,
          ),

        // Export pdf
        if (!isProductRequestOther)
          ExportPdfSalesOrderButton.prepare(salesOrder: salesOrder),

        // Export delivery order
        if (!isProductRequestOther &&
            [SalesOrderStatus.confirm].contains(salesOrder.status))
          ExportDeliveryOrderButton.prepare(salesOrder),

        // Delete
        if (!isProductRequestOther &&
            salesOrder.status == SalesOrderStatus.input)
          _buildButtonDelete(salesOrder),
      ],
    );
  }

  Widget _buildFilterSelectPeriod() => DropDownSmallYearMonth(
        initialValue: _month,
        maxDate: DateTime.now(),
        labelText: 'period'.tr(),
        onChanged: (date) {
          _month = date;
          _fetch();
        },
      );

  Widget _buildButtonDelete(SalesOrder salesOrder) =>
      SalesOrderDeleteButton.prepare(
        salesOrder: salesOrder,
        bloc: context.read<SalesOrderQueryBloc>(),
        isExternal: widget.isExternal,
      );

  Widget _buildDropDownStatus() => DropDownSmall<SalesOrderStatus>(
        key: ValueKey(_status),
        initialValue: _status,
        labelText: 'Status',
        icon: Icons.filter_list,
        itemAsString: (status) => status.label,
        items: widget.isProductRequestOther
            ? SalesOrderStatus.listProductRequestOther
            : SalesOrderStatus.list,
        onChanged: (status) {
          if (status != null) {
            _status = status;
            _fetch();
          }
        },
      );
}
