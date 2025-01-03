import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return/product_return_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_detail.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_create/widget/remove_button_product_local.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnDetailTable extends StatefulWidget {
  const ProductReturnDetailTable({required this.isView, super.key});

  final bool isView;

  @override
  State<ProductReturnDetailTable> createState() =>
      _ProductReturnDetailTableState();
}

class _ProductReturnDetailTableState extends State<ProductReturnDetailTable> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late List<ProductReturnDetail> dataProduct = [];
    return BlocBuilder<ProductReturnBloc, ProductReturnState>(
      builder: (context, state) {
        dataProduct = state.maybeWhen(
          orElse: () => [],
          initial: (products, _) {
            return products;
          },
        );
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: YuhuTable<ProductReturnDetail>(
            freezeLastColumn: !widget.isView,
            width: 1300,
            key: ValueKey(state.hashCode),
            data: dataProduct,
            status: state.maybeWhen(
              orElse: () => Status.error,
              initial: (productReturnDetail, _) => Status.loaded,
            ),
            columns: [
              TableColumn(
                title: 'delivery_order'.tr(),
                sortString: (detail) => detail.deliveryOrderId,
                alignment: Alignment.centerRight,
                builder: (detail, _) {
                  return Text(detail.deliveryOrderId);
                },
              ),
              TableColumn(
                title: 'product_name'.tr(),
                sortString: (detail) => detail.product.name,
                alignment: Alignment.centerRight,
                builder: (detail, _) {
                  return Text(detail.product.name);
                },
              ),
              TableColumn(
                title: 'batch_no'.tr(),
                sortString: (detail) => detail.batchNo.id,
                alignment: Alignment.centerRight,
                builder: (detail, _) {
                  return Text(detail.batchNo.id);
                },
              ),
              TableColumn(
                title: 'expired_date'.tr(),
                sortNum: (detail) =>
                    detail.expirationDate.millisecondsSinceEpoch,
                alignment: Alignment.centerRight,
                builder: (detail, _) {
                  return Text(detail.expirationDate.yMMMMd);
                },
              ),
              TableColumn(
                width: 100,
                title: 'quantity'.tr(),
                sortNum: (detail) => detail.quantity,
                alignment: Alignment.centerRight,
                builder: (detail, _) {
                  return Text(detail.quantity.toString());
                },
              ),
              TableColumn(
                title: 'unit'.tr(),
                sortString: (detail) => detail.unit.id,
                alignment: Alignment.centerRight,
                builder: (detail, _) {
                  return Text(detail.unit.id);
                },
              ),
              if (widget.isView)
                TableColumn(
                  title: 'Price',
                  builder: (detail, _) {
                    return Text(detail.productPrice.format());
                  },
                ),
              if (widget.isView)
                TableColumn(
                  title: 'Total',
                  builder: (detail, _) {
                    return Text(detail.totalProductPrice.format());
                  },
                ),
              if (!widget.isView)
                TableColumn(
                  width: 100,
                  title: 'action'.tr(),
                  builder: (detail, _) => Row(
                    children: [
                      ProductLocalRemoveButton(
                        product: detail,
                        onPressed: (product) {
                          context.read<ProductReturnBloc>().add(
                              ProductReturnEvent.remove(products: product));
                        },
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
