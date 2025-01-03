import 'package:flexurio_chiron_business_trip/src/app/bloc/vehicle_query/vehicle_query_bloc.dart';
import 'package:flexurio_chiron_business_trip/src/app/model/vehicle.dart';
import 'package:flexurio_chiron_business_trip/src/app/view/page/vehicle_create/vehicle_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleUpdateButton extends StatelessWidget {
  const VehicleUpdateButton({required this.vehicle, super.key});

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.vehicleEdit,
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = context.read<VehicleQueryBloc>();
        final success = await Navigator.push(
          context,
          VehicleCreatePage.route(vehicle: vehicle),
        );
        if (success ?? false) {
          queryBloc.add(const VehicleQueryEvent.fetch());
        }
      },
    );
  }
}
