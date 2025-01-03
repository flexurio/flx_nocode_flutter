import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order/sales_order_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_attachment_query/sales_order_attachment_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_detail/sales_order_detail_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_history_query/sales_order_history_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_query/sales_order_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/view/page/sales_order_detail/widget/additional_discount_edit_button.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import '../sales_order/widget/sales_order_confirm_button.dart';
import 'widget/sales_order_detail.dart';
import 'widget/sales_order_detail_data_table.dart';
import 'widget/sales_order_time_line_history.dart';

import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class SalesOrderViewPage extends StatefulWidget {
  const SalesOrderViewPage({
    required this.salesOrder,
    required this.salesOrderQuery,
    super.key,
    required this.isExternal,
    required this.isProductRequestOther,
  });
  final bool isExternal;
  final SalesOrder salesOrder;
  final bool isProductRequestOther;
  final SalesOrderQueryBloc salesOrderQuery;

  static Route<bool?> route({
    required SalesOrder salesOrder,
    required SalesOrderQueryBloc salesOrderQuery,
    required bool isExternal,
    required bool isProductRequestOther,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SalesOrderBloc()
              ..add(
                SalesOrderEvent.initialize(
                  salesOrderId: salesOrder,
                  revisionNo: salesOrder,
                ),
              ),
          ),
          BlocProvider(create: (context) => SalesOrderQueryBloc()),
          BlocProvider(
            create: (context) => SalesOrderDetailBloc()
              ..add(SalesOrderDetailEvent.fetch(salesOrder: salesOrder)),
          ),
          BlocProvider(
            create: (context) => SalesOrderHistoryQueryBloc()
              ..add(SalesOrderHistoryQueryEvent.fetch(salesOrder)),
          ),
          BlocProvider(
            create: (context) => SalesOrderAttachmentQueryBloc(),
          ),
        ],
        child: SalesOrderViewPage(
          salesOrder: salesOrder,
          salesOrderQuery: salesOrderQuery,
          isExternal: isExternal,
          isProductRequestOther: isProductRequestOther,
        ),
      ),
    );
  }

  @override
  State<SalesOrderViewPage> createState() => _SalesOrderViewPageState();
}

class _SalesOrderViewPageState extends State<SalesOrderViewPage> {
  @override
  void initState() {
    super.initState();
    _salesOrderInitialize();
  }

  void _salesOrderInitialize() {
    context.read<SalesOrderQueryBloc>().add(
          SalesOrderQueryEvent.fetchById(widget.salesOrder.id),
        );
    context.read<SalesOrderBloc>()
      ..add(
        SalesOrderEvent.initialize(
          salesOrderId: widget.salesOrder,
          revisionNo: widget.salesOrder,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.view;
    final entity = Entity.salesOrder;

    return BlocBuilder<SalesOrderQueryBloc, SalesOrderQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => Container(),
          loading: (_) => const ProgressingIndicator(),
          error: (error) => SomethingWrong(),
          loaded: (pageOptions, _) {
            if (pageOptions.data.isEmpty) {
              return Text('No Data');
            } else {
              final salesOrder = pageOptions.data.first;
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: ContentWithRightPanel(
                  rightPanel: SalesOrderHistoryTimeLine.prepare(
                    detailBloc: context.read<SalesOrderDetailBloc>(),
                    bloc: context.read<SalesOrderBloc>(),
                    blocAttachment:
                        context.read<SalesOrderAttachmentQueryBloc>(),
                  ),
                  child: SingleFormPanel(
                    action: action,
                    entity: entity,
                    size: SingleFormPanelSize.large,
                    actions: [
                      if (salesOrder.status == SalesOrderStatus.input)
                        SalesOrderConfirmButton.prepare(
                          salesOrder: salesOrder,
                          isExternal: widget.isExternal,
                          isProductRequestOther: widget.isProductRequestOther,
                          onConfirm: () {
                            _salesOrderInitialize();
                          },
                        ),
                      if (salesOrder.status ==
                          SalesOrderStatus.printDeliveryOrder)
                        SalesOrderAdditionalDiscountEditButton(
                            salesOrderId: salesOrder.id,
                            onSuccess: () {
                              _salesOrderInitialize();
                            }),
                    ],
                    children: [
                      SalesOrderDetailSection(
                        onPrevious: () {},
                        salesOrder: salesOrder,
                        bloc: context.read<SalesOrderBloc>(),
                        blocAttachment:
                            context.read<SalesOrderAttachmentQueryBloc>(),
                      ),
                      const Gap(40),
                      _buildTableDetails(salesOrder),
                      const Gap(12),
                      SalesOrderTotalDetails(
                        salesOrder: salesOrder,
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }

  Widget _buildTableDetails(SalesOrder salesOrder) {
    return SalesOrderDetailTable.prepare(
      isProductRequestOther: widget.isProductRequestOther,
      salesOrder: salesOrder,
      queryBloc: widget.salesOrderQuery,
      blocAttachment: context.read<SalesOrderAttachmentQueryBloc>(),
      isExternal: widget.isExternal,
    );
  }
}

class SalesOrderTotalDetails extends StatelessWidget {
  const SalesOrderTotalDetails({
    super.key,
    required this.salesOrder,
  });

  final SalesOrder salesOrder;

  @override
  Widget build(BuildContext context) {
    return VisibilityPermission(
      permission: PermissionProductStock.salesOrderAmountViewMenu,
      child: Column(
        children: [
          _buildDataSubtotal(),
          _buildDataDiscount(),
          _buildDataSubtotalAfterDiscount(),
          _buildDataAdditionDiscount(),
          _buildDataDiscountMargin(),
          _buildDataPph(),
          _buildDataPpn(),
          const Gap(6),
          const Align(
            alignment: Alignment.centerRight,
            child: SizedBox(width: 350, child: Divider(height: 12)),
          ),
          _buildDataGrandTotal(),
        ],
      ),
    );
  }

  Widget _buildDataDiscountMargin() {
    return TileDataHorizontal(
      label:
          'Discount Margin (${salesOrder.productRequest!.discountPercent.format()}%)',
      child: Text(
        (salesOrder.productRequest!.discountValue).toNegative().format(),
      ),
    );
  }

  Widget _buildDataAdditionDiscount() {
    return TileDataHorizontal(
      label:
          'Addition Discount (${salesOrder.additionalDiscountPercent.format()}%)',
      child: Text((salesOrder.additionalDiscountValue).toNegative().format()),
    );
  }

  Widget _buildDataSubtotalAfterDiscount() {
    return TileDataHorizontal(
      label: 'Subtotal After Discount',
      child: Text(salesOrder.subtotalAfterDiscount.format()),
    );
  }

  Widget _buildDataGrandTotal() {
    return TileDataHorizontal(
      label: 'Grand Total',
      labelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      child: Text(
        salesOrder.total.format(),
        style: const TextStyle(fontSize: 24),
      ),
    );
  }

  Widget _buildDataPph() {
    return TileDataHorizontal(
      label: 'PPH 22 (${salesOrder.pph22Percent.format()}%)',
      child: Text(salesOrder.pph22Value.format()),
    );
  }

  Widget _buildDataPpn() {
    return TileDataHorizontal(
      label: 'PPN (${salesOrder.ppnPercent.format()}%)',
      child: Text(salesOrder.ppnValue.format()),
    );
  }

  Widget _buildDataDiscount() {
    return TileDataHorizontal(
      label: 'Discount (${salesOrder.discountPercent.format()}%)',
      child: Text((salesOrder.discountValue).toNegative().format()),
    );
  }

  Widget _buildDataSubtotal() {
    return TileDataHorizontal(
      label: 'Subtotal',
      child: Text(salesOrder.subtotal.format()),
    );
  }
}
