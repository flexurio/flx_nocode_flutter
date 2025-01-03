import 'package:flexurio_chiron_business_trip/src/app/model/fuel.dart';
import 'package:flexurio_chiron_business_trip/src/app/view/page/fuel/widget/fuel_history_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class FuelHistoryButton extends StatelessWidget {
  const FuelHistoryButton({
    required this.fuel,
    super.key,
  });

  final Fuel fuel;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: null,
      action: DataAction.view,
      onPressed: () async {
        await showDialog<void>(
          context: context,
          builder: (context) {
            return FuelHistoryTable.prepare(
              fuel: fuel,
            );
          },
        );
      },
    );
  }
}
