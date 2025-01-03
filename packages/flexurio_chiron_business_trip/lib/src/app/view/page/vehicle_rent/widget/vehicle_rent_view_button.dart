import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleRentViewButton extends StatelessWidget {
  const VehicleRentViewButton({
    required this.vehicleRent,
    required this.bloc,
    required this.statusSelected,
    super.key,
  });

  final VehicleRent vehicleRent;
  final VehicleRentQueryBloc bloc;
  final VehicleRentStatus statusSelected;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.vehicleRentViewMenu,
      action: DataAction.view,
      onPressed: () {
        Navigator.push(
          context,
          VehicleRentViewPage.route(
            vehicleRent: vehicleRent,
          ),
        ).then((value) {
          if (value ?? false) {
            context
                .read<VehicleRentQueryBloc>()
                .add(VehicleRentQueryEvent.fetch(status: statusSelected.label));
          }
        });
      },
    );
  }
}
