import 'package:flexurio_chiron_business_trip/src/app/bloc/vehicle_rent/vehicle_rent_bloc.dart';
import 'package:flexurio_chiron_business_trip/src/app/view/page/vehicle_rent_create/widget/add_destination.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VehicleRentAddDestinationButton extends StatelessWidget {
  const VehicleRentAddDestinationButton({
    required this.vehicleRentBloc,
    super.key,
  });

  final VehicleRentBloc vehicleRentBloc;

  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: null,
      action: DataAction.add,
      entity: Entity.vehicleRentDestination,
      onPressed: () async {
        await showDialog<LatLng?>(
          context: context,
          builder: (context) {
            return AddDestinationPage.prepare();
          },
        ).then((value) {
          if (value != null) {
            vehicleRentBloc.add(
              VehicleRentEvent.addDestinationToLocal(
                destination: value,
              ),
            );
          }
        });
      },
    );
  }
}
