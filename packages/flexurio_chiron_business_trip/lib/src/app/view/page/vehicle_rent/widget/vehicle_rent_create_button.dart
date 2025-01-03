import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleRentCreateButton extends StatelessWidget {
  const VehicleRentCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      permission: Permission.vehicleRentCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<VehicleRentQueryBloc>();
        final success = await Navigator.push(
          context,
          VehicleRentCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(VehicleRentQueryEvent.fetch(
              status: VehicleRentStatus.input.label));
        }
      },
    );
  }
}
