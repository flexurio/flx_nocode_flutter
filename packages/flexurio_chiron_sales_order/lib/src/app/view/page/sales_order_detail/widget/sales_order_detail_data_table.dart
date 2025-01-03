import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order/sales_order_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_attachment_query/sales_order_attachment_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_detail/sales_order_detail_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_query/sales_order_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_detail.dart';
import 'package:flexurio_chiron_sales_order/src/app/view/page/sales_order_detail/widget/document_button.dart';
import 'sales_order_detail_edit_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SalesOrderDetailTable extends StatefulWidget {
  const SalesOrderDetailTable({
    required this.salesOrder,
    required this.queryBloc,
    required this.blocAttachment,
    super.key,
    required this.isExternal,
    required this.isProductRequestOther,
  });
  final bool isExternal;
  final bool isProductRequestOther;

  static Widget prepare({
    required SalesOrder salesOrder,
    required SalesOrderQueryBloc queryBloc,
    required SalesOrderAttachmentQueryBloc blocAttachment,
    required bool isExternal,
    required bool isProductRequestOther,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SalesOrderBloc(),
        ),
        BlocProvider(
          create: (context) => SalesOrderDetailBloc()
            ..add(SalesOrderDetailEvent.fetch(salesOrder: salesOrder)),
        ),
      ],
      child: SalesOrderDetailTable(
        salesOrder: salesOrder,
        queryBloc: queryBloc,
        blocAttachment: blocAttachment,
        isExternal: isExternal,
        isProductRequestOther: isProductRequestOther,
      ),
    );
  }

  final SalesOrder salesOrder;
  final SalesOrderQueryBloc queryBloc;
  final SalesOrderAttachmentQueryBloc blocAttachment;

  @override
  State<SalesOrderDetailTable> createState() => _SalesOrderDetailTableState();
}

class _SalesOrderDetailTableState extends State<SalesOrderDetailTable> {
  Map<SalesOrderDetail, ProductStock?>? _salesOrderDetail =
      <SalesOrderDetail, ProductStock?>{};
  bool? setHistory;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrderDetailBloc, SalesOrderDetailState>(
      builder: (context, state) {
        state.maybeWhen(
          initial: (history, salesOrderDetails) {
            _salesOrderDetail = salesOrderDetails;
            setHistory = history;
          },
          orElse: () {},
        );

        if (_salesOrderDetail == null) {
          return const Center(child: CupertinoActivityIndicator());
        }

        return Column(
          children: [
            const Gap(40),
            RowFields(
              children: [
                YuhuTable<SalesOrderDetail>(
                  width: 1300,
                  columns: [
                    TableColumn(
                      width: 170,
                      title: 'product_name'.tr(),
                      builder: (salesOrderDetail, _) {
                        return Text(salesOrderDetail.product!.name);
                      },
                    ),
                    TableColumn(
                      title: 'unit'.tr(),
                      width: 100,
                      builder: (salesOrderDetail, _) {
                        return Text(salesOrderDetail.unitId);
                      },
                    ),
                    TableColumn(
                      width: 130,
                      title: 'batch_no'.tr(),
                      builder: (salesOrderDetail, _) {
                        return Text(salesOrderDetail.batchNoId);
                      },
                    ),
                    TableColumn(
                      width: 190,
                      title: 'Quantity Sales Order',
                      builder: (salesOrderDetail, _) {
                        return Text(salesOrderDetail.quantity.toString());
                      },
                    ),
                    TableColumn(
                      title: 'discount'.tr(),
                      width: 180,
                      alignment: Alignment.centerRight,
                      builder: (salesOrderDetail, _) {
                        return VisibilityPermission(
                          permission:
                              PermissionProductStock.salesOrderAmountViewMenu,
                          child:
                              Text(salesOrderDetail.discountPercent.toString()),
                          orElse: Text('no_permission'.tr()),
                        );
                      },
                    ),
                    TableColumn(
                      title: 'price'.tr(),
                      width: 180,
                      alignment: Alignment.centerRight,
                      builder: (salesOrderDetail, _) {
                        return VisibilityPermission(
                          permission:
                              PermissionProductStock.salesOrderAmountViewMenu,
                          child: Text(salesOrderDetail.price!.idr),
                          orElse: Text('no_permission'.tr()),
                        );
                      },
                    ),
                    TableColumn(
                      width: 180,
                      title: 'subtotal'.tr(),
                      alignment: Alignment.centerRight,
                      builder: (salesOrderDetail, _) {
                        return VisibilityPermission(
                          permission:
                              PermissionProductStock.salesOrderAmountViewMenu,
                          child: Text(salesOrderDetail.price!.idr),
                          orElse: Text('no_permission'.tr()),
                        );
                      },
                    ),
                    if (widget.salesOrder.status !=
                        SalesOrderStatus.printDeliveryOrder)
                      if (widget.salesOrder.status !=
                          SalesOrderStatus.printInvoice)
                        TableColumn(
                          width: 100,
                          title: 'actions'.tr(),
                          alignment: Alignment.centerRight,
                          builder: (salesOrderDetail, _) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SalesOrderDetailEditButton(
                                  salesOrderDetail: salesOrderDetail,
                                  salesOrder: widget.salesOrder,
                                  bloc: widget.queryBloc,
                                  blocDetail:
                                      context.read<SalesOrderDetailBloc>(),
                                  isExternal: widget.isExternal,
                                ),
                              ],
                            );
                          },
                        ),
                  ],
                  data: _salesOrderDetail!.keys.toList(),
                ),
              ],
            ),
            const Gap(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (setHistory == false && !widget.isProductRequestOther)
                  SalesOrderDocumentButton.prepare(
                    widget.salesOrder,
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
