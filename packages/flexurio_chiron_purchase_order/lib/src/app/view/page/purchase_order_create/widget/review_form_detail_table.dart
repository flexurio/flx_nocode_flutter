import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ReviewFormDetailTable extends StatelessWidget {
  const ReviewFormDetailTable({
    required this.purchaseOrderDetails,
    this.purchaseOrder,
    this.suffixPrice,
    this.hideAmount = false,
    this.isPettyCash = false,
    super.key,
  });

  final List<PurchaseOrderDetail> purchaseOrderDetails;
  final PurchaseOrder? purchaseOrder;
  final bool hideAmount;
  final String? suffixPrice;
  final bool? isPettyCash;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YuhuTable<PurchaseOrderDetail>(
          width: 900,
          columns: [
            TableColumn(
              width: 250,
              title: 'name'.tr(),
              builder: (purchaseOrderMaterial, _) {
                return Text(
                  isPettyCash == true
                      ? purchaseOrderMaterial.material == null
                          ? purchaseOrderMaterial.descriptionPettyCash == ''
                              ? '-'
                              : purchaseOrderMaterial.descriptionPettyCash ??
                                  '-'
                          : purchaseOrderMaterial.material!.id == ''
                              ? purchaseOrderMaterial.descriptionPettyCash == ''
                                  ? '-'
                                  : purchaseOrderMaterial
                                          .descriptionPettyCash ??
                                      '-'
                              : purchaseOrderMaterial.material?.name ?? '-'
                      : purchaseOrderMaterial.isProduct
                          ? purchaseOrderMaterial.product!.name
                          : purchaseOrderMaterial.material!.name,
                );
              },
            ),
            TableColumn(
              width: 100,
              title: 'Design',
              builder: (purchaseOrderMaterial, _) {
                return Text(
                  purchaseOrderMaterial.materialDesign?.designCode ?? '-',
                );
              },
            ),
            TableColumn(
              title: 'quantity'.tr(),
              width: 100,
              alignment: Alignment.centerRight,
              builder: (purchaseOrderMaterial, _) {
                return Text('${purchaseOrderMaterial.quantity}');
              },
            ),
            TableColumn(
              title: 'Unit',
              width: 80,
              builder: (purchaseOrderMaterial, _) {
                return Text(
                  purchaseOrderMaterial.unit.id,
                );
              },
            ),
            if (!hideAmount)
              TableColumn(
                width: 160,
                title: 'Unit Price ${suffixPrice ?? ''}',
                alignment: Alignment.centerRight,
                builder: (purchaseOrderMaterial, _) {
                  return Text(purchaseOrderMaterial.price.format());
                },
              ),
            if (!hideAmount)
              TableColumn(
                width: 160,
                title: 'Sub Total ${suffixPrice ?? ''}',
                alignment: Alignment.centerRight,
                builder: (purchaseOrderMaterial, _) {
                  return Text(purchaseOrderMaterial.subtotal.format());
                },
              ),
          ],
          data: purchaseOrderDetails,
        ),
      ],
    );
  }
}
