import 'package:flexurio_chiron_product_stock/src/app/bloc/product_issue/product_issue_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_issue_detail/product_issue_detail.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_issue.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_issue_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class ProductIssueDetailPage extends StatefulWidget {
  const ProductIssueDetailPage._({required this.productIssue});

  final ProductIssue productIssue;

  static Route<bool?> route({
    required ProductIssue productIssue,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductIssueBloc()),
          BlocProvider(
            create: (context) => ProductIssueDetailQueryBloc()
              ..add(ProductIssueDetailQueryEvent.fetch(productIssue)),
          ),
        ],
        child: ProductIssueDetailPage._(
          productIssue: productIssue,
        ),
      ),
    );
  }

  @override
  State<ProductIssueDetailPage> createState() => _ProductIssueDetailPageState();
}

class _ProductIssueDetailPageState extends State<ProductIssueDetailPage> {
  @override
  Widget build(BuildContext context) {
    const action = DataAction.viewDetail;
    final entity = Entity.productIssue;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleFormPanel(
        size: SingleFormPanelSize.large,
        action: action,
        entity: entity,
        children: [
          BlocBuilder<ProductIssueDetailQueryBloc,
              ProductIssueDetailQueryState>(
            builder: (context, state) {
              return FormAction(
                children: [
                  RowFields(
                    children: [
                      Column(
                        children: [
                          TileDataVertical(
                            label: 'Delivery Order ID',
                            child: Text(widget.productIssue.deliveryOrderId),
                          ),
                          TileDataVertical(
                            label: 'Sales Order ID',
                            child:
                                Text(widget.productIssue.salesOrderId ?? '-'),
                          ),
                          TileDataVertical(
                            label: 'delivery_order_date'.tr(),
                            child: Text(
                              widget.productIssue.deliveryOrderDate?.yMMMdHm ??
                                  '-',
                            ),
                          ),
                          TileDataVertical(
                            label: 'Delivery Order Received',
                            child: Text(
                              widget.productIssue.deliveryOrderReceived
                                      ?.yMMMdHm ??
                                  '-',
                            ),
                          ),
                          TileDataVertical(
                            label: 'delivery_date'.tr(),
                            child: Text(
                              widget.productIssue.deliveryDate?.yMMMdHm ?? '-',
                            ),
                          ),
                          TileDataVertical(
                            label: 'End Packing Date',
                            child: Text(
                              widget.productIssue.endPackingDate?.yMMMdHm ??
                                  '-',
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TileDataVertical(
                            label: 'Expedition',
                            child: Text(
                              widget.productIssue.expedition.isNotEmpty
                                  ? widget.productIssue.expedition
                                  : '-',
                            ),
                          ),
                          TileDataVertical(
                            label: 'Shipping Number',
                            child: Text(
                              widget.productIssue.shippingNo.isNotEmpty
                                  ? widget.productIssue.shippingNo
                                  : '-',
                            ),
                          ),
                          if (widget.productIssue.shipmentVia ==
                              ProductIssueShipmentVia.empty)
                            const TileDataVertical(
                              label: 'Shipping Method',
                              child: Text('-'),
                            ),
                          if (widget.productIssue.shipmentVia !=
                              ProductIssueShipmentVia.empty)
                            TileDataVertical(
                              label: 'Shipping Method',
                              child: ChipType(widget.productIssue.shipmentVia),
                            ),
                          TileDataVertical(
                            label: 'Shipping Charge',
                            child: Text(
                              'Rp. ${widget.productIssue.shippingCharge!.format()}',
                            ),
                          ),
                          TileDataVertical(
                            label: 'Package QTY/KOLI',
                            child:
                                Text(widget.productIssue.packageQty.toString()),
                          ),
                          TileDataVertical(
                            label: 'Kilogram QTY',
                            child:
                                Text('${widget.productIssue.kilogramQty} KG'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<ProductIssueDetailQueryBloc,
                      ProductIssueDetailQueryState>(
                    builder: (context, state) {
                      return YuhuTable<ProductIssueDetail>(
                        data: state.maybeWhen(
                          orElse: () => [],
                          loaded: (productIssueDetail) => productIssueDetail,
                        ),
                        status: state.maybeWhen(
                          loaded: (_) => Status.loaded,
                          loading: () => Status.progress,
                          orElse: () => Status.error,
                        ),
                        columns: [
                          TableColumn(
                            sortString: (productIssueDetail) =>
                                productIssueDetail.product.name,
                            title: 'Product',
                            builder: (productIssueDetail, _) {
                              return Text(productIssueDetail.product.name);
                            },
                          ),
                          TableColumn(
                            sortString: (productIssueDetail) =>
                                productIssueDetail.productionOrder.id,
                            title: 'Batch',
                            builder: (productIssueDetail, _) {
                              return Text(
                                productIssueDetail.productionOrder.id,
                              );
                            },
                          ),
                          TableColumn(
                            sortNum: (productIssueDetail) =>
                                productIssueDetail.qty,
                            title: 'Quantity',
                            builder: (productIssueDetail, _) {
                              return Text(productIssueDetail.qty.toString());
                            },
                          ),
                          TableColumn(
                            sortString: (productIssueDetail) =>
                                productIssueDetail.unit.id,
                            title: 'Unit',
                            builder: (productIssueDetail, _) {
                              return Text(productIssueDetail.unit.id);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
