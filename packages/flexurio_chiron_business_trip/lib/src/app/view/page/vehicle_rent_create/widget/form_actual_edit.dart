import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class VehicleRentActualStartUpdateFormPage extends StatefulWidget {
  const VehicleRentActualStartUpdateFormPage({
    required this.destination,
    required this.vehicleRent,
    required this.type,
    super.key,
  });

  final VehicleRent vehicleRent;
  final List<LatLng> destination;
  final String type;

  static Route<bool?> route({
    required VehicleRent vehicleRent,
    required List<LatLng> destinations,
    required String type,
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
                  destinations: destinations,
                ),
              ),
          ),
        ],
        child: VehicleRentActualStartUpdateFormPage(
          destination: destinations,
          vehicleRent: vehicleRent,
          type: type,
        ),
      ),
    );
  }

  @override
  State<VehicleRentActualStartUpdateFormPage> createState() =>
      _VehicleRentActualStartUpdateFormPageState();
}

class _VehicleRentActualStartUpdateFormPageState
    extends State<VehicleRentActualStartUpdateFormPage> {
  final _formKey = GlobalKey<FormState>();
  late List<LatLng> _destination = [];
  late final VehicleRent _vehicleRent = widget.vehicleRent;
  late final int _user = widget.vehicleRent.userId;
  late int? _driver = widget.vehicleRent.driverId;
  late final DateTime _scheduleStartDate =
      widget.vehicleRent.scheduledStartDate;
  late final DateTime _scheduleEndDate = widget.vehicleRent.scheduledEndDate;
  late Vehicle? _vehicle = widget.vehicleRent.vehicle;
  late final Department _department = widget.vehicleRent.department;
  late final String _description = widget.vehicleRent.description;
  late PlatformFile _file;
  late List<PlatformFile> _files = [];

  DateTime _actualDate = DateTime.now();
  final _kiloMeterController = TextEditingController();
  final _actualDateController = TextEditingController();
  final _fuelController = TextEditingController();
  final _vehicleCheckController = TextEditingController();

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (_files.isNotEmpty) {
        if (widget.type == 'start') {
          context.read<VehicleRentBloc>().add(
                VehicleRentEvent.updateActualStart(
                  vehicleRent: _vehicleRent,
                  startDate: _actualDate,
                  actualKilometer:
                      stringDecimalToDouble(_kiloMeterController.text),
                  fuelBar: int.parse(_fuelController.text),
                  vehicleCheckNote: _vehicleCheckController.text,
                  attachments: _files,
                ),
              );
        } else if (widget.type == 'end') {
          var actualKilometer =
              stringDecimalToDouble(_kiloMeterController.text);
          if (widget.vehicleRent.initialKilometer < actualKilometer) {
            context.read<VehicleRentBloc>().add(
                  VehicleRentEvent.updateActualEnd(
                    vehicleRent: _vehicleRent,
                    endDate: _actualDate,
                    actualKilometer: actualKilometer,
                    fuelBar: int.parse(_fuelController.text),
                    vehicleCheckNote: _vehicleCheckController.text,
                    attachments: _files,
                  ),
                );
          } else {
            Toast(context).fail('error.required_value_higher_than_or_equal_to'
                .tr(namedArgs: {
              'first': 'Final Kilometer',
              'second': 'Initial Kilometer'
            }));
          }
        } else {
          Toast(context).fail('Please input actual date actual kilometer');
        }
      } else {
        Toast(context).fail('Please upload images');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VehicleRentBloc, VehicleRentState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(DataAction.edit, Entity.vehicleRent);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          action: DataAction.update,
          entity: Entity.vehicleRent,
          formKey: _formKey,
          size: SingleFormPanelSize.large,
          actions: [
            Button(
              permission: Permission.vehicleRentEdit,
              action: DataAction.update,
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
                return RowFields(
                  children: [
                    Column(
                      children: [
                        TileDataVertical(
                          label: 'User',
                          child: GetNameUser(userId: _user),
                        ),
                        TileDataVertical(
                          label: 'Vehicle',
                          child: Text(_vehicle == null
                              ? ''
                              : _vehicle!.vehicleRegistrationNumber),
                        ),
                        TileDataVertical(
                          label: 'Driver',
                          child: GetNameUser(
                              userId: _driver == null ? 0 : _driver!),
                        ),
                        TileDataVertical(
                          label: 'Schedule Start Date',
                          child: Text(
                            _scheduleStartDate.yMMMMd,
                          ),
                        ),
                        TileDataVertical(
                          label: 'Schedule End Date',
                          child: Text(
                            _scheduleEndDate.yMMMMd,
                          ),
                        ),
                        TileDataVertical(
                          label: 'Department',
                          child: Text(_department.name),
                        ),
                        TileDataVertical(
                          label: 'Description',
                          child: Text(_description),
                        ),
                      ],
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
                      ],
                      data: _destination,
                    ),
                  ],
                );
              },
            ),
            const Gap(20),
            FieldDatePicker(
              onChanged: (value) => _actualDate = value,
              controller: _actualDateController,
              initialSelectedDate: _actualDate,
              validator: requiredObjectValidator.call,
              labelText: widget.type == 'start' ? 'Period Start' : 'Period End',
            ),
            const Gap(20),
            FTextFormField(
              controller: _kiloMeterController,
              labelText: widget.type == 'start'
                  ? 'Initial Kilometer'
                  : 'Final Kilometer',
              validator: requiredValidator.call,
              inputFormatters: [
                ThousandsFormatter(),
              ],
            ),
            const Gap(20),
            RowFields(
              children: [
                FTextFormField(
                  controller: _fuelController,
                  labelText: 'Fuel Bar',
                  maxLength: 1,
                  validator: requiredValidator.call,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                FTextFormField(
                  controller: _vehicleCheckController,
                  labelText: 'Vehicle Check',
                  validator: requiredValidator.call,
                  maxLines: 4,
                ),
              ],
            ),
            const Gap(20),
            ChooseFile(
              onChange: (files) {
                setState(() {
                  _files.addAll(files);
                });
              },
              type: const ['jpg', 'jpeg', 'png'],
              multiple: true,
              onPickFile: pickFile,
            ),
          ],
        ),
      ),
    );
  }
}
