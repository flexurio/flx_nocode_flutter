import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive/product_receive_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive_detail_query/product_receive_detail_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive_detail.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive/widget/edit_button.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive_detail/edit_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReceiveDetailPage extends StatelessWidget {
  const ProductReceiveDetailPage({
    required this.productReceiveDetail,
    super.key,
    required this.isExternal,
  });
  final bool isExternal;

  static Widget prepare({
    required ProductReceiveDetail productReceiveDetail,
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProductReceiveDetailQueryBloc(isExternal: isExternal)
                ..add(
                  ProductReceiveDetailQueryEvent.fetch(
                    productReceive: productReceiveDetail.productReceive,
                  ),
                ),
        ),
        BlocProvider(
          create: (context) => ProductReceiveBloc(isExternal: isExternal)
            ..add(
              ProductReceiveEvent.initialize(
                productReceiveDetail.productReceive,
              ),
            ),
        ),
      ],
      child: ProductReceiveDetailPage(
        productReceiveDetail: productReceiveDetail,
        isExternal: isExternal,
      ),
    );
  }

  final ProductReceiveDetail productReceiveDetail;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.view;
    final entity = Entity.productReceive;
    final queryBloc = context.read<ProductReceiveDetailQueryBloc>();
    return BlocBuilder<ProductReceiveDetailQueryBloc,
        ProductReceiveDetailQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const Center(child: CupertinoActivityIndicator()),
          loaded: (materialReceive) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleFormPanel(
                action: action,
                entity: entity,
                size: SingleFormPanelSize.large,
                children: [
                  if (productReceiveDetail.status !=
                      ProductReceiveDetailStatus.release)
                    Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(bottom: 24)),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ProductReceiveEditButton(
                            productReceiveDetail: productReceiveDetail,
                            queryBloc: queryBloc,
                            isExternal: isExternal,
                          ),
                        ),
                      ],
                    ),
                  RowFields(
                    children: [
                      TileDataVertical(
                        label: 'Product Receive ID',
                        child: Text(
                          materialReceive.data.first.productReceive.id,
                        ),
                      ),
                      TileDataVertical(
                        label: 'Status',
                        child: ChipType(
                          materialReceive.data.first.productReceive.status,
                        ),
                      ),
                      TileDataVertical(
                        label: 'type'.tr(),
                        child: ChipType(
                          materialReceive.data.first.productReceive.type,
                        ),
                      ),
                    ],
                  ),
                  RowFields(
                    children: [
                      TileDataVertical(
                        label: 'supplier'.tr(),
                        child: Text(
                          '${materialReceive.data.first.productReceive.supplier.id} - ${materialReceive.data.first.productReceive.supplier.name}',
                        ),
                      ),
                      TileDataVertical(
                        label: 'transaction_date'.tr(),
                        child: Text(materialReceive
                            .data.first.productReceive.createdAt.yMMMMd),
                      ),
                      TileDataVertical(
                        label: 'Purchase Order ID',
                        child: Text(materialReceive
                            .data.first.productReceive.purchaseOrder.id),
                      ),
                    ],
                  ),
                  RowFields(
                    children: [
                      TileDataVertical(
                        label: 'delivery_order_id'.tr(),
                        child: Text(
                          materialReceive
                                  .data.first.productReceive.deliveryOrderId ??
                              '-',
                        ),
                      ),
                      TileDataVertical(
                        label: 'delivery_order_date'.tr(),
                        child: Text(
                          materialReceive.data.first.productReceive
                                      .deliveryOrderDate ==
                                  null
                              ? '-'
                              : materialReceive.data.first.productReceive
                                  .deliveryOrderDate!.yMMMMd,
                        ),
                      ),
                      TileDataVertical(
                        label: 'description'.tr(),
                        child: Text(
                          materialReceive.data.first.productReceive.description,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildTableDetail(context, state),
                ],
              ),
            );
          },
        );
      },
    );
  }

  YuhuTable<ProductReceiveDetail> _buildTableDetail(
      BuildContext context, ProductReceiveDetailQueryState state) {
    return YuhuTable<ProductReceiveDetail>(
      width: 1000,
      freezeFirstColumn: true,
      freezeLastColumn: true,
      columns: [
        TableColumn(
          width: 95,
          title: 'Product ID',
          builder: (productRequestDetail, _) {
            return Text(productRequestDetail.product.id);
          },
        ),
        TableColumn(
          width: 150,
          title: 'product_name'.tr(),
          builder: (productRequestDetail, _) {
            return Text(productRequestDetail.product.name);
          },
        ),
        TableColumn(
          width: 150,
          title: 'batch_no'.tr(),
          builder: (productRequestDetail, _) {
            return Text(productReceiveDetail.productionOrder.id);
          },
        ),
        TableColumn(
          width: 150,
          title: 'expired_date'.tr(),
          builder: (productRequestDetail, _) {
            return Text(productRequestDetail.expiredDate.yMMMMd);
          },
        ),
        TableColumn(
          title: 'quantity'.tr(),
          width: 85,
          alignment: Alignment.centerRight,
          builder: (productRequestDetail, _) {
            return Text('${productRequestDetail.quantity}');
          },
        ),
        TableColumn(
          title: 'Unit',
          width: 100,
          builder: (productRequestDetail, _) {
            return Text(productRequestDetail.unit.id);
          },
        ),
        TableColumn(
          width: 140,
          title: 'Status',
          builder: (productRequestDetail, _) {
            return ChipType(productRequestDetail.status);
          },
        ),
        TableColumn(
          width: 200,
          title: 'warehouse'.tr(),
          builder: (productRequestDetail, index) {
            return ChipType(
              productRequestDetail.warehouse,
            );
          },
        ),
        if (productReceiveDetail.status != ProductReceiveDetailStatus.release)
          TableColumn(
            width: 90,
            title: 'actions'.tr(),
            builder: (productRequestDetail, index) {
              return ProductReceiveDetailEditButton(
                queryBloc: context.read<ProductReceiveDetailQueryBloc>(),
                productReceiveDetail: productRequestDetail,
                isExternal: isExternal,
              );
            },
          ),
      ],
      data: state.maybeWhen(
        loaded: (pageOptions) {
          return pageOptions.data;
        },
        orElse: () => [],
      ),
    );
  }
}
