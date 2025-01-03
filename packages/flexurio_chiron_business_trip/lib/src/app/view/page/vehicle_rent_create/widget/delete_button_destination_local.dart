import 'package:flexurio_chiron_business_trip/src/app/bloc/vehicle_rent/vehicle_rent_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DestinationFromLocalDeleteButton extends StatelessWidget {
  const DestinationFromLocalDeleteButton({
    required this.destination,
    super.key,
  });

  final LatLng destination;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.vehicleRentDelete,
      action: DataAction.delete,
      onPressed: () => _showConfirmationDialog(context),
    );
  }

  Future<bool?> _showConfirmationDialog(BuildContext context) {
    final bloc = context.read<VehicleRentBloc>();
    final event = VehicleRentEvent.remove(destination);
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return CardConfirmation(
          isProgress: false,
          action: action,
          data: Entity.vehicleRentDestination,
          label: '${destination.latitude}, ${destination.longitude}',
          onConfirm: () {
            bloc.add(event);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
