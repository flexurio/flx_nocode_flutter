import 'package:flexurio_chiron_business_trip/src/app/bloc/vehicle_rent_query/vehicle_rent_query_bloc.dart';
import 'package:flexurio_chiron_business_trip/src/app/view/page/vehicle_rent_calendar_view/widget/calendar.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class VehicleRentCalendarViewPage extends StatelessWidget {
  const VehicleRentCalendarViewPage._();

  static Route<bool?> route() {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => VehicleRentQueryBloc()
              ..add(
                const VehicleRentQueryEvent.fetch(),
              ),
          ),
        ],
        child: const VehicleRentCalendarViewPage._(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FCard(
            child: Column(
              children: [
                const ActionButtons(),
                Expanded(
                  child: Calendar.prepare(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(paddingHorizontalPage),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: BackButton(),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
