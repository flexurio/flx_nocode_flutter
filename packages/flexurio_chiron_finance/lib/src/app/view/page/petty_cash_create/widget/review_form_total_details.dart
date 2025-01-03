import 'package:flexurio_chiron_finance/src/app/model/petty_cash.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:easy_localization/easy_localization.dart';

class ConfirmFormTotalDetails extends StatelessWidget {
  const ConfirmFormTotalDetails({
    required this.totalAmount,
    required this.pettyCash,
    super.key,
  });

  final double totalAmount;
  final PettyCash? pettyCash;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (pettyCash != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TileDataHorizontal(
                label: 'total'.tr(),
                child: Text(totalAmount.format()),
              ),
              TileDataHorizontal(
                label: 'discount'.tr(),
                child: Text(
                  pettyCash!.discountAmount.toNegative().formatWithSymbol(),
                ),
              ),
              TileDataHorizontal(
                label: 'PPN',
                child: Text(pettyCash!.ppnAmount.formatWithSymbol()),
              ),
              TileDataHorizontal(
                label: 'PPH',
                child:
                    Text(pettyCash!.pphAmount.toNegative().formatWithSymbol()),
              ),
              // add shipping cost
              TileDataHorizontal(
                label: 'shipping_cost'.tr(),
                child: Text(pettyCash!.shippingCost.formatWithSymbol()),
              ),
              TileDataHorizontal(
                label: 'rounding'.tr(),
                child: Text(pettyCash!.rounding.formatWithSymbol()),
              ),
              const Gap(6),
              const Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 300,
                  child: Divider(height: 12),
                ),
              ),
            ],
          ),
        TileDataHorizontal(
          label: 'grand_total'.tr(),
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          child: Text(
            (totalAmount -
                    (pettyCash?.discountAmount ?? 0) +
                    (pettyCash?.ppnAmount ?? 0) -
                    (pettyCash?.pphAmount ?? 0) +
                    (pettyCash?.shippingCost ?? 0) +
                    (pettyCash?.rounding ?? 0))
                .format(),
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ],
    );
  }
}
