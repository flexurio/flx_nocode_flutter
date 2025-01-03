import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order/sales_order_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_attachment_query/sales_order_attachment_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SalesOrderDetailSection extends StatelessWidget {
  const SalesOrderDetailSection({
    required this.salesOrder,
    required this.onPrevious,
    required this.bloc,
    required this.blocAttachment,
    super.key,
  });

  static Widget prepare({
    required SalesOrderBloc bloc,
    required SalesOrder salesOrder,
    required SalesOrderAttachmentQueryBloc blocAttachment,
    required void Function() onPrevious,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => bloc,
        ),
        BlocProvider(
          create: (context) => blocAttachment,
        ),
      ],
      child: SalesOrderDetailSection(
        bloc: bloc,
        salesOrder: salesOrder,
        onPrevious: onPrevious,
        blocAttachment: blocAttachment,
      ),
    );
  }

  final SalesOrderBloc bloc;
  final SalesOrder salesOrder;
  final SalesOrderAttachmentQueryBloc blocAttachment;
  final void Function() onPrevious;

  @override
  Widget build(BuildContext context) {
    SalesOrderHeaderInitial? salesOrderHeaderInitial;
    return BlocBuilder<SalesOrderBloc, SalesOrderState>(
      builder: (context, state) {
        state.maybeWhen(
          initial: (salesOrderHeader) {
            salesOrderHeaderInitial = salesOrderHeader;
          },
          orElse: () => const Center(child: CupertinoActivityIndicator()),
        );

        if (salesOrderHeaderInitial == null) {
          return const Center(child: CupertinoActivityIndicator());
        }
        return FormAction(
          children: [
            Column(
              children: [
                RowFields(
                  children: [
                    TileDataVertical(
                      label: 'Sales Order',
                      child: Text(salesOrderHeaderInitial!.salesOrderId!)
                          .canCopy(),
                    ),
                    TileDataVertical(
                      label: 'Sales Order Date',
                      child:
                          Text(salesOrderHeaderInitial!.salesOrderDate!.yMMMd),
                    ),
                  ],
                ),
                RowFields(
                  children: [
                    TileDataVertical(
                      label: 'Status',
                      child: ChipType(salesOrder.status),
                    ),
                    TileDataVertical(
                      label: 'purchase_order_distributor'.tr(),
                      child: Text(salesOrder
                                  .productRequest?.purchaseOrderDistributor ??
                              '-')
                          .canCopy(),
                    ),
                  ],
                ),
                RowFields(
                  children: [
                    TileDataVertical(
                      label: 'Revision No',
                      child:
                          Text(salesOrderHeaderInitial!.revisionNo!.toString()),
                    ),
                    TileDataVertical(
                      label: 'delivery_order_date'.tr(),
                      child: Text(
                        salesOrderHeaderInitial!.deliveryOrderDate == null
                            ? '-'
                            : salesOrderHeaderInitial!.deliveryOrderDate!.yMMMd,
                      ),
                    ),
                  ],
                ),
                RowFields(
                  children: [
                    TileDataVertical(
                      label: 'currency'.tr(),
                      child: Text(
                        salesOrderHeaderInitial!.productRequestId!.currency.id,
                      ),
                    ),
                    TileDataVertical(
                      label: 'Delivery Order',
                      child: Text(salesOrderHeaderInitial!.deliveryOrder!),
                    ),
                  ],
                ),
                RowFields(
                  children: [
                    TileDataVertical(
                      label: 'Department',
                      child: Text(
                        salesOrderHeaderInitial!
                            .productRequestId!.department.name,
                      ),
                    ),
                    TileDataVertical(
                      label: 'Customer',
                      child: Text(
                        salesOrderHeaderInitial!.productRequestId!.customer.id,
                      ),
                    ),
                  ],
                ),
                RowFields(
                  children: [
                    TileDataVertical(
                      label: 'Delivery Order Remark',
                      child: Text(
                        salesOrderHeaderInitial!.deliveryOrderRemark == null
                            ? '-'
                            : salesOrderHeaderInitial!.deliveryOrderRemark!,
                      ),
                    ),
                    TileDataVertical(
                      label: 'Term of Payment',
                      child: Text(
                        salesOrderHeaderInitial!.productRequestId!.termOfPayment
                            .toString(),
                      ),
                    ),
                  ],
                ),
                RowFields(
                  children: [
                    TileDataVertical(
                      label: 'Product Request',
                      child: Text(salesOrderHeaderInitial!.productRequestId!.id)
                          .canCopy(),
                    ),
                    TileDataVertical(
                      label: 'Product Type',
                      child: Text(
                        salesOrderHeaderInitial!.productRequestId!.typeProduct,
                      ),
                    ),
                  ],
                ),
                RowFields(
                  children: [
                    TileDataVertical(
                      label: 'Invoice ID',
                      child: Text(salesOrderHeaderInitial!.invoice!).canCopy(),
                    ),
                    TileDataVertical(
                      label: 'Transaction Type',
                      child: Text(
                        salesOrderHeaderInitial!
                            .productRequestId!.transactionType.name,
                      ),
                    ),
                  ],
                ),
                RowFields(
                  children: [
                    TileDataVertical(
                      label: 'Product Out ID',
                      child: Text(salesOrderHeaderInitial!.productIssue!)
                          .canCopy(),
                    ),
                    TileDataVertical(
                      label: 'Delivery Address',
                      child: Text(
                        salesOrderHeaderInitial!
                            .productRequestId!.deliveryAddress.address,
                      ),
                    ),
                  ],
                ),
                RowFields(
                  children: [
                    TileDataVertical(
                      label: 'Rate',
                      child: Text(
                        salesOrderHeaderInitial!.productRequestId!.rate
                            .toString(),
                      ),
                    ),
                    TileDataVertical(
                      label: 'Order Type',
                      child: Text(
                        salesOrderHeaderInitial!
                            .productRequestId!.orderType.name,
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                const RowFields(
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                RowFields(
                  children: [
                    TileDataVertical(
                      label: 'Description',
                      child: Text(salesOrderHeaderInitial!.description!),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
