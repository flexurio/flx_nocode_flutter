import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ReviewFormTotalDetails extends StatelessWidget {
  const ReviewFormTotalDetails({
    required this.purchaseOrderDetails,
    required this.purchaseOrderFormDiscount,
    this.purchaseOrder,
    super.key,
  });

  final PurchaseOrder? purchaseOrder;
  final List<PurchaseOrderDetail> purchaseOrderDetails;
  final PurchaseOrderFormDiscount purchaseOrderFormDiscount;

  @override
  Widget build(BuildContext context) {
    final total = purchaseOrderDetails.fold<double>(
      0,
      (total, purchaseOrderDetails) => total + purchaseOrderDetails.subtotal,
    );
    final serviceIsExist = purchaseOrderDetails.indexWhere(
          (purchaseOrderDetail) {
            return purchaseOrderDetail.material?.materialGroup.id == 'JASA';
          },
        ) >
        -1;

    final customsTotal = purchaseOrderDetails
        .where(
          (purchaseOrderDetail) => purchaseOrderDetail.material?.id == 'CUKAI',
        )
        .fold<double>(
          0,
          (total, purchaseOrderDetail) => total + purchaseOrderDetail.subtotal,
        );

    var totalAfterTax = total;
    final isCustoms = serviceIsExist && (customsTotal == 0);
    if (isCustoms) {
      final customAmount = purchaseOrderDetails.fold<double>(
        0,
        (total, purchaseOrderDetail) {
          if (purchaseOrderDetail.material?.materialGroup.id == 'JASA') {
            return total + purchaseOrderDetail.subtotal;
          } else {
            return 0;
          }
        },
      );
      totalAfterTax = customAmount;
    }

    totalAfterTax = totalAfterTax - customsTotal;
    final discountAmount =
        total * purchaseOrderFormDiscount.discountPercent / 100;
    final ppnAmount =
        (total - discountAmount) * purchaseOrderFormDiscount.ppn.id / 100;
    var pphAmount =
        totalAfterTax * purchaseOrderFormDiscount.taxType.pph22Percent / 100;
    final taxAmount =
        totalAfterTax * purchaseOrderFormDiscount.taxType.taxPercent / 100;
    if (taxAmount > 0) {
      pphAmount = taxAmount.toNegative().toDouble();
    }
    final grandTotal = total - discountAmount + pphAmount + ppnAmount;
    final downPayment =
        grandTotal * purchaseOrderFormDiscount.downPaymentPercent / 100;

    return Column(
      children: [
        TileDataHorizontal(
          label: 'Total',
          child: Text((purchaseOrder?.subtotal ?? total).formatWithSymbol()),
        ),
        TileDataHorizontal(
          label: 'Discount '
              '(${purchaseOrderFormDiscount.discountPercent}%)',
          child: Text(
            (purchaseOrder?.discountValue ?? discountAmount)
                .toNegative()
                .formatWithSymbol(),
          ),
        ),
        TileDataHorizontal(
          label: 'PPN (${purchaseOrderFormDiscount.ppn.id}%)',
          child: Text(
            (purchaseOrder?.ppnValue ?? ppnAmount).formatWithSymbol(),
          ),
        ),
        if (purchaseOrder?.taxType == TaxType.tax22Sale)
          TileDataHorizontal(
            label: 'PPH ${purchaseOrderFormDiscount.taxType.type} '
                '(${purchaseOrder?.taxType == TaxType.tax22Sale ? purchaseOrderFormDiscount.taxType.pph22Percent : purchaseOrderFormDiscount.taxType.taxPercent}%)',
            child: Text(
              (purchaseOrder?.pph22Value ?? pphAmount).formatWithSymbol(),
            ),
          )
        else
          TileDataHorizontal(
            label: 'PPH ${purchaseOrderFormDiscount.taxType.type} '
                '(${purchaseOrderFormDiscount.taxType.taxPercent}%)',
            child: Text(
              (purchaseOrder != null
                      ? (purchaseOrderFormDiscount.taxType.taxPercent == 22
                          ? purchaseOrder!.taxValue
                          : purchaseOrder!.taxValue.toNegative())
                      : pphAmount)
                  .formatWithSymbol(),
            ),
          ),
        _buildDataDownPayment(context, downPayment),
        const Gap(6),
        const Align(
          alignment: Alignment.centerRight,
          child: SizedBox(width: 350, child: Divider(height: 12)),
        ),
        TileDataHorizontal(
          label: 'Grand Total',
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          child: Text(
            (purchaseOrder?.total ?? grandTotal).format(),
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ],
    );
  }

  Widget _buildDataDownPayment(BuildContext context, double downPayment) {
    return TileDataHorizontal(
      label: 'D.P. '
          '(${purchaseOrderFormDiscount.downPaymentPercent}%)',
      child: Text(
        (purchaseOrder?.dpValue ?? downPayment).formatWithSymbol(),
      ),
    );
  }
}
