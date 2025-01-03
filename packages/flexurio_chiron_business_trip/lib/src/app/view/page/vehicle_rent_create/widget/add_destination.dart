import 'dart:async';

import 'package:flexurio_chiron_business_trip/src/app/bloc/search_latlng_from_city_query/search_latlng_from_city_query_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddDestinationPage extends StatefulWidget {
  const AddDestinationPage({
    super.key,
  });

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchLatLongFromCityQueryBloc(),
        ),
      ],
      child: const AddDestinationPage(),
    );
  }

  @override
  State<AddDestinationPage> createState() => _AddDestinationPageState();
}

class _AddDestinationPageState extends State<AddDestinationPage> {
  final _formKey = GlobalKey<FormState>();
  late double _latitudeController;
  late double _longitudeController;
  late double _latitude = -6.2354184;
  late double _longitude = 106.7824432;
  final _cityController = TextEditingController();
  final Set<Marker> _markers = {};
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late CameraPosition _newCameraPosition;
  late DataAction _action;
  List<Widget> actions = [];

  Future<void> _submit(BuildContext context) async {
    Navigator.pop(
      context,
      LatLng(_latitudeController, _longitudeController),
    );
  }

  Future<void> _search(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (_cityController.text.isNotEmpty) {
        context.read<SearchLatLongFromCityQueryBloc>().add(
              SearchLatLongFromCityQueryEvent.fetch(city: _cityController.text),
            );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _action = DataAction.add;
    actions = [
      Button(
        permission: null,
        isSecondary: true,
        onPressed: () => Navigator.pop(context),
        action: DataAction.cancel,
      ),
      const SizedBox(width: 12),
      Button(
        permission: null,
        action: _action,
        onPressed: () => _submit(context),
        color: Colors.grey,
      ),
    ];
  }

  void setSubmit(bool isSubmit) {
    actions = [];
    actions = [
      Button(
        permission: null,
        isSecondary: true,
        onPressed: () => Navigator.pop(context),
        action: DataAction.cancel,
      ),
      const SizedBox(width: 12),
    ];
    if (isSubmit == true) {
      actions.add(
        Button(
          permission: null,
          action: _action,
          onPressed: () => _submit(context),
        ),
      );
    } else {
      actions.add(
        Button(
          permission: null,
          action: _action,
          onPressed: () => _submit(context),
          color: Colors.grey,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = Entity.vehicleRentDestination;
    return Column(
      children: [
        const SizedBox(
          height: 200,
        ),
        SingleFormPanel(
          formKey: _formKey,
          actions: actions,
          action: action,
          entity: entity,
          visibleBackButton: false,
          children: [
            RowFields(
              children: [
                FTextFormField(
                  controller: _cityController,
                  labelText: 'city'.tr(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 150, top: 13),
                  child: BlocBuilder<SearchLatLongFromCityQueryBloc,
                      SearchLatLongFromCityQueryState>(
                    builder: (context, state) {
                      final status = state.maybeWhen(
                        loading: () => Status.progress,
                        loaded: (_) => Status.loaded,
                        orElse: () => Status.error,
                      );
                      return LightButtonSmall(
                        permission: null,
                        status: status,
                        action: DataAction.search,
                        onPressed: () => {
                          _search(context),
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            const Gap(15),
            BlocListener<SearchLatLongFromCityQueryBloc,
                SearchLatLongFromCityQueryState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (message) {
                    Toast(context).fail(message);
                  },
                  loaded: (latLng) {
                    _latitude = latLng.latitude;
                    _longitude = latLng.longitude;
                    _newCameraPosition = CameraPosition(
                      target: LatLng(_latitude, _longitude),
                      zoom: 19,
                    );
                    _setNewCameraPosition();
                    _markers.clear();
                  },
                );
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: GoogleMap(
                    myLocationEnabled: true,
                    tiltGesturesEnabled: false,
                    markers: Set<Marker>.of(_markers),
                    onTap: (latLng) {
                      _latitudeController = latLng.latitude;
                      _longitudeController = latLng.longitude;
                      _markers.clear();
                      if (_markers.isEmpty) {
                        setSubmit(false);
                        _onAddMarkerButtonPressed(latLng);
                      }
                    },
                    initialCameraPosition: CameraPosition(
                      zoom: 19,
                      target: LatLng(
                        _latitude,
                        _longitude,
                      ),
                    ),
                    onMapCreated: _controller.complete,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _setNewCameraPosition() async {
    final controller = await _controller.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
  }

  void _onAddMarkerButtonPressed(LatLng latLang) {
    setState(() {
      _markers.add(
        Marker(
          draggable: true,
          markerId: const MarkerId('id'),
          position: latLang,
          infoWindow: InfoWindow(
            title: 'Location',
            snippet: 'Lat, Long = $_latitudeController, $_longitudeController',
          ),
        ),
      );
      setSubmit(true);
    });
  }
}
