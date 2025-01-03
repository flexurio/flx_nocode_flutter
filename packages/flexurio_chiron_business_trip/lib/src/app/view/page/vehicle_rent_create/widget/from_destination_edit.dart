import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';

class VehicleRentDestinationUpdateFormPage extends StatefulWidget {
  const VehicleRentDestinationUpdateFormPage({
    required this.header,
    required this.destination,
    super.key,
  });

  final VehicleRentFormHeader header;
  final List<LatLng> destination;

  static Route<bool?> route({
    required VehicleRentFormHeader header,
    required List<LatLng> destinations,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => VehicleRentBloc()
              ..add(
                VehicleRentEvent.addAllDestinationToLocal(
                  vehicleRentFormHeader: header,
                  destinations: destinations,
                ),
              ),
          ),
        ],
        child: VehicleRentDestinationUpdateFormPage(
          header: header,
          destination: destinations,
        ),
      ),
    );
  }

  @override
  State<VehicleRentDestinationUpdateFormPage> createState() =>
      _VehicleRentDestinationUpdateFormPageState();
}

class _VehicleRentDestinationUpdateFormPageState
    extends State<VehicleRentDestinationUpdateFormPage> {
  final _formKey = GlobalKey<FormState>();
  late List<LatLng> _destination = [];
  late final VehicleRentFormHeader _header = widget.header;

  void _submit(BuildContext context) {
    if (_destination.isNotEmpty) {
      context.read<VehicleRentBloc>().add(
            VehicleRentEvent.updateDestinations(
              vehicleRentFormHeader: _header,
              destinations: _destination,
            ),
          );
    } else {
      Toast(context).fail('Please input at least one destination');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VehicleRentBloc, VehicleRentState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context)
                .dataChanged(DataAction.edit, Entity.vehicleRentDestination);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          action: DataAction.edit,
          entity: Entity.vehicleRent,
          formKey: _formKey,
          size: SingleFormPanelSize.large,
          actions: [
            Button(
              permission: Permission.vehicleRentEdit,
              action: DataAction.edit,
              onPressed: () => _submit(context),
            ),
          ],
          children: [
            BlocBuilder<VehicleRentBloc, VehicleRentState>(
              builder: (context, state) {
                _destination = state.maybeWhen(
                  initial: (destinations, __) => destinations,
                  orElse: () => [],
                );
                return Column(
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
                          title: 'Coordinate',
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
                          title: 'Action',
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
