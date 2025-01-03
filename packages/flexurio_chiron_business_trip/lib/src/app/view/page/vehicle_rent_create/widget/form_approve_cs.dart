import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ApproveCsFormPage extends StatefulWidget {
  const ApproveCsFormPage._(
      {required this.vehicleRent, required this.vehicleRentBloc});

  final VehicleRent vehicleRent;
  final VehicleRentBloc vehicleRentBloc;

  static Widget prepare({
    required VehicleRent vehicleRent,
    required VehicleRentBloc VehicleRentBloc,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VehicleQueryBloc()
            ..add(VehicleQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
              isActive: true,
            )),
        ),
        BlocProvider(
          create: (context) => DriverQueryBloc()
            ..add(
              DriverQueryEvent.get(department: Department.empty()),
            ),
        ),
      ],
      child: ApproveCsFormPage._(
        vehicleRent: vehicleRent,
        vehicleRentBloc: VehicleRentBloc,
      ),
    );
  }

  @override
  State<ApproveCsFormPage> createState() => _ApproveCsFormPageState();
}

class _ApproveCsFormPageState extends State<ApproveCsFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _scheduleStartController = TextEditingController();
  final _scheduleEndController = TextEditingController();

  Employee? _driver;
  Vehicle? _vehicle;

  @override
  void initState() {
    super.initState();
    _vehicle = widget.vehicleRent.vehicle!;
    _scheduleStartController.text = DateFormat('MMMM dd yyyy')
        .format(widget.vehicleRent.scheduledStartDate);
    _scheduleEndController.text =
        DateFormat('MMMM dd yyyy').format(widget.vehicleRent.scheduledEndDate);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleRentBloc, VehicleRentState>(
      bloc: widget.vehicleRentBloc,
      builder: (context, state) {
        return SingleFormPanel(
          formKey: _formKey,
          visibleBackButton: false,
          action: DataAction.approveCs,
          entity: Entity.vehicleRent,
          actions: [
            Button(
              permission: null,
              isSecondary: true,
              action: DataAction.cancel,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(width: 12),
            Button(
              isInProgress: state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              ),
              permission: null,
              action: DataAction.update,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.vehicleRentBloc.add(
                    VehicleRentEvent.approveCs(
                        vehicleRent: widget.vehicleRent,
                        vehicle: _vehicle!,
                        driverId: int.parse(
                          _driver!.nip,
                        )),
                  );
                  // Navigator.pop(context);
                }
              },
            )
          ],
          children: [
            RowFields(children: [
              FTextFormField(
                controller: _scheduleStartController,
                labelText: 'Schedule Start Date',
                validator: requiredValidator.call,
                enabled: false,
              ),
              FTextFormField(
                controller: _scheduleEndController,
                labelText: 'Schedule End Date',
                validator: requiredValidator.call,
                enabled: false,
              ),
            ]),
            const Gap(20),
            UsersBuilder(builder: (users) {
              if (widget.vehicleRent.driverId != null) {
                _driver = users.find(widget.vehicleRent.driverId!.toString());
              }
              return BlocBuilder<DriverQueryBloc, DriverQueryState>(
                builder: (context, state) {
                  return FDropDownSearch<Employee>(
                    initialValue: _driver,
                    labelText: 'Driver',
                    itemAsString: (driver) => driver.name,
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (driver, nip) => driver
                          .where((element) => nip.contains(element.nip))
                          .toList(),
                    ),
                    status: state.maybeWhen(
                      error: (_) => Status.error,
                      loading: () => Status.progress,
                      orElse: () => Status.loaded,
                    ),
                    onChanged: (driver) {
                      if (driver != null) {
                        _driver = driver;
                      }
                    },
                  );
                },
              );
            }),
            const Gap(20),
            BlocBuilder<VehicleQueryBloc, VehicleQueryState>(
              builder: (context, state) {
                return FDropDownSearch<Vehicle>(
                  initialValue: _vehicle!.vehicleRegistrationNumber == ''
                      ? null
                      : _vehicle,
                  labelText: 'Vehicle',
                  items: state.maybeWhen(
                    loaded: (vehicle) => vehicle.data,
                    orElse: () => [],
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      _vehicle = value;
                    }
                  },
                  itemAsString: (vehicle) => vehicle.vehicleRegistrationNumber,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
