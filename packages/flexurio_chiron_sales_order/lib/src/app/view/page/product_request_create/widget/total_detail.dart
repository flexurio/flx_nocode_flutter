import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductRequestTotalDetails extends StatelessWidget {
  const ProductRequestTotalDetails({
    required this.products,
    required this.productRequestHeader,
    required this.isLocal,
    super.key,
  });

  final List<ProductRequestDetail> products;
  final ProductRequestFormPurchaseOrder productRequestHeader;
  final bool isLocal;

  @override
  Widget build(BuildContext context) {
    final totalAmountReal = products.fold<double>(
      0,
      (total, product) => total + product.subtotal!,
    );

    late double specialDiscount;
    late double ppnDiscount;
    late double pph22Discount;
    late double totalAfterSpecialDiscount;
    late double ppnValue;
    late double pph22Value;
    late double totalAmount;

    if (isLocal) {
      specialDiscount = productRequestHeader.specialDiscountPercent ?? 0.0;
      ppnDiscount = productRequestHeader.ppnPercent ?? 0.0;
      pph22Discount = productRequestHeader.pph22Percent ?? 0.0;
      var specialDiscountLocal =
          productRequestHeader.specialDiscountPercent != null
              ? productRequestHeader.specialDiscountPercent! / 100
              : 0.0;
      var ppnDiscountLocal = productRequestHeader.ppnPercent != null
          ? productRequestHeader.ppnPercent! / 100
          : 0.0;
      var pph22DiscountLocal = productRequestHeader.pph22Percent != null
          ? productRequestHeader.pph22Percent! / 100
          : 0.0;
      totalAfterSpecialDiscount = totalAmountReal * specialDiscountLocal;
      ppnValue =
          (totalAmountReal - totalAfterSpecialDiscount) * ppnDiscountLocal;
      pph22Value =
          (totalAmountReal - totalAfterSpecialDiscount) * pph22DiscountLocal;
      totalAmount =
          (totalAmountReal - totalAfterSpecialDiscount + ppnValue + pph22Value);
    } else {
      specialDiscount = productRequestHeader.specialDiscountPercent ?? 0.0;
      ppnDiscount = productRequestHeader.ppnPercent ?? 0.0;
      pph22Discount = productRequestHeader.pph22Percent ?? 0.0;
      totalAfterSpecialDiscount =
          productRequestHeader.priceDiscountPercent ?? 0.0;
      ppnValue = productRequestHeader.ppnValue ?? 0.0;
      pph22Value = productRequestHeader.pph22Value ?? 0.0;
      totalAmount = productRequestHeader.total ?? 0.0;
    }

    double rounded({double? value}) {
      return (value ?? 0 + 0.5).floorToDouble();
    }

    double roundedFloor({double? value}) {
      return (value ?? 0).floorToDouble();
    }

    return Column(
      children: [
        TileDataHorizontal(
          label: 'Total',
          child: Text(rounded(value: totalAmountReal).format()),
        ),
        TileDataHorizontal(
          label: 'Discount '
              '($specialDiscount %)',
          child: Text(
            '- ${rounded(value: totalAfterSpecialDiscount).format()}',
          ),
        ),
        TileDataHorizontal(
          label: 'PPN '
              '($ppnDiscount %)',
          child: Text(
            '+ ${rounded(value: ppnValue).format()}',
          ),
        ),
        TileDataHorizontal(
          label: 'PPH '
              '($pph22Discount %)',
          child: Text(
            '+ ${roundedFloor(value: pph22Value).format()}',
          ),
        ),
        const Gap(6),
        const Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 300,
            child: Divider(height: 12),
          ),
        ),
        TileDataHorizontal(
          label: 'Grand Total',
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          child: Text(
            rounded(value: totalAmount).format(),
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ],
    );
  }
}
