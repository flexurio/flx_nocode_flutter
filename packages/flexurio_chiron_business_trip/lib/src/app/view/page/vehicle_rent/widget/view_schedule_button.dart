import 'package:flexurio_chiron_business_trip/src/app/bloc/vehicle_rent_query/vehicle_rent_query_bloc.dart';
import 'package:flexurio_chiron_business_trip/src/app/view/page/vehicle_rent_calendar_view/vehicle_rent_calendar_view_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleRentCalendarViewButton extends StatelessWidget {
  const VehicleRentCalendarViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      permission: Permission.vehicleRentViewMenu,
      action: DataAction.viewCalendar,
      onPressed: () async {
        final queryBloc = context.read<VehicleRentQueryBloc>();
        final success = await Navigator.push(
          context,
          VehicleRentCalendarViewPage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const VehicleRentQueryEvent.fetch());
        }
      },
    );
  }
}
