import 'package:flexurio_chiron_business_trip/src/app/view/page/vehicle/widget/vehicle_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VehiclePage extends StatelessWidget {
  const VehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(
          entity: Entity.vehicle,
        ),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: VehicleDataTable.prepare(),
        ),
      ],
    );
  }
}
