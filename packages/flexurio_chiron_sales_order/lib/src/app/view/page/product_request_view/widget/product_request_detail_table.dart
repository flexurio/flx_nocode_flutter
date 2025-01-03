import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request/product_request_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request_detail.dart';
import 'package:flexurio_chiron_sales_order/src/app/view/page/product_request/widget/delete_button_detail_product_request.dart';
import 'package:flexurio_chiron_sales_order/src/app/view/page/product_request/widget/edit_button_product.dart';
import 'package:flexurio_chiron_sales_order/src/app/view/page/product_request_create/widget/colum_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductRequestDetailTable extends StatelessWidget {
  const ProductRequestDetailTable({
    super.key,
    required this.data,
    required this.bloc,
    this.productRequestFormPurchaseOrder,
  });

  final List<ProductRequestDetail> data;
  final ProductRequestBloc bloc;
  final ProductRequestFormPurchaseOrder? productRequestFormPurchaseOrder;

  @override
  Widget build(BuildContext context) {
    return SimpleTable<ProductRequestDetail>(
      width: 1700,
      columns: [
        TableColumnX(
          width: 300,
          title: 'product'.tr(),
          builder: (productRequestDetail, _) {
            final isProduct = productRequestDetail.product!.name != '';
            return Text(
              isProduct ? productRequestDetail.product!.name : '',
            );
          },
        ),
        TableColumnX(
          title: 'quantity_remaining'.tr(),
          width: 200,
          builder: (productRequestDetail, _) {
            final isQtyRemaining = productRequestDetail.quantityRemaining != 0;
            return Text(
              isQtyRemaining
                  ? productRequestDetail.quantityRemaining.toString()
                  : 0.toString(),
            );
          },
        ),
        TableColumnX(
          title: 'quantity_purchase_order'.tr(),
          width: 200,
          builder: (productRequestDetail, _) {
            final isQtyPurchaseOrder = productRequestDetail.quantity != 0;
            return Text(
              isQtyPurchaseOrder
                  ? productRequestDetail.quantity.toString()
                  : 0.toString(),
            );
          },
        ),
        TableColumnX(
          title: 'quantity_stock'.tr(),
          width: 150,
          builder: (productRequestDetail, _) {
            return ProductRequestColumProductStock.prepare(
              product: productRequestDetail.product,
              endingBalance: 1,
              warehouse: [
                Warehouse.finishedProduct,
                Warehouse.alkes,
              ],
            );
          },
        ),
        TableColumnX(
          title: 'unit'.tr(),
          width: 80,
          builder: (productRequestDetail, _) {
            return Text(productRequestDetail.unit);
          },
        ),
        TableColumnX(
          title: 'price'.tr(),
          width: 200,
          alignment: Alignment.centerRight,
          builder: (productRequestDetail, _) {
            return Text(productRequestDetail.price!.idr);
          },
        ),
        TableColumnX(
          title: 'price_discount'.tr(),
          width: 150,
          alignment: Alignment.centerRight,
          builder: (productRequestDetail, _) {
            return Text('${productRequestDetail.discountPercent!} %');
          },
        ),
        TableColumnX(
          title: 'subtotal'.tr(),
          width: 200,
          alignment: Alignment.centerRight,
          builder: (productRequestDetail, index) {
            return Text(productRequestDetail.subtotal!.idr);
          },
        ),
        if (productRequestFormPurchaseOrder != null)
          if (ProductRequestStatus.input ==
              productRequestFormPurchaseOrder!.status)
            TableColumnX(
              width: 130,
              alignment: Alignment.centerRight,
              title: 'actions'.tr(),
              builder: (productRequestDetail, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ProductRequestDetailEditButton.prepare(
                      productRequest: productRequestFormPurchaseOrder!,
                      productRequestDetail: productRequestDetail,
                      bloc: bloc,
                    ),
                    if (productRequestDetail.quantity ==
                        productRequestDetail.quantityRemaining)
                      ProductRequestDetailDeleteButton.prepare(
                        productRequestDetail: productRequestDetail,
                        productRequest: productRequestFormPurchaseOrder!,
                        bloc: bloc,
                      ),
                  ],
                );
              },
            ),
      ],
      data: data,
    );
  }
}
