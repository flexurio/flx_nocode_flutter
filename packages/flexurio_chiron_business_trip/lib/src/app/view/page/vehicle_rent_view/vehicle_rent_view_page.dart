import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';

class VehicleRentViewPage extends StatefulWidget {
  const VehicleRentViewPage({
    required this.vehicleRent,
    super.key,
  });

  final VehicleRent vehicleRent;

  static Route<bool?> route({
    required VehicleRent vehicleRent,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => VehicleRentBloc(),
          ),
        ],
        child: VehicleRentViewPage(
          vehicleRent: vehicleRent,
        ),
      ),
    );
  }

  @override
  State<VehicleRentViewPage> createState() => _VehicleRentViewPageState();
}

class _VehicleRentViewPageState extends State<VehicleRentViewPage> {
  VehicleRentFormHeader? _vehicleRentFormHeader;
  late List<LatLng> _destinations = [];
  late int? _driver;
  late int? _user;
  late int? _requestBy;
  late String? _id;
  late double? _totalCost;
  late double? _initialKilometer;
  late double? _finalKilometer;
  late DateTime? _startDate;
  late DateTime? _endDate;
  late String? _description;
  late String? _status;
  late VehicleRentType? _vehicleRentType = VehicleRentType.empty;
  Vehicle? _vehicle;
  Department? _department;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};
  late List<LatLng> points = [];
  late double _firstLatitude = -6.2354184;
  late double _firstLongitude = 106.7824432;

  VehicleRentStatus _vehicleRentStatusFromString(String type) {
    if (type == VehicleRentStatus.input.status) {
      return VehicleRentStatus.input;
    }
    if (type == VehicleRentStatus.approveCs.status) {
      return VehicleRentStatus.approveCs;
    }
    if (type == VehicleRentStatus.approveManager.status) {
      return VehicleRentStatus.approveManager;
    }
    if (type == VehicleRentStatus.rejectCs.status) {
      return VehicleRentStatus.rejectCs;
    }
    if (type == VehicleRentStatus.rejectManager.status) {
      return VehicleRentStatus.rejectManager;
    }
    if (type == VehicleRentStatus.empty.status) {
      return VehicleRentStatus.empty;
    }
    if (type == VehicleRentStatus.closed.status) {
      return VehicleRentStatus.closed;
    } else {
      return VehicleRentStatus.empty;
    }
  }

  @override
  void initState() {
    super.initState();
    _vehicleRentFormHeader = VehicleRentFormHeader(
      id: widget.vehicleRent.id,
      driver: widget.vehicleRent.driverId,
      user: widget.vehicleRent.userId,
      requestBy: widget.vehicleRent.createdById,
      totalCost: widget.vehicleRent.totalCost,
      startDate: widget.vehicleRent.scheduledStartDate,
      endDate: widget.vehicleRent.scheduledEndDate,
      description: widget.vehicleRent.description,
      status: widget.vehicleRent.status.status,
      vehicle: widget.vehicleRent.vehicle,
      department: widget.vehicleRent.department,
      costPerKilometer: widget.vehicleRent.costPerKilometer,
      point: widget.vehicleRent.point,
      type: widget.vehicleRent.type,
    );
    _driver = widget.vehicleRent.driverId;
    _vehicle = widget.vehicleRent.vehicle;
    _department = widget.vehicleRent.department;
    _user = widget.vehicleRent.userId;
    _totalCost = widget.vehicleRent.totalCost;
    _initialKilometer = widget.vehicleRent.initialKilometer;
    _finalKilometer = widget.vehicleRent.finalKilometer;
    _startDate = widget.vehicleRent.scheduledStartDate;
    _endDate = widget.vehicleRent.scheduledEndDate;
    _description = widget.vehicleRent.description;
    _status = widget.vehicleRent.status.status;
    _id = widget.vehicleRent.id;
    _requestBy = widget.vehicleRent.createdById;
    _vehicleRentType = widget.vehicleRent.type;

    if (widget.vehicleRent.point != '') {
      _destinations = List<LatLng>.from(
        widget.vehicleRent.point!
            .replaceAll('[(', '')
            .replaceAll(')]', '')
            .replaceAll(',(', '')
            .split(')')
            .map(
              (e) => LatLng(
                double.parse(e.split(',')[0]),
                double.parse(e.split(',')[1]),
              ),
            )
            .toList(),
      );

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
              snippet: 'Lat, Long = ${item.latitude}, ${item.longitude}',
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
    context
        .read<VehicleRentBloc>()
        .add(VehicleRentEvent.fetchById(header: _vehicleRentFormHeader!));
  }

  void refreshData(List<LatLng> destinations, VehicleRentFormHeader? header) {
    if (header != null) {
      _vehicleRentFormHeader = header;
      _driver = header.driver;
      _vehicle = header.vehicle;
      _department = header.department;
      _user = header.user;
      _totalCost = header.totalCost;
      _initialKilometer = header.initialKilometer;
      _finalKilometer = header.finalKilometer;
      _startDate = header.startDate;
      _endDate = header.endDate;
      _description = header.description;
      _status = widget.vehicleRent.status.label;
      _id = widget.vehicleRent.id;
      _requestBy = widget.vehicleRent.createdById;
      _vehicleRentType = widget.vehicleRent.type;
    }
    if (destinations.isNotEmpty) {
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
                snippet: 'Lat, Long = ${item.latitude}, ${item.longitude}',
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VehicleRentBloc, VehicleRentState>(
      listener: (context, state) {
        state.maybeWhen(
          initial: (destinations, header) {
            refreshData(destinations, header);
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<VehicleRentBloc, VehicleRentState>(
        builder: (context, state) {
          state.maybeWhen(
            initial: (destinations, header) {
              refreshData(destinations, header);
            },
            orElse: () {},
          );

          if (_vehicleRentFormHeader == null) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          return SingleFormPanel(
            action: DataAction.view,
            entity: Entity.vehicleRent,
            size: SingleFormPanelSize.large,
            children: [
              if (widget.vehicleRent.status == VehicleRentStatus.input)
                Align(
                  alignment: Alignment.centerRight,
                  child: VehicleRentHeaderUpdateButton(
                    header: _vehicleRentFormHeader!,
                    bloc: context.read<VehicleRentBloc>(),
                    onSuccess: () {
                      context.read<VehicleRentBloc>().add(
                          VehicleRentEvent.fetchById(
                              header: _vehicleRentFormHeader!));
                    },
                  ),
                ),
              const SizedBox(height: 10),
              RowFields(
                children: [
                  TileDataVertical(
                    label: 'ID',
                    child: Text(_id!),
                  ),
                  TileDataVertical(
                    label: 'request_by'.tr(),
                    child: GetNameUser(userId: _requestBy!),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              RowFields(
                children: [
                  TileDataVertical(
                    label: 'user'.tr(),
                    child: GetNameUser(userId: _user!),
                  ),
                  TileDataVertical(
                    label: 'department'.tr(),
                    child: Text(_department!.name),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              RowFields(
                children: [
                  TileDataVertical(
                    label: 'type'.tr(),
                    child: ChipType(_vehicleRentType!),
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
                    label: 'vehicle'.tr(),
                    child: Text(_vehicle == null
                        ? '-'
                        : _vehicle!.vehicleRegistrationNumber == ''
                            ? '-'
                            : _vehicle!.vehicleRegistrationNumber),
                  ),
                  TileDataVertical(
                    label: 'Status',
                    child: ChipType(_vehicleRentStatusFromString(_status!)),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              RowFields(
                children: [
                  TileDataVertical(
                    label: 'Driver',
                    child: GetNameUser(userId: _driver ?? 0),
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
              const SizedBox(height: 5),
              RowFields(
                children: [
                  TileDataVertical(
                    label: 'initial_kilometer'.tr(),
                    child: Text('${_initialKilometer!} Km'),
                  ),
                  TileDataVertical(
                    label: 'final_kilometer'.tr(),
                    child: Text('${_finalKilometer!} Km'),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              if (widget.vehicleRent.status == VehicleRentStatus.input)
                Align(
                  alignment: Alignment.centerRight,
                  child: VehicleRentDestinationUpdateButton(
                    header: _vehicleRentFormHeader!,
                    destination: _destinations,
                    bloc: context.read<VehicleRentBloc>(),
                    onSuccess: () {
                      context.read<VehicleRentBloc>().add(
                          VehicleRentEvent.fetchById(
                              header: _vehicleRentFormHeader!));
                    },
                  ),
                ),
              const SizedBox(height: 10),
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
      ),
    );
  }
}
