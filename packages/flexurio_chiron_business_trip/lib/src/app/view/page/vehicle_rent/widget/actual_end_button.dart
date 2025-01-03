import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VehicleRentActualEndButton extends StatelessWidget {
  const VehicleRentActualEndButton({
    required this.vehicleRent,
    super.key,
  });

  final VehicleRent vehicleRent;

  @override
  Widget build(BuildContext context) {
    late List<LatLng>? destinations = [];
    if (vehicleRent.point != '') {
      destinations = List<LatLng>.from(
        vehicleRent.point!
            .replaceAll('[(', '')
            .replaceAll(')]', '')
            .replaceAll(',(', '')
            .split(')')
            .map(
              (e) => LatLng(
                double.parse(e.split(',')[0]),
                double.parse(e.split(',')[1]),
              ),
            )
            .toList(),
      );
    }
    return IconButtonSmall(
      permission: Permission.vehicleRentActualEndDate,
      action: DataAction.updateActualEnd,
      onPressed: () async {
        final queryBloc = context.read<VehicleRentQueryBloc>();
        final success = await Navigator.push(
          context,
          VehicleRentActualStartUpdateFormPage.route(
            vehicleRent: vehicleRent,
            destinations: destinations!,
            type: 'end',
          ),
        );
        if (success ?? false) {
          queryBloc.add(VehicleRentQueryEvent.fetch(
              status: VehicleRentStatus.approveCs.label));
        }
      },
    );
  }
}
