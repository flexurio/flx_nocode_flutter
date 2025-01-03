import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class PopUpTask extends StatelessWidget {
  const PopUpTask({required this.vehicleRent, super.key});
  final VehicleRent vehicleRent;

  @override
  Widget build(BuildContext context) {
    return CardForm(
      title: 'Header',
      icon: Icons.task_outlined,
      actions: [
        Button(
          permission: null,
          action: DataAction.close,
          onPressed: () => Navigator.pop(context),
        ),
      ],
      popup: true,
      child: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TileDataHorizontal(
                label: 'User',
                child: GetNameUser(userId: vehicleRent.userId),
              ),
              const Gap(10),
              TileDataHorizontal(
                label: 'Dept',
                child: Text(vehicleRent.department.name),
              ),
              const Gap(10),
              TileDataHorizontal(
                label: 'Vehicle',
                child: Text(vehicleRent.vehicle == null
                    ? '-'
                    : vehicleRent.vehicle!.vehicleRegistrationNumber),
              ),
              const Gap(10),
              TileDataHorizontal(
                label: 'Driver',
                child: GetNameUser(userId: vehicleRent.driverId ?? 0),
              ),
              const Gap(10),
              TileDataHorizontal(
                label: 'scheduled start date',
                child: Text(
                  DateFormat('y-MM-dd').format(vehicleRent.scheduledStartDate),
                ),
              ),
              const Gap(10),
              TileDataHorizontal(
                label: 'scheduled end date',
                child: Text(
                  DateFormat('y-MM-dd').format(vehicleRent.scheduledEndDate),
                ),
              ),
              const Gap(10),
              const TileDataHorizontal(
                label: 'Destination',
                child: Text("isn't any"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
