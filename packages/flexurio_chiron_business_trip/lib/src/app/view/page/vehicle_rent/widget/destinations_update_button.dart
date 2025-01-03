import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VehicleRentDestinationUpdateButton extends StatelessWidget {
  const VehicleRentDestinationUpdateButton({
    required this.header,
    required this.bloc,
    required this.destination,
    required this.onSuccess,
    super.key,
  });

  final VehicleRentFormHeader header;
  final List<LatLng> destination;
  final VehicleRentBloc bloc;
  final void Function() onSuccess;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.vehicleRentEdit,
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = bloc;
        final success = await Navigator.push(
          context,
          VehicleRentDestinationUpdateFormPage.route(
            header: header,
            destinations: destination,
          ),
        );
        if (success ?? false) {
          onSuccess();
        }
      },
    );
  }
}
