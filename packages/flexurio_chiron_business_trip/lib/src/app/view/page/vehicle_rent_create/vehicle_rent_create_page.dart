import 'package:flexurio_chiron_business_trip/src/app/bloc/vehicle_rent/vehicle_rent_bloc.dart';
import 'package:flexurio_chiron_business_trip/src/app/view/page/vehicle_rent_create/widget/form_confirm.dart';
import 'package:flexurio_chiron_business_trip/src/app/view/page/vehicle_rent_create/widget/form_destination.dart';
import 'package:flexurio_chiron_business_trip/src/app/view/page/vehicle_rent_create/widget/form_header.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class VehicleRentCreatePage extends StatefulWidget {
  const VehicleRentCreatePage._();

  static Route<bool?> route() {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => VehicleRentBloc()),
        ],
        child: const VehicleRentCreatePage._(),
      ),
    );
  }

  @override
  State<VehicleRentCreatePage> createState() => _VehicleRentCreatePageState();
}

class _VehicleRentCreatePageState extends State<VehicleRentCreatePage> {
  var _page = 0;

  @override
  void initState() {
    super.initState();
  }

  void _nextPage() => setState(() => ++_page);
  void _previousPage() => setState(() => --_page);

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = Entity.vehicleRent;

    return BlocListener<VehicleRentBloc, VehicleRentState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          action: action,
          entity: entity,
          size: SingleFormPanelSize.large,
          children: [
            MultiForm(
              page: _page,
              titles: [
                'vehicle_rent'.tr(),
                'destination'.tr(),
                'confirm'.tr(),
              ],
              children: [
                VehicleRentHeaderFormPage.prepare(
                  onNext: _nextPage,
                ),
                VehicleRentDestinationFormPage(
                  onNext: _nextPage,
                  onPrevious: _previousPage,
                ),
                VehicleRentConfirmFormLocal(
                  onPrevious: _previousPage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
