import 'package:flexurio_chiron_business_trip/src/app/bloc/vehicle_query/vehicle_query_bloc.dart';
import 'package:flexurio_chiron_business_trip/src/app/view/page/vehicle_create/vehicle_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleCreateButton extends StatelessWidget {
  const VehicleCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      permission: Permission.vehicleCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<VehicleQueryBloc>();
        final success = await Navigator.push(
          context,
          VehicleCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const VehicleQueryEvent.fetch());
        }
      },
    );
  }
}
