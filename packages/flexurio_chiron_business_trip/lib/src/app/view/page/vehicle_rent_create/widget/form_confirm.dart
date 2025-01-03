import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VehicleRentConfirmFormLocal extends StatefulWidget {
  const VehicleRentConfirmFormLocal({
    super.key,
    this.onPrevious,
  });

  final void Function()? onPrevious;

  @override
  State<VehicleRentConfirmFormLocal> createState() =>
      _VehicleRentConfirmFormLocalState();
}

class _VehicleRentConfirmFormLocalState
    extends State<VehicleRentConfirmFormLocal> {
  VehicleRentFormHeader? _vehicleRentFormHeader;
  late List<LatLng> _destinations = [];
  final _formKey = GlobalKey<FormState>();
  late int? _driver;
  late int? _user;
  late int? _requestBy;
  late double? _totalCost;
  late DateTime? _startDate;
  late DateTime? _endDate;
  late String? _description;
  Vehicle? _vehicle;
  Department? _department;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};
  late List<LatLng> points = [];
  late double _firstLatitude;
  late double _firstLongitude;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleRentBloc, VehicleRentState>(
      builder: (context, state) {
        state.maybeWhen(
          initial: (destinations, header) {
            if (header != null) {
              _vehicleRentFormHeader = header;
              _driver = header.driver;
              _vehicle = header.vehicle;
              _department = header.department;
              _user = header.user;
              _totalCost = header.totalCost;
              _startDate = header.startDate;
              _endDate = header.endDate;
              _description = header.description;
              _requestBy =
                  header.requestBy ?? UserRepositoryApp.instance.userApp!.id;
            }
            _destinations = destinations;
            if (_destinations.isNotEmpty) {
              final firstData = _destinations[0];
              _firstLatitude = firstData.latitude;
              _firstLongitude = firstData.longitude;
              final destinationLen = _destinations.length;
              for (var i = 0; i < destinationLen; i++) {
                final item = _destinations[i];
                _markers.add(
                  Marker(
                    markerId: MarkerId('id_${item.latitude}_${item.longitude}'),
                    position: item,
                    infoWindow: InfoWindow(
                      title: 'location',
                      snippet:
                          'Lat, Long = ${item.latitude}, ${item.longitude}',
                    ),
                  ),
                );
                points.add(item);
              }
              _polyline.add(
                Polyline(
                  polylineId: const PolylineId('polyline'),
                  points: points,
                  color: Colors.blue,
                  width: 3,
                ),
              );
            }
          },
          orElse: () {},
        );

        if (_vehicleRentFormHeader == null) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        final isProgress = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        final actions = <Widget>[
          Button(
            permission: null,
            isSecondary: true,
            action: DataAction.back,
            onPressed: () {
              widget.onPrevious!();
            },
          ),
          const SizedBox(width: 12),
          Button(
            permission: null,
            isInProgress: isProgress,
            action: DataAction.finish,
            onPressed: () {
              _submit(context);
            },
          ),
        ];

        return FormAction(
          isProgress: isProgress,
          actions: actions,
          key: _formKey,
          children: [
            RowFields(
              children: [
                TileDataVertical(
                  label: 'user'.tr(),
                  child: GetNameUser(userId: _user!),
                ),
                TileDataVertical(
                  label: 'request_by'.tr(),
                  child: Text(_requestBy!.toString()),
                ),
              ],
            ),
            const SizedBox(height: 5),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'department'.tr(),
                  child: Text(_department!.name),
                ),
                TileDataVertical(
                  label: 'vehicle'.tr(),
                  child: Text(_vehicle == null
                      ? '-'
                      : _vehicle!.vehicleRegistrationNumber),
                ),
              ],
            ),
            const SizedBox(height: 5),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'type'.tr(),
                  child: ChipType(_vehicleRentFormHeader!.type!),
                ),
              ],
            ),
            const SizedBox(height: 5),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'schedule_start'.tr(),
                  child: Text(
                    _startDate == null ? '' : _startDate!.yMMMMd,
                  ),
                ),
                TileDataVertical(
                  label: 'schedule_end'.tr(),
                  child: Text(
                    _endDate == null ? '' : _endDate!.yMMMMd,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'Driver',
                  child: GetNameUser(userId: _driver == null ? 0 : _driver!),
                ),
                TileDataVertical(
                  label: 'total_cost'.tr(),
                  child: Text(_totalCost!.idr),
                ),
              ],
            ),
            const SizedBox(height: 5),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'cost_per_kilometer'.tr(),
                  child: Text(_totalCost!.idr),
                ),
                TileDataVertical(
                  label: 'description'.tr(),
                  child: Text(_description!),
                ),
              ],
            ),
            const SizedBox(height: 40),
            RowFields(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: GoogleMap(
                      myLocationEnabled: true,
                      tiltGesturesEnabled: false,
                      markers: _markers,
                      polylines: _polyline,
                      initialCameraPosition: CameraPosition(
                        zoom: 9,
                        target: LatLng(
                          _firstLatitude,
                          _firstLongitude,
                        ),
                      ),
                    ),
                  ),
                ),
                SimpleTable<LatLng>(
                  width: 500,
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
                      title: 'Latitude',
                      width: 100,
                      builder: (destination, _) {
                        return Text(
                          destination.latitude.toStringAsFixed(5),
                        );
                      },
                    ),
                    TableColumnX(
                      title: 'Longitude',
                      width: 100,
                      builder: (destination, _) {
                        return Text(
                          destination.longitude.toStringAsFixed(5),
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
                  ],
                  data: _destinations,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _submit(BuildContext context) {
    final bloc = context.read<VehicleRentBloc>();
    const action = DataAction.create;
    showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<VehicleRentBloc, VehicleRentState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(
                  action,
                  Entity.vehicleRent,
                );
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<VehicleRentBloc, VehicleRentState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.vehicleRent,
                onConfirm: () {
                  bloc.add(
                    const VehicleRentEvent.create(),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
