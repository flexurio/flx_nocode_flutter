import 'package:flexurio_chiron_business_trip/src/app/bloc/vehicle_rent/vehicle_rent_bloc.dart';
import 'package:flexurio_chiron_business_trip/src/app/view/page/vehicle_rent_create/widget/delete_button_destination_local.dart';
import 'package:flexurio_chiron_business_trip/src/app/view/page/vehicle_rent_create/widget/get_address_name.dart';
import 'package:flexurio_chiron_business_trip/src/app/view/page/vehicle_rent_create/widget/pop_up_destination.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VehicleRentDestinationFormPage extends StatefulWidget {
  const VehicleRentDestinationFormPage({
    required this.onNext,
    required this.onPrevious,
    super.key,
  });

  final void Function() onNext;
  final void Function() onPrevious;

  @override
  State<VehicleRentDestinationFormPage> createState() =>
      _VehicleRentDestinationFormPageState();
}

class _VehicleRentDestinationFormPageState
    extends State<VehicleRentDestinationFormPage> {
  final _formKey = GlobalKey<FormState>();
  late List<LatLng> _destination = [];

  void _submit(BuildContext context) {
    if (_destination.isNotEmpty) {
      widget.onNext();
    } else {
      Toast(context).fail('Please input at least one destination');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleRentBloc, VehicleRentState>(
      builder: (context, state) {
        _destination = state.maybeWhen(
          initial: (destinations, __) => destinations,
          orElse: () => [],
        );
        return FormAction(
          formKey: _formKey,
          actions: [
            Button(
              permission: null,
              isSecondary: true,
              action: DataAction.back,
              onPressed: () {
                widget.onPrevious();
              },
            ),
            const SizedBox(width: 12),
            Button(
              permission: null,
              action: DataAction.next,
              onPressed: () => _submit(context),
            ),
          ],
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VehicleRentAddDestinationButton(
                      vehicleRentBloc: context.read<VehicleRentBloc>(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SimpleTable<LatLng>(
                  width: 830,
                  columns: [
                    TableColumnX(
                      title: 'No',
                      width: 50,
                      builder: (_, index) {
                        index++;
                        return Text(
                          index.toString(),
                        );
                      },
                    ),
                    TableColumnX(
                      title: 'coordinate'.tr(),
                      width: 200,
                      builder: (destination, _) {
                        final latLong =
                            '${destination.latitude.toStringAsFixed(5)}, ${destination.longitude.toStringAsFixed(5)}';
                        return Text(
                          latLong,
                        );
                      },
                    ),
                    TableColumnX(
                      title: 'address'.tr(),
                      builder: (destination, _) {
                        return GetAddressName.prepare(
                          latitude: destination.latitude.toString(),
                          longitude: destination.longitude.toString(),
                        );
                      },
                    ),
                    TableColumnX(
                      width: 80,
                      title: 'actions'.tr(),
                      builder: (destination, index) {
                        return Row(
                          children: [
                            DestinationFromLocalDeleteButton(
                              destination: destination,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                  data: _destination,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
