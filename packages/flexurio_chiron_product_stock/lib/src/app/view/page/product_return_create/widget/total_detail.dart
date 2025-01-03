import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TotalDetails extends StatelessWidget {
  const TotalDetails({
    required this.products,
    required this.customerForm,
    super.key,
  });

  final List<ProductReturnDetail> products;
  final ProductReturnCustomerForm customerForm;

  @override
  Widget build(BuildContext context) {
    final totalAmountReal = products.fold<double>(
      0,
      (total, product) => total + product.totalProductPrice,
    );

    late double discount;
    late double ppnDiscount;
    late double totalAfterDiscount;

    discount = customerForm.discountPercent ?? 0.0;
    var totalPriceDiscount = discount / 100 * totalAmountReal;

    ppnDiscount = customerForm.ppnPercent?.id ?? 0.0;
    var totalAmountAfterDiscount = totalAmountReal - totalPriceDiscount;
    var totalPricePpn = totalAmountAfterDiscount * ppnDiscount / 100;

    totalAfterDiscount = totalAmountReal - totalPriceDiscount + totalPricePpn;

    return Column(
      children: [
        TileDataHorizontal(
          label: 'total'.tr(),
          child: Text(totalAmountReal.format()),
        ),
        TileDataHorizontal(
          label: 'Discount '
              '($discount %)',
          child: Text(
            '- ${totalPriceDiscount.format()}',
          ),
        ),
        TileDataHorizontal(
          label: 'PPN '
              '($ppnDiscount %)',
          child: Text(
            '+ ${totalPricePpn.format()}',
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
          label: 'grand_total'.tr(),
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          child: Text(
            totalAfterDiscount.format(),
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ],
    );
  }
}
