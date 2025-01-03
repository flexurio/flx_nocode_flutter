import 'package:flexurio_chiron_accounting/src/app/model/payment_other_cost.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ReviewFormOtherCostsTable extends StatelessWidget {
  const ReviewFormOtherCostsTable({
    required this.otherCosts,
    super.key,
  });

  final List<PaymentOtherCost> otherCosts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YuhuTable<PaymentOtherCost>(
          columns: [
            TableColumn(
              title: 'name'.tr(),
              builder: (otherCost, _) {
                return Text(otherCost.typeCost.name);
              },
            ),
            TableColumn(
              title: 'amount'.tr(),
              alignment: Alignment.centerRight,
              builder: (otherCost, _) {
                return Text(otherCost.amount.format());
              },
            ),
          ],
          data: otherCosts,
        ),
      ],
    );
  }
}
